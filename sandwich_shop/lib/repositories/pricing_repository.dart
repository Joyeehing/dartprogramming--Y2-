class PricingRepository {
  final double sixInchPrice;
  final double footlongPrice;

  PricingRepository({
    this.sixInchPrice = 7.0,
    this.footlongPrice = 11.0,
  });

  /// Returns total price for [quantity]. [isFootlong] selects unit price.
  double totalPrice(int quantity, bool isFootlong) {
    if (quantity <= 0) return 0.0;
    return quantity * (isFootlong ? footlongPrice : sixInchPrice);
  }
}