import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  testWidgets('cart summary updates when Add to Cart is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // initial summary shows 0 items
    expect(find.text('Cart: 0 item(s)'), findsOneWidget);

    // Tap Add to Cart
    final addButton = find.widgetWithText(ElevatedButton, 'Add to Cart');
    expect(addButton, findsOneWidget);
    await tester.tap(addButton);

    // Rebuild and allow SnackBar animation
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // Summary should now show 1 item
    expect(find.text('Cart: 1 item(s)'), findsOneWidget);

    // Total should show a non-zero amount (formatted)
    final totalFinder = find.byWidgetPredicate((w) {
      return w is Text && w.data != null && w.data!.startsWith('Total: \$');
    });
    expect(totalFinder, findsOneWidget);

    // ensure total string is not $0.00
    final Text totalText = tester.widget(totalFinder);
    expect(totalText.data, isNot('Total: \$0.00'));
  });
}