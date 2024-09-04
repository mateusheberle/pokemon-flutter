import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:ebac_flutter/Home/Widgets/detail_line.dart';
import 'package:ebac_flutter/Home/Controller/home_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DetailInformation extends StatelessWidget {
  const DetailInformation({
    super.key,
    required this.arguments,
  });

  final Arguments arguments;

  @override
  Widget build(BuildContext context) {
    // print(arguments.pokemon!.id);
    // print(arguments.pokemon!.name);
    // print(arguments.pokemon!.habitat);
    // print(arguments.pokemon!.shape);
    // print(arguments.pokemon!.color);
    // print(arguments.pokemon!.types);
    return FutureBuilder<void>(
      future: HomePageRepository(Client()).getPokemonDetail(arguments.pokemon),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar detalhes do pokemon'));
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DetailLine(
                    titulo: 'ID', conteudo: arguments.pokemon.id.toString()),
                DetailLine(titulo: 'Nome', conteudo: arguments.pokemon.name),
                DetailLine(
                    titulo: 'Habitat', conteudo: arguments.pokemon.habitat!),
                DetailLine(titulo: 'Forma', conteudo: arguments.pokemon.shape!),
                DetailLine(titulo: 'Cor', conteudo: arguments.pokemon.color!),
                DetailLine(
                    titulo:
                        arguments.pokemon.types!.length > 1 ? 'Tipos' : 'Tipo',
                    conteudo2: arguments.pokemon.types!),
              ],
            ),
          );
        }
      },
    );
  }
}
