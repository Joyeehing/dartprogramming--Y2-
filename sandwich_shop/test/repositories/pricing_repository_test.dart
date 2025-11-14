import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('default prices - six-inch', () {
      final repo = PricingRepository();
      expect(repo.totalPrice(1, false), 7.0);
      expect(repo.totalPrice(3, false), 21.0);
    });

    test('default prices - footlong', () {
      final repo = PricingRepository();
      expect(repo.totalPrice(1, true), 11.0);
      expect(repo.totalPrice(2, true), 22.0);
    });

    test('custom prices via constructor', () {
      final repo = PricingRepository(sixInchPrice: 6.5, footlongPrice: 10.5);
      expect(repo.totalPrice(2, false), 13.0);
      expect(repo.totalPrice(2, true), 21.0);
    });

    test('zero or negative quantity returns 0', () {
      final repo = PricingRepository();
      expect(repo.totalPrice(0, true), 0.0);
      expect(repo.totalPrice(-1, false), 0.0);
    });
  });
}