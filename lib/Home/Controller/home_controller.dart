import 'dart:math' as math;
import 'dart:math';
import 'package:ebac_flutter/Common/Model/catalog.dart';
import 'package:ebac_flutter/Common/Model/pokemon.dart';
import 'package:ebac_flutter/Home/Controller/ihome_page_repository.dart';
import 'package:ebac_flutter/Home/Widgets/custom_carousel_slider.dart';
import 'package:flutter/material.dart';

// imports para compartilhar
import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';

class HomePageController {
  final String name;
  final detailSearchController = TextEditingController();
  final IHomePageRepository ihomePageRepository;

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<bool> isRefreshCustomOn = ValueNotifier(false);
  ValueNotifier<List<String>> typeList = ValueNotifier([]);
  ValueNotifier<Catalog> fullCatalog = ValueNotifier(Catalog(pokemons: []));
  ValueNotifier<List<CustomCarouselSlider>> customCarouselSliders =
      ValueNotifier([]);
  ValueNotifier<List<CustomCarouselSlider>> recentlyAdded = ValueNotifier([]);

  HomePageController({
    required this.name,
    required this.ihomePageRepository,
  });

  var random = Random();

  // Method for search pokemons
  Future<Catalog> getPokemon() async {
    isRefreshCustomOn.value = true;
    var catalog = await ihomePageRepository.getPokemon();
    await _processData(catalog);
    isRefreshCustomOn.value = false;
    return fullCatalog.value;
  }

  Future<Pokemon> getPokemonDetail(Pokemon inputPokemon) async {
    var pokemon = await ihomePageRepository.getPokemonDetail(inputPokemon);
    return pokemon;
  }

  Future<void> _processData(Catalog catalog) async {
    fullCatalog.value = catalog;
    _generatetypeList();
    await _createGenreCarouselSlider(true);
    await Future.delayed(const Duration(seconds: 1));
  }

  void _generatetypeList() {
    typeList.value = [];
    if (fullCatalog.value.pokemons != null) {
      for (var pokemon in fullCatalog.value.pokemons!) {
        if (pokemon.types != null) {
          for (var e in pokemon.types!) {
            if (!typeList.value.contains(e)) {
              typeList.value.add(e);
            }
          }
        }
      }
    }
  }

  Future<List<CustomCarouselSlider>> _createGenreCarouselSlider(
      bool showType) async {
    customCarouselSliders.value = [];
    recentlyAdded.value = [];

    if (fullCatalog.value.pokemons!.isEmpty) {
      return [];
    }

    await _processtypeListData(showType);

    fullCatalog.value.pokemons!.shuffle(random);

    recentlyAdded.value.add(
      CustomCarouselSlider(
          name: name,
          type: 'Recently Added',
          showType: showType,
          initialPage: 0,
          homePageController: this,
          pokemons: fullCatalog.value.pokemons!.length <= 5
              ? fullCatalog.value.pokemons!
              : fullCatalog.value.pokemons!.take(5).toList()),
    );
    return customCarouselSliders.value;
  }

  Future<void> _processtypeListData(bool showType) async {
    if (showType) {
      for (var type in typeList.value) {
        var pokemons = fullCatalog.value.pokemons!
            .where((element) => element.types!.contains(type))
            .toList();

        List<Pokemon> pokemonList = [];
        for (var element in pokemons) {
          pokemonList.add(
            element.copyWith(
              id: element.id,
              name: element.name,
              habitat: element.habitat,
              shape: element.shape,
              color: element.color,
              sprites: element.sprites,
              types: element.types,
            ),
          );
        }
        pokemonList.shuffle(random);

        customCarouselSliders.value.add(
          CustomCarouselSlider(
            name: name,
            type: type,
            initialPage: math.Random().nextInt(pokemons.length),
            pokemons: pokemonList,
            showType: showType,
            homePageController: this,
          ),
        );
      }
    } else {
      List<Pokemon> pokemonList = [];
      for (var element in fullCatalog.value.pokemons!) {
        pokemonList.add(
          element.copyWith(
            id: element.id,
            name: element.name,
            habitat: element.habitat,
            shape: element.shape,
            color: element.color,
            sprites: element.sprites,
            types: element.types,
          ),
        );
      }
      pokemonList.shuffle(random);

      customCarouselSliders.value.add(
        CustomCarouselSlider(
          name: name,
          type: '',
          initialPage:
              math.Random().nextInt(fullCatalog.value.pokemons!.length),
          pokemons: pokemonList,
          showType: showType,
          homePageController: this,
        ),
      );

      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  String generateTag() {
    return DateTime.now().microsecondsSinceEpoch.toString();
  }

  Future<void> capturePng(GlobalKey globalKey) async {
    final RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    Directory temp = await getTemporaryDirectory();
    File tempImage = File('${temp.path}\\tempimage.png');
    tempImage.writeAsBytesSync(pngBytes);
    if (kDebugMode) {
      print(tempImage.path);
    }
    Share.shareXFiles([XFile(tempImage.path)]);
  }
}
