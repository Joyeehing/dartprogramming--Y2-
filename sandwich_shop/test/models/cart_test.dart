import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('Cart model', () {
    test('add and merge items', () {
      final cart = Cart();
      final s = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.add(s);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 1);

      // add same sandwich -> merge quantities
      cart.add(s, quantity: 2);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 3);
      expect(cart.totalItems, 3);
    });

    test('remove and auto-remove when zero', () {
      final cart = Cart();
      final s = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      cart.add(s, quantity: 3);
      cart.remove(s);
      expect(cart.items.first.quantity, 2);

      cart.remove(s, quantity: 2);
      expect(cart.items.length, 0);
      expect(cart.isEmpty, isTrue);
    });

    test('setQuantity works and removes when set to zero', () {
      final cart = Cart();
      final s = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );

      cart.setQuantity(s, 5);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 5);

      cart.setQuantity(s, 0);
      expect(cart.items.length, 0);
    });

    test('totalPrice uses PricingRepository correctly', () {
      final pricing = PricingRepository(); // default: six-inch 7.0, footlong 11.0
      final cart = Cart(pricingRepository: pricing);

      final sixInch = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );

      final footlong = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.add(sixInch, quantity: 2); // 2 * 7 = 14
      cart.add(footlong, quantity: 1); // 1 * 11 = 11

      expect(cart.totalPrice(), 25.0);
    });

    test('clearing cart empties items', () {
      final cart = Cart();
      final s = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );
      cart.add(s, quantity: 2);
      expect(cart.isEmpty, isFalse);
      cart.clear();
      expect(cart.isEmpty, isTrue);
    });
  });
}