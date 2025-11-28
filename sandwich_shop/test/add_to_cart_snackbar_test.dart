import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  testWidgets('tapping Add to Cart shows confirmation SnackBar', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // Find the "Add to Cart" button and tap it.
    final addButton = find.widgetWithText(ElevatedButton, 'Add to Cart');
    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    // pump to start animations and show the SnackBar
    await tester.pump(); 
    await tester.pump(const Duration(seconds: 1));

    // SnackBar should be present
    expect(find.byType(SnackBar), findsOneWidget);
  });
}