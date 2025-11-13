# Sandwich Shop (Flutter)

A small Flutter demo app that simulates ordering a sandwich. Users can pick sandwich size (footlong / six‑inch), select a bread type, add an order note, and increment/decrement the quantity with safeguards when limits are reached.

## Key features
- Toggle between Footlong and Six-inch sandwich.
- Select bread type (White / Wheat / Wholemeal) via a dropdown.
- Add an order note (e.g., "no onions").
- Increment / decrement quantity. Add/Remove buttons become disabled at limits.
- Order summary displays selected bread, sandwich type, quantity, note, and a simple emoji visualization.

---

## Installation & Setup

Prerequisites
- Windows, macOS, or Linux
- Flutter SDK (stable) — recommended Flutter 3.7+ (Material widgets such as DropdownMenu/DropdownMenuEntry are used)
- Git
- An editor such as Visual Studio Code or Android Studio

Clone the repo
```bash
git clone <https://github.com/Joyeehing/dartprogramming--Y2-.git>
cd "c:\Users\user\OneDrive\Documents\dartprogramming (Y2)\sandwich_shop"
```

Install dependencies and run
```bash
flutter pub get
flutter run
```

To build a release:
```bash
flutter build apk   # Android
flutter build ios   # iOS (macOS + Xcode required)
```

Run tests (if you add tests)
```bash
flutter test
```

---

## Usage

Main screen components (how to use)
- Sandwich size: Use the switch to change between six‑inch and footlong. The selection updates the order summary.
- Bread type: Use the dropdown to pick white, wheat, or wholemeal. Selection updates summary.
- Notes: Enter optional notes in the text field. Empty notes show "No notes added."
- Quantity controls: Use Add and Remove to change quantity. Buttons are disabled when the quantity reaches 0 or the configured maxQuantity.
- Order summary: Shows "quantity breadType sandwichType (emoji) and the note."

Example flow
1. Launch app.
2. Choose "footlong" or "six-inch" via the switch.
3. Pick a bread from the dropdown.
4. Optionally add a note.
5. Tap Add to increase quantity (up to configured maxQuantity).
6. Tap Remove to decrease quantity (down to zero).
7. Observe order summary updating live.

---

## Project structure overview

- lib/
  - main.dart                — App UI and screens (primary code)
  - views/app_styles.dart    — Text styles / common UI styles (imported)
  - repositories/order_repository.dart — Quantity and limit logic
- pubspec.yaml               — Project metadata and dependencies
- README.md                  — This file

Key files and purpose
- lib/main.dart
  - Builds the `OrderScreen` with UI controls: switch, dropdown, textfield, and buttons.
  - Uses an `OrderRepository` for quantity limits and increment/decrement logic.
  - `OrderItemDisplay` renders the order summary.
- lib/repositories/order_repository.dart
  - Encapsulates quantity state, max quantity, and helper flags (canIncrement/canDecrement).
- lib/views/app_styles.dart
  - Centralized text styles used across the app.

Dependencies
- Flutter SDK (built-in material widgets). No external pub packages are required by default.

Development tools
- Visual Studio Code (recommended), Android Studio, or IntelliJ IDEA.
- Flutter DevTools for debugging.

---

## Known issues & TODOs

- The custom `StyledButton` in `lib/main.dart` needs a complete implementation (currently stubbed).
- If your Flutter SDK is older and lacks Material 3 widgets (e.g., DropdownMenu, DropdownMenuEntry, SegmentedButton), replace those widgets with `DropdownButton`, `RadioListTile`, or `ToggleButtons`.
- No unit tests are included yet — consider adding widget/unit tests for:
  - OrderRepository logic (increment/decrement/canIncrement/canDecrement).
  - OrderScreen widget behavior (button enabling/disabling, UI updates).

Planned improvements
- Persist orders locally or expose a mock API.
- Add unit and widget tests.
- Improve UI polish and accessibility.
- Add images/icons and better visual feedback.

---

## Contributing

- Fork the repository.
- Create a feature branch: `git checkout -b feat/my-change`.
- Make changes and commit: `git commit -m "Describe change"`.
- Submit a pull request with a clear description of the change.


---

## Contact

Replace with your contact details:
- Maintainer: Joyee Hing
- Email: hingsiyun@gmail.com
- GitHub: https://github.com/joyeehing

