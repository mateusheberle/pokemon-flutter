// implementation for home page controller
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../Common/Model/pokemon.dart';
import '../../Common/utils.dart';
import '../../Common/Model/catalog.dart';
import 'ihome_page_repository.dart';

class HomePageRepository implements IHomePageRepository {
  final Client client;

  ValueNotifier<int> porcentagem = ValueNotifier(0);

  HomePageRepository(this.client);
  var random = Random();

  @override
  Future<Catalog> getPokemon() async {
    var url = Uri.https(baseUrl, urlPokemons);
    var response = await client.get(url);
    final map = jsonDecode(response.body);
    var pokemons = List<Pokemon>.empty(growable: true);
    for (var pokemon in map['pokemon_species']) {
      List<String> lastPart = (pokemon['url']).split('pokemon-species/');
      List<String> part = lastPart.last.split('/');
      int id = int.parse(part[0]);
      pokemons.add(Pokemon(
        id: id,
        name: pokemon['name'],
      ));
    }
    pokemons.sort((a, b) => a.id.compareTo(b.id));

    int index = 0;
    for (var pokemon in pokemons) {
      var url = Uri.https(baseUrl, '$urlPokemons1/${pokemon.id}');
      var response = await client.get(url);
      final map = jsonDecode(response.body);
      pokemon.habitat = map['habitat']['name'];
      pokemon.color = map['color']['name'];
      pokemon.shape = map['shape']['name'];

      var url2 = Uri.https(baseUrl, '$urlPokemons2/${pokemon.name}');
      var response2 = await client.get(url2);
      final map2 = jsonDecode(response2.body);
      List<String> imagens = List<String>.empty(growable: true);
      imagens.add(
          map2['sprites']['other']['dream_world']['front_default']); // .svg
      imagens.add(map2['sprites']['other']['home']['front_default']); // .png
      // imagens.add(map2['sprites']['front_default']); // .png mini
      // imagens.add(map2['sprites']['back_default']); // .png mini
      // imagens.add(map2['sprites']['other']['official-artwork']['front_default']); // .png
      // imagens.add(map2['sprites']['other']['showdown']['front_default']); // .gif mini
      // imagens.add(map2['sprites']['other']['showdown']['back_default']); // .gif mini
      pokemon.types =
          List<String>.from(map2['types'].map((x) => x['type']['name']));
      pokemon.sprites = imagens;

      porcentagem.value = ((index / pokemons.length) * 100).toInt();
      index++;
    }

    return Catalog(pokemons: pokemons);
  }
}
