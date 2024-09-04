import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:ebac_flutter/Common/Model/pokemon.dart';
import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:ebac_flutter/Home/Widgets/custom_appbar.dart';
import 'package:ebac_flutter/Home/Widgets/detail_image.dart';
import 'package:flutter/material.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  final _globalKey = GlobalKey();
  ValueNotifier<bool> crossFade = ValueNotifier(false);
  ValueNotifier<bool> printMovieDetail = ValueNotifier(false);

// Extract data from incoming arguments
  Arguments extractArguments(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Arguments;
    return arguments;
  }

  // Animation crossfade for detail Widgets
  Future<void> startCrossFade() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    crossFade.value = true;
  }

  @override
  void initState() {
    super.initState();
    startCrossFade();
  }

  @override
  void dispose() {
    crossFade.dispose();
    printMovieDetail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Arguments arguments = extractArguments(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.pokemon.name,
        arguments: arguments,
        globalKey: _globalKey,
        isDetailPage: true,
      ),
      body:
          // FutureBuilder<void>(
          // future: HomePageRepository(Client()).getPokemonDetail(widget.pokemon),
          // builder: (context, snapshot) {
          //   if (snapshot.connectionState == ConnectionState.waiting) {
          //     return Center(child: CircularProgressIndicator());
          //   } else if (snapshot.hasError) {
          //     return Center(child: Text('Erro ao carregar detalhes do pokemon'));
          //   } else {
          //     return
          RepaintBoundary(
        key: _globalKey,
        child: Stack(
          children: [
            Container(
              color: AppStyle.mainBackground,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DetailImage(
                arguments: arguments,
                crossFade: crossFade,
              ),
            ),
          ],
        ),
      ),
      //     }
      //   },
      // ),
    );
  }
}
