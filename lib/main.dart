import 'package:flutter/material.dart';
import 'Login/Page/login_page.dart';
import 'Common/utils.dart';
import 'Home/Page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkAlreadyLoggedIn();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'EBAC Pokémon';
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      home:
          globalUser == null ? const LoginPage() : const HomePage(title: title),
      routes: <String, WidgetBuilder>{
        '/loginPage': (BuildContext context) => const LoginPage(),
        '/homePage': (BuildContext context) => const HomePage(
              title: title,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
