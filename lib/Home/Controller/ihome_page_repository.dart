// Interface for Home Page Controller

import '../../Common/Model/catalog.dart';

abstract class IHomePageRepository {
  Future<Catalog> getPokemon();
}
