import 'package:flutter/material.dart';

import '../../Common/Model/arguments.dart';
import '../Widgets/custom_appbar.dart';
import '../Widgets/detail_image.dart';

import '../../Common/appstyle.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<PokemonDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<PokemonDetail> {
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

    // Start animations
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
        title: widget.name,
        arguments: arguments,
        globalKey: _globalKey,
        isDetailPage: true,
      ),
      body: RepaintBoundary(
        key: _globalKey,
        child: Stack(
          children: [
            Container(
              color: AppStyle.mainBackground,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DetailImage(arguments: arguments, crossFade: crossFade),
            ),
          ],
        ),
      ),
    );
  }
}
