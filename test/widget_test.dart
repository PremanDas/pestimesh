// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pestimesh/report_timestamp_screen.dart';
import 'package:pestimesh/submissions.dart';

void main() {
  testWidgets('shows the submission report action rows',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SubmissionsScreen()));

    expect(find.text('View full report'), findsNWidgets(3));
    expect(find.text('Residential Pest Control'), findsOneWidget);
  });

  testWidgets('shows report submitted confirmation when submitting',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ReportTimestampScreen(
          onBack: () {},
        ),
      ),
    );

    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), 'Alex Wong');
    await tester.enterText(textFields.at(1), 'Senior Pest Specialist');

    await tester.ensureVisible(find.text('Submit'));
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(find.text('Report has been submitted'), findsOneWidget);
  });
}
