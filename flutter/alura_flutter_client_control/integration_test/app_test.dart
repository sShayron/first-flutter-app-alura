import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Testando o app', (WidgetTester tester) async {
    final providerKey = GlobalKey<NavigatorState>();

    app.main(list: [], providerKey: providerKey);
    await tester.pumpAndSettle();

    // Testando se a tela inicial
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Testando drawer menu
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    // Testando navegação para a tela de tipos de clientes
    await tester.tap(find.text('Tipos de clientes'));
    await tester.pumpAndSettle();

    expect(find.text('Tipos de cliente'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);

    // Testando criação de novo tipo de cliente
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Selecionar icone'), findsOneWidget);
    expect(find.text('Cadastrar tipo'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Ferro');
    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    // Testa se o provider de tipos de clientes foi atualizado
    expect(
        Provider.of<Types>(providerKey.currentContext!, listen: false)
            .types
            .last
            .name,
        'Ferro');
    expect(
        Provider.of<Types>(providerKey.currentContext!, listen: false)
            .types
            .last
            .icon,
        Icons.card_giftcard);

    // Testando navegação para a tela de clientes
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Gerenciar clientes'), findsOneWidget);
    await tester.tap(find.text('Gerenciar clientes'));
    await tester.pumpAndSettle();

    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Testando criação de novo cliente
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Cadastrar cliente'), findsOneWidget);
    expect(find.text('Salvar'), findsOneWidget);
    final nameInput = find.byKey(const Key('nameInput'));
    final emailInput = find.byKey(const Key('emailInput'));
    await tester.enterText(nameInput, 'Shayron');
    await tester.enterText(emailInput, 'a@a.com');
    await tester.tap(find.byIcon(Icons.arrow_downward));
    await tester.pumpAndSettle();

    expect(find.text('Platinum'), findsNWidgets(2));
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);
    expect(find.text('Ferro'), findsOneWidget);
    expect(find.text('Salvar'), findsOneWidget);
    await tester.tap(find.text('Ferro'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    // Testa se o provider de tipos de clientes foi atualizado
    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .name,
        'Shayron');
    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .email,
        'a@a.com');
    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .type
            .icon,
        Icons.card_giftcard);
    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .type
            .name,
        'Ferro');

    expect(find.text('Shayron (Ferro)'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    // Testando remoção de cliente
    await tester.drag(find.text('Shayron (Ferro)'), const Offset(500, 0));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(find.text('Shayron (Ferro)'), findsNothing);
    expect(find.byIcon(Icons.card_giftcard), findsNothing);
  });
}
