import 'dart:convert';

import 'package:ebac_flutter/Common/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserModel? globalUser;
Future<bool> checkAlreadyLoggedIn() async {
  // iniciando sharedPreferences
  final prefs = await startSharedPreferences();

  if (!await _getKeepLoggedInValue(prefs)) {
    return false;
  }

  // recuperar o valor do permanecer logado
  final userModel = prefs.getString('userModel');

  if (userModel == null || userModel.isEmpty) {
    return false;
  }

  globalUser = UserModel.fromJson(jsonDecode(userModel));

  return true;
}

Future<bool> _getKeepLoggedInValue(SharedPreferences prefs) async {
  // recuperando o valor de permanecer logado
  return prefs.getBool('keepLoggedIn') ?? false;
}

Future<SharedPreferences> startSharedPreferences() async {
  // iniciando sharedPreferences
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

// Urls
const baseUrl = 'pokeapi.co';

const urlPokemons = 'api/v2/generation/1/';
const urlPokemons1 = 'api/v2/pokemon-species/';
const urlPokemons2 = 'api/v2/pokemon/';
