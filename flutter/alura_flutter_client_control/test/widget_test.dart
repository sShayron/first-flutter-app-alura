import 'package:client_control/components/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:client_control/components/icon_picker.dart';

void main() {
  group('HamburguerMenu', () {
    testWidgets('should display all menu options', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HamburgerMenu(),
        ),
      );

      expect(find.text('Menu'), findsOneWidget);
      expect(find.text('Gerenciar clientes'), findsOneWidget);
      expect(find.text('Tipos de clientes'), findsOneWidget);
      expect(find.text('Sair'), findsOneWidget);
    });
  });

  group('IconPicker', () {
    testWidgets('showIconPicker displays all icons and allows selection',
        (WidgetTester tester) async {
      IconData? selectedIcon;

      // Create a test widget to host the dialog
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                selectedIcon = await showIconPicker(
                  context: context,
                  defalutIcon: Icons.card_giftcard,
                );
              },
              child: const Text('Open Icon Picker'),
            ),
          ),
        ),
      );

      // Tap the button to open the dialog
      await tester.tap(find.text('Open Icon Picker'));
      await tester.pumpAndSettle();

      // Verify the dialog is displayed
      expect(find.text('Escolha um ícone'), findsOneWidget);

      // Verify all icons are displayed
      expect(
          find.byType(IconButton), findsNWidgets(25)); // Total number of icons

      // Tap on an icon to select it
      await tester.tap(find.byIcon(Icons.credit_card));
      await tester.pumpAndSettle();

      // Verify the selected icon is returned
      expect(selectedIcon, Icons.credit_card);
    });
  });
}
