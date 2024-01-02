import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Calculator View Test", () {
    testWidgets("Calculator Test", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byKey(const Key("Result")), findsOneWidget);
      expect(find.byKey(const Key("DisplayOne")), findsOneWidget);
      expect(find.byKey(const Key("DisplayTwo")), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
    });
  });

  testWidgets("Operation Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.enterText(find.byKey(const Key("DisplayOne")), "5");
    await tester.enterText(find.byKey(const Key("DisplayTwo")), "2");

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text("7"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();
    expect(find.text("3"), findsOneWidget);

    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();
    expect(find.text("10"), findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.divide));
    await tester.pump();
    expect(find.text("2.5"), findsOneWidget);
  });
}
