import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'Login/Page/login_page.dart';
import 'Common/utils.dart';
import 'Home/Page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkAlreadyLoggedIn();
  runApp(const MyApp());
  // runApp(DevicePreview(
  //   builder: (context) => const MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'Pokémon';
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      home: HomePage(title: title),
      routes: <String, WidgetBuilder>{
        '/homePage': (BuildContext context) => const HomePage(
              title: title,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
