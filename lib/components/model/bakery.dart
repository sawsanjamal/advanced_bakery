import 'package:advanced_bakery/components/model/cart_item.dart';
import 'package:advanced_bakery/components/model/food.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Bakery extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "Chocolate Cake",
      description: "Decadent chocolate cake, perfect for any event.",
      price: 50,
      availableAddons: [
        Addon(name: "Sprinkles", price: 2),
        Addon(name: "Fruits", price: 5),
      ],
      imagePath: "lib/images/cakes/chocolate_cake.jpg",
      category: FoodCategory.cakes,
    ),
    Food(
      name: "Lemon Cake",
      description: "Airy lemon cake, perfect for citrus lovers",
      price: 50,
      availableAddons: [
        Addon(name: "Fruits", price: 5),
      ],
      imagePath: "lib/images/cakes/lemon_cake.jpg",
      category: FoodCategory.cakes,
    ),
    Food(
      name: "Marble Cake",
      description: "Decadent marble cake, perfect for any event.",
      price: 50,
      availableAddons: [
        Addon(name: "Fruits", price: 5),
        Addon(name: "Chocolate", price: 5),
      ],
      imagePath: "lib/images/cakes/marble_cake.jpg",
      category: FoodCategory.cakes,
    ),
    Food(
      name: "Red Velvet Cake",
      description: "Delicious red velvet cake.",
      price: 50,
      availableAddons: [
        Addon(name: "Fruits", price: 5),
      ],
      imagePath: "lib/images/cakes/red_velvet_cake.jpg",
      category: FoodCategory.cakes,
    ),
    Food(
      name: "Strawberry Cake",
      description: "Creamy and light strawberry cake.",
      price: 50,
      availableAddons: [
        Addon(name: "Fruits", price: 5),
      ],
      imagePath: "lib/images/cakes/strawberry_cake.jpg",
      category: FoodCategory.cakes,
    ),
    Food(
      name: "Chocolate Chip Cookie",
      description: "Soft but crunch chocolate chip cookie. A best seller",
      price: 5,
      availableAddons: [],
      imagePath: "lib/images/cookies/chocolate_chip_cookie.jpg",
      category: FoodCategory.cookies,
    ),
    Food(
      name: "Chocolaty and Nutty Cookie",
      description: "Peanut butter and chocolate cookie. ",
      price: 7,
      availableAddons: [],
      imagePath: "lib/images/cookies/chocolate_nutty_cookie.jpg",
      category: FoodCategory.cookies,
    ),
    Food(
      name: "Peanut Butter Cookie",
      description: "Sweet nutty cookie",
      price: 5,
      availableAddons: [],
      imagePath: "lib/images/cookies/pb_cookie.jpg",
      category: FoodCategory.cookies,
    ),
    Food(
        name: "Chocolate Cupcake",
        description: "Perfect for chocolate lovers.",
        price: 7,
        availableAddons: [],
        imagePath: "lib/images/cupcakes/chocolate_cupcake.jpg",
        category: FoodCategory.cupcakes),
    Food(
        name: "Pineapple Cupcake",
        description: "Pina Colada in a cupcake.",
        price: 7,
        availableAddons: [],
        imagePath: "lib/images/cupcakes/pineapple_cupcake.jpg",
        category: FoodCategory.cupcakes),
    Food(
        name: "Red Velvet Cupcake",
        description: "Perfect for red velvet lovers.",
        price: 7,
        availableAddons: [],
        imagePath: "lib/images/cupcakes/red_velvet_cupcake.jpg",
        category: FoodCategory.cupcakes),
    Food(
        name: "Strawberry Cupcake",
        description: "Perfect for fruit lovers. Sweet with a hint of tanginess",
        price: 7,
        availableAddons: [],
        imagePath: "lib/images/cupcakes/strawberry_cupcake.jpg",
        category: FoodCategory.cupcakes),
    Food(
        name: "Lime Macaroons",
        description: "Perfect for french pastry lovers.",
        price: 5,
        availableAddons: [],
        imagePath: "lib/images/macaroons/lime_macaroon.jpg",
        category: FoodCategory.macaroons),
    Food(
        name: "Pineapple Macaroons",
        description: "Perfect for french pastry lovers.",
        price: 5,
        availableAddons: [],
        imagePath: "lib/images/macaroons/pineapple_macaroon.jpg",
        category: FoodCategory.macaroons),
    Food(
        name: "Blueberry Muffin",
        description: "Perfect for blueberry lovers.",
        price: 8,
        availableAddons: [],
        imagePath: "lib/images/muffins/blueberry_muffin_large.webp",
        category: FoodCategory.muffins),
    Food(
        name: "Cinnamon Muffin",
        description: "Perfect for blueberry lovers.",
        price: 8,
        availableAddons: [],
        imagePath: "lib/images/muffins/cinnamon_streusel_muffin_large.webp",
        category: FoodCategory.muffins),
    Food(
        name: "Cranberry Orange Muffin",
        description: "Perfect for blueberry lovers.",
        price: 8,
        availableAddons: [],
        imagePath: "lib/images/muffins/cranberry-orange_muffin_large.webp",
        category: FoodCategory.muffins),
    Food(
        name: "Lemon Poppyseed Muffin",
        description: "Perfect for blueberry lovers.",
        price: 8,
        availableAddons: [],
        imagePath: "lib/images/muffins/lemon_poppyseed_large.webp",
        category: FoodCategory.muffins),
  ];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];
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
}
