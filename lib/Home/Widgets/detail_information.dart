import 'package:flutter/material.dart';

import '../../Common/Model/arguments.dart';
import 'detail_line.dart';

class DetailInformation extends StatelessWidget {
  const DetailInformation({
    super.key,
    required this.arguments,
  });

  final Arguments arguments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DetailLine(titulo: 'ID', conteudo: arguments.pokemon!.id.toString()),
          DetailLine(titulo: 'Nome', conteudo: arguments.pokemon!.name),
          DetailLine(titulo: 'Habitat', conteudo: arguments.pokemon!.habitat!),
          DetailLine(titulo: 'Forma', conteudo: arguments.pokemon!.shape!),
          DetailLine(titulo: 'Cor', conteudo: arguments.pokemon!.color!),
          DetailLine(
              titulo: arguments.pokemon!.types!.length > 1 ? 'Tipos' : 'Tipo',
              conteudo2: arguments.pokemon!.types!),
        ],
      ),
    );
  }
}
