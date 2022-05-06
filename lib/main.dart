import 'package:flutter/material.dart';
import 'package:pokedex/routes/app_routes.dart';
import 'package:pokedex/screens/detail_screen.dart';
import 'package:pokedex/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.detail: (context) => const DetailScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
