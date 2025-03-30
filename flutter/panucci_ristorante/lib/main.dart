import 'package:flutter/material.dart';
import 'package:panucci_ristorante/screens/checkout.dart';
import 'package:panucci_ristorante/screens/home.dart';
import 'package:panucci_ristorante/screens/orders.dart';

void main() {
  runApp(const PanucciRistorante());
}

class PanucciRistorante extends StatelessWidget {
  const PanucciRistorante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Panucci Ristorante",
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/pedidos': (context) => Orders(),
        '/checkout': (context) => Checkout()
      },
    );
  }
}
