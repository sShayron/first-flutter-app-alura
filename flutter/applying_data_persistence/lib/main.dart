import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';
import 'package:nosso_primeiro_projeto/screens/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent)),
      initialRoute: '/',
      routes: {
        '/': (context) => InitialScreen(),
        '/form': (context) => FormScreen(),
      },
    );
  }
}
