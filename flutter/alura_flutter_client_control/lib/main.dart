import 'package:client_control/models/client_type.dart';
import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:client_control/pages/client_types_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/clients_page.dart';

void main({List<String>? list = const [], Key? providerKey = const Key('')}) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Clients(clients: []),
      ),
      ChangeNotifierProvider(
        create: (context) => Types(types: [
          ClientType(name: 'Platinum', icon: Icons.credit_card),
          ClientType(name: 'Golden', icon: Icons.card_membership),
          ClientType(name: 'Titanium', icon: Icons.credit_score),
          ClientType(name: 'Diamond', icon: Icons.diamond),
        ]),
      ),
    ],
    child: MyApp(key: providerKey),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de clientes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: false),
      initialRoute: '/',
      routes: {
        '/': (context) => const ClientsPage(title: 'Clientes'),
        '/tipos': (context) => const ClientTypesPage(title: 'Tipos de cliente'),
      },
    );
  }
}
