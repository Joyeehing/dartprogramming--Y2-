import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class CartItem {
  final Sandwich sandwich;
  int quantity;

  CartItem(this.sandwich, [this.quantity = 1]);
}

class Cart {
  final List<CartItem> _items = [];
  final PricingRepository pricingRepository;

  Cart({PricingRepository? pricingRepository})
      : pricingRepository = pricingRepository ?? PricingRepository();

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => _items.isEmpty;

  /// Add quantity of [sandwich] to the cart. Merges with existing item if same
  /// sandwich (same type, size and bread).
  void add(Sandwich sandwich, {int quantity = 1}) {
    if (quantity <= 0) return;
    final idx = _indexOf(sandwich);
    if (idx >= 0) {
      _items[idx].quantity += quantity;
    } else {
      _items.add(CartItem(sandwich, quantity));
    }
  }

  /// Remove up to [quantity] of [sandwich] from the cart. If quantity reaches
  /// 0 the item is removed entirely.
  void remove(Sandwich sandwich, {int quantity = 1}) {
    if (quantity <= 0) return;
    final idx = _indexOf(sandwich);
    if (idx < 0) return;
    final item = _items[idx];
    item.quantity -= quantity;
    if (item.quantity <= 0) {
      _items.removeAt(idx);
    }
  }

  /// Set the quantity for [sandwich]. If [quantity] <= 0 the item is removed.
  void setQuantity(Sandwich sandwich, int quantity) {
    final idx = _indexOf(sandwich);
    if (quantity <= 0) {
      if (idx >= 0) _items.removeAt(idx);
      return;
    }
    if (idx >= 0) {
      _items[idx].quantity = quantity;
    } else {
      _items.add(CartItem(sandwich, quantity));
    }
  }

  /// Remove all items from the cart.
  void clear() => _items.clear();

  /// Compute total price using PricingRepository as single source of truth.
  double totalPrice() {
    double sum = 0.0;
    for (final item in _items) {
      sum += pricingRepository.totalPrice(item.quantity, item.sandwich.isFootlong);
    }
    return sum;
  }

  int _indexOf(Sandwich s) {
    for (var i = 0; i < _items.length; i++) {
      final cur = _items[i].sandwich;
      if (_sameSandwich(cur, s)) return i;
    }
    return -1;
  }

  bool _sameSandwich(Sandwich a, Sandwich b) {
    return a.type == b.type && a.isFootlong == b.isFootlong && a.breadType == b.breadType;
  }
}