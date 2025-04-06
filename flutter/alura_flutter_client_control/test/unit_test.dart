// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:client_control/models/client.dart';
import 'package:client_control/models/client_type.dart';
import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Clients Text', () {
    final shayron = Client(
        name: 'shayron',
        email: 'shayron.aguiar@gmail.com',
        type: ClientType(name: 'Diamond', icon: Icons.diamond));

    test(' Clientes model should  add new client', () {
      final clients = Clients(clients: []);
      clients.add(shayron);
      expect(clients.clients, [shayron]);
    });
    test(' Clients model should  remove client', () {
      final clients = Clients(clients: [shayron, shayron, shayron]);
      clients.remove(0);
      clients.remove(1);
      expect(clients.clients, [shayron]);
    });
  });

  group('Types test', () {
    final diamond = ClientType(name: 'Diamond', icon: Icons.diamond);

    test('Types model should add new type', () {
      final types = Types(types: []);
      types.add(diamond);
      expect(types.types, [diamond]);
    });

    test('Types model should remove type', () {
      final types = Types(types: [diamond, diamond, diamond]);
      types.remove(0);
      types.remove(1);
      expect(types.types, [diamond]);
    });
  });
}
