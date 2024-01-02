import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Calculator Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(const Key("Result")), findsOneWidget);
    expect(find.byKey(const Key("DisplayOne")), findsOneWidget);
    expect(find.byKey(const Key("DisplayTwo")), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

    await tester.enterText(find.byKey(const Key("DisplayOne")), "20");
    await tester.enterText(find.byKey(const Key("DisplayTwo")), "30");
    await tester.tap(find.byIcon(Icons.add));

    await tester.pump();

    expect(find.text("50"), findsOneWidget);
  });
}
