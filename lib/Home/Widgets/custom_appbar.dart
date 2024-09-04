import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:ebac_flutter/Home/Widgets/botao_compartilhar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.arguments,
    required this.globalKey,
    required this.isDetailPage,
  });

  final String title;
  final Arguments arguments;
  final GlobalKey globalKey;
  final bool isDetailPage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // centerTitle: true,
      // leadingWidth: 60,
      foregroundColor: AppStyle.mainColor,
      title: Text(
        capitalize(title),
        style: const TextStyle(
          color: AppStyle.mainColor,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        isDetailPage
            ? BotaoCompartilhar(arguments: arguments, globalKey: globalKey)
            : SizedBox(),
      ],
    );
  }

  // implements PreferredSizeWidget - força implementar esse método
  @override
  Size get preferredSize => const Size.fromHeight(60);

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
