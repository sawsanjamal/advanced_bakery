import 'package:advanced_bakery/model/cart_item.dart';
import 'package:advanced_bakery/model/food.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Bakery extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "Chocolate Cake",
      description:
          "Three layers of super-rich chocolate cake and silky chocolate buttercream means pure, indulgent bliss.",
      price: 50,
      availableAddons: [
        Addon(name: "Sprinkles", price: 2),
        Addon(name: "Fruits", price: 5),
        Addon(name: "Inscription", price: 2),
      ],
      imagePath: "lib/images/cakes/chocolate_cake.jpg",
      category: FoodCategory.Cakes,
    ),
    Food(
      name: "Lemon Cake",
      description:
          "Light and luscious - we take our scratch-made white cake and fill it with lemon gel. The icing is an eye-appealing ombre of lemon and white buttercream.",
      price: 50,
      availableAddons: [
        Addon(name: "Fruits", price: 5),
        Addon(name: "Inscription", price: 2),
      ],
      imagePath: "lib/images/cakes/lemon_cake.jpg",
      category: FoodCategory.Cakes,
    ),
    Food(
      name: "Marble Cake",
      description:
          "Vanilla and chocolate cake marbled together with chocolate chips. Filled and frosted with vanilla and chocolate buttercreams.",
      price: 50,
      availableAddons: [
        Addon(name: "Fruits", price: 5),
        Addon(name: "Chocolate", price: 5),
        Addon(name: "Inscription", price: 2),
      ],
      imagePath: "lib/images/cakes/marble_cake.jpg",
      category: FoodCategory.Cakes,
    ),
    Food(
      name: "Red Velvet Cake",
      description:
          "This bright and beautiful dessert is perfect for any occasion. Layers of moist, crimson-colored cake are covered with your choice of whipped vanilla or cream cheese icing.",
      price: 50,
      availableAddons: [
        Addon(name: "Fruits", price: 5),
        Addon(name: "Inscription", price: 2),
      ],
      imagePath: "lib/images/cakes/red_velvet_cake.jpg",
      category: FoodCategory.Cakes,
    ),
    Food(
      name: "Strawberry Cake",
      description:
          "6-layer Madagascar vanilla cake, filled & frosted with freshly puréed strawberry buttercream.",
      price: 50,
      availableAddons: [
        Addon(name: "Fruits", price: 5),
      ],
      imagePath: "lib/images/cakes/strawberry_cake.jpg",
      category: FoodCategory.Cakes,
    ),
    Food(
      name: "Chocolate Chip Cookie",
      description:
          "Our soft and chewy take on the classic chocolate chip cookie—but make it chunky!",
      price: 5,
      availableAddons: [],
      imagePath: "lib/images/cookies/chocolate_chip_cookie.jpg",
      category: FoodCategory.Cookies,
    ),
    Food(
      name: "Chocolaty and Nutty Cookie",
      description:
          "Two flourless peanut butter cookies sandwiched together with chocolate buttercream.",
      price: 7,
      availableAddons: [],
      imagePath: "lib/images/cookies/chocolate_nutty_cookie.jpg",
      category: FoodCategory.Cookies,
    ),
    Food(
      name: "Peanut Butter Cookie",
      description: "Soft and chewy peanut butter cookie made without gluten.",
      price: 5,
      availableAddons: [],
      imagePath: "lib/images/cookies/pb_cookie.jpg",
      category: FoodCategory.Cookies,
    ),
    Food(
        name: "Chocolate Cupcake",
        description:
            "Light-as-a-feather chocolate cake topped with vanilla or chocolate buttercream and assorted sprinkles.",
        price: 7,
        availableAddons: [],
        imagePath: "lib/images/cupcakes/chocolate_cupcake.jpg",
        category: FoodCategory.Cupcakes),
    Food(
        name: "Pineapple Cupcake",
        description:
            "Pineapple cake topped with brown sugar buttercream and a maraschino cherry.",
        price: 7,
        availableAddons: [],
        imagePath: "lib/images/cupcakes/pineapple_cupcake.jpg",
        category: FoodCategory.Cupcakes),
    Food(
        name: "Red Velvet Cupcake",
        description:
            "One of our oldest and best-selling desserts, our classic-style red velvet cupcake is a crimson-colored, chocolate-flavored cake topped with whipped vanilla icing.",
        price: 7,
        availableAddons: [],
        imagePath: "lib/images/cupcakes/red_velvet_cupcake.jpg",
        category: FoodCategory.Cupcakes),
    Food(
        name: "Strawberry Cupcake",
        description:
            "Our Strawberry Cream cake comes in a cupcake size! A strawberry cupcake is filled with strawberry filling, iced with a strawberry and white buttercream swirl.",
        price: 7,
        availableAddons: [],
        imagePath: "lib/images/cupcakes/strawberry_cupcake.jpg",
        category: FoodCategory.Cupcakes),
    Food(
        name: "Lime Macaroons",
        description: "Perfect for french pastry lovers.",
        price: 5,
        availableAddons: [],
        imagePath: "lib/images/macaroons/lime_macaroon.jpg",
        category: FoodCategory.Macaroons),
    Food(
        name: "Pineapple Macaroons",
        description: "Perfect for french pastry lovers.",
        price: 5,
        availableAddons: [],
        imagePath: "lib/images/macaroons/pineapple_macaroon.jpg",
        category: FoodCategory.Macaroons),
    Food(
        name: "Blueberry Muffin",
        description:
            "Fluffy and with just the right amount of sweetness, our blueberry muffins are baked with juicy blueberries. Great for breakfast or an afternoon snack!",
        price: 8,
        availableAddons: [],
        imagePath: "lib/images/muffins/blueberry_muffin_large.webp",
        category: FoodCategory.Muffins),
    Food(
        name: "Cinnamon Streusel Muffin",
        description:
            "Our Cinnamon Streusel muffins are the perfect combination of a soft and fluffy muffin base with a layer of cinnamon sugar goodness in the center of the muffin and a crunchy, sweet streusel topping.",
        price: 8,
        availableAddons: [],
        imagePath: "lib/images/muffins/cinnamon_streusel_muffin_large.webp",
        category: FoodCategory.Muffins),
    Food(
        name: "Cranberry Orange Muffin",
        description:
            "Buttery and moist, our cranberry orange muffins are heavy on the flavor and bursting with cranberries in each bite.",
        price: 8,
        availableAddons: [],
        imagePath: "lib/images/muffins/cranberry-orange_muffin_large.webp",
        category: FoodCategory.Muffins),
    Food(
        name: "Lemon Poppyseed Muffin",
        description:
            "Our Lemon Poppy Seed Muffins are tangy, slightly crisp on the outside, and ultra moist inside. They are topped with a simple, sweet lemony glaze.",
        price: 8,
        availableAddons: [],
        imagePath: "lib/images/muffins/lemon_poppyseed_large.webp",
        category: FoodCategory.Muffins),
  ];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];

  String _deliveryAddress = '99 Hollywood Blvd';
  String get deliveryAddress => _deliveryAddress;
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");
    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
