// Interface for Home Page Controller

import 'package:ebac_flutter/Common/Model/catalog.dart';
import 'package:ebac_flutter/Common/Model/pokemon.dart';

abstract class IHomePageRepository {
  Future<Catalog> getPokemon();
  Future<Pokemon> getPokemonDetail(Pokemon pokemon);
}
