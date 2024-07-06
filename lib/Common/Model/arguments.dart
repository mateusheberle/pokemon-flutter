import '../../Home/Controller/home_controller.dart';
import 'pokemon.dart';

class Arguments {
  final String tag;
  final Pokemon? pokemon;
  final HomePageController homePageController;

  Arguments({
    required this.tag,
    required this.pokemon,
    required this.homePageController,
  });
}
