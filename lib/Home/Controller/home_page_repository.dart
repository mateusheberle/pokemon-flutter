// implementation for home page controller
import 'dart:convert';
import 'dart:math';

import 'package:ebac_flutter/Common/Model/catalog.dart';
import 'package:ebac_flutter/Common/Model/pokemon.dart';
import 'package:ebac_flutter/Common/utils.dart';
import 'package:ebac_flutter/Home/Controller/ihome_page_repository.dart';
import 'package:http/http.dart';

class HomePageRepository implements IHomePageRepository {
  final Client client;

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

    List<Future<void>> futures = [];

    for (var pokemon in pokemons) {
      futures.add(fetchPokemonDetails(pokemon));
    }

    await Future.wait(futures);

    return Catalog(pokemons: pokemons);
  }

  Future<void> fetchPokemonDetails(Pokemon pokemon) async {
    try {
      var url2 = Uri.https(baseUrl, '$urlPokemons2/${pokemon.name}');
      var response2 = await client.get(url2);
      if (response2.statusCode == 200) {
        final map2 = jsonDecode(response2.body);
        pokemon.types =
            List<String>.from(map2['types'].map((x) => x['type']['name']));
        pokemon.sprites =
            map2['sprites']['other']['dream_world']['front_default'];
      } else {
        print('Erro ao buscar detalhes do Pokémon: ${response2.statusCode}');
      }
    } catch (e) {
      print('Erro ao buscar detalhes do Pokémon: $e');
    }
  }

  @override
  Future<Pokemon> getPokemonDetail(Pokemon pokemon) async {
    print(pokemon.name);
    var url = Uri.https(baseUrl, '$urlPokemons1/${pokemon.id}');
    var response = await client.get(url);
    final map = jsonDecode(response.body);
    pokemon.habitat = map['habitat']['name'];
    pokemon.color = map['color']['name'];
    pokemon.shape = map['shape']['name'];

    var url2 = Uri.https(baseUrl, '$urlPokemons2/${pokemon.name}');
    var response2 = await client.get(url2);
    final map2 = jsonDecode(response2.body);

    pokemon.types =
        List<String>.from(map2['types'].map((x) => x['type']['name']));
    return pokemon;
  }
}
