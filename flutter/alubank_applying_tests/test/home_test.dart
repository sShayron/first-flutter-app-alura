import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/components/sections/actions.dart';
import 'package:estilizacao_componentes/components/sections/header.dart';
import 'package:estilizacao_componentes/components/sections/points_exchange.dart';
import 'package:estilizacao_componentes/components/sections/recent_activities.dart';
import 'package:estilizacao_componentes/data/bank_http.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([BankHttp])
import 'home_test.mocks.dart';

void main() {
  final MockBankHttp bankHttpMock = MockBankHttp();

  when(bankHttpMock.dolarToReal()).thenAnswer((_) async => ('5'));

  testWidgets('should call MockBankHttp dolarToReal', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(dolarToReal: bankHttpMock.dolarToReal()),
      ),
    ));

    verify(bankHttpMock.dolarToReal()).called(1);
  });

  group('Home tests', () {
    testWidgets('should have text "Spent"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));
      final spentFinder = find.text('Spent');
      expect(spentFinder, findsOneWidget);
    });

    testWidgets('should have a LinearProgressIndicator', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));
      final finder = find.byType(LinearProgressIndicator);
      expect(finder, findsOneWidget);
    });

    testWidgets('should have a widget with key testKey', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));
      final finder = find.byKey(const Key('testKey'));
      expect(finder, findsOneWidget);
    });

    testWidgets('should contains Header widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      final headerFinder = find.byType(Header);
      expect(headerFinder, findsOneWidget);
    });

    testWidgets('should contains RecentActivity widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      final recentActivityFinder = find.byType(RecentActivity);
      expect(recentActivityFinder, findsOneWidget);
    });

    testWidgets('should contains ActionsSection widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      final actionsSectionFinder = find.byType(ActionsSection);
      expect(actionsSectionFinder, findsOneWidget);
    });

    testWidgets('should contains PointsExchange widget', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      final pointsExchangeFinder = find.byType(PointsExchange);
      expect(pointsExchangeFinder, findsOneWidget);
    });
    testWidgets('should have 5 widgets BoxCard', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      final boxCardFinder = find.byWidgetPredicate((widget) {
        if (widget is BoxCard) {
          return true;
        } else {
          return false;
        }
      });
      expect(boxCardFinder, findsNWidgets(5));
    });

    testWidgets('should have a text "Deposit" ', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));
      final spentFinder = find.text('Deposit');
      expect(spentFinder, findsOneWidget);
    });

    testWidgets('should increase earned in 10 when Deposit is clicked" ',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      await tester.tap(find.text('Deposit'));
      await tester.tap(find.text('Earned'));
      await tester.pumpAndSettle();

      expect(find.text('\$10.0'), findsOneWidget);
    });

    testWidgets('should increase Spent in 10 when Transfer is clicked" ',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      await tester.tap(find.text('Transfer'));
      await tester.tap(find.text('Spent'));
      await tester.pumpAndSettle();

      expect(find.text('\$10.0'), findsOneWidget);
    });

    testWidgets(
        'should increase Available balance in 10 when Deposit is clicked" ',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      await tester.tap(find.text('Deposit'));
      await tester.tap(find.text('Available balance'));
      await tester.pumpAndSettle();

      expect(find.text('\$10.0'), findsOneWidget);
    });

    testWidgets('should increase Total points in 10 when Transfer is clicked" ',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BankInherited(
          child: Home(dolarToReal: bankHttpMock.dolarToReal()),
        ),
      ));

      final pointsFinder = find.text('Total points:');
      final pointsValueFinder = find.text('10.0');

      await tester.tap(find.text('Transfer'));
      await tester.scrollUntilVisible(pointsFinder, 80);
      await tester.tap(pointsFinder);
      await tester.pumpAndSettle();

      expect(pointsValueFinder, findsOneWidget);
    });
  });
}
