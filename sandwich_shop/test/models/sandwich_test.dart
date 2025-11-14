import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich model', () {
    test('name getter returns human readable names', () {
      final veggie = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      final chicken = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.white,
      );
      final tuna = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.white,
      );
      final meatball = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: true,
        breadType: BreadType.white,
      );

      expect(veggie.name, 'Veggie Delight');
      expect(chicken.name, 'Chicken Teriyaki');
      expect(tuna.name, 'Tuna Melt');
      expect(meatball.name, 'Meatball Marinara');
    });

    test('image path reflects type name and size', () {
      final s1 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      final s2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      expect(s1.image, 'assets/images/chickenTeriyaki_footlong.png');
      expect(s2.image, 'assets/images/chickenTeriyaki_six_inch.png');
    });
  });
}