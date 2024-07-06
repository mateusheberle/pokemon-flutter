import 'package:flutter/material.dart';

class DetailLine extends StatelessWidget {
  const DetailLine({
    super.key,
    required this.titulo,
    this.conteudo,
    this.conteudo2,
  });

  final String titulo;
  final String? conteudo;
  final List<String>? conteudo2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: conteudo2 == null ? 50 : conteudo2!.length * 50,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(color: Colors.greenAccent, width: 2.0),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10.0),
                ),
              ),
              child: Text(
                titulo,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: conteudo2 == null ? 50 : conteudo2!.length * 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.greenAccent, width: 2.0),
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(10.0),
                ),
              ),
              child: conteudo2 == null
                  ? Text(
                      capitalize(conteudo!),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: conteudo2!.map(
                        (element) {
                          return Text(
                            capitalize(element),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ).toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  String capitalize(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }
}
