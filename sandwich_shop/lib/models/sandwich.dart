enum BreadType { white, wheat, wholemeal }

enum SandwichType {
  veggieDelight,
  chickenTeriyaki,
  tunaMelt,
  meatballMarinara,
}

class Sandwich {
  final SandwichType type;
  final bool isFootlong;
  final BreadType breadType;

  Sandwich({
    required this.type,
    required this.isFootlong,
    required this.breadType,
  });

  String get name {
    switch (type) {
      case SandwichType.veggieDelight:
        return 'Veggie Delight';
      case SandwichType.chickenTeriyaki:
        return 'Chicken Teriyaki';
      case SandwichType.tunaMelt:
        return 'Tuna Melt';
      case SandwichType.meatballMarinara:
        return 'Meatball Marinara';
    }
  }


  String get image {
    switch (type) {
      case SandwichType.veggieDelight:
        return isFootlong ? 'assets/images/veggie_delight_footlong.png' : 'assets/images/veggie_delight_six_inch.png';
      case SandwichType.chickenTeriyaki:
        return isFootlong ? 'assets/images/chicken_teriyaki_footlong.png' : 'assets/images/chicken_teriyaki_six_inch.png';
      case SandwichType.tunaMelt:
        return isFootlong ? 'assets/images/tuna_melt_footlong.png' : 'assets/images/tuna_melt_six_inch.png';
      case SandwichType.meatballMarinara:
        return isFootlong ? 'assets/images/meatball_marinara_footlong.png' : 'assets/images/meatball_marinara_six_inch.png';
    }
  }
}