import 'package:flutter/material.dart';
import 'package:provider_example/models/product.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class Store extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _cart = [];
  Product _active = null;

  double _cartTotal;
  double get cartTotal => _cartTotal;

  Store() {
    _products = [
      Product(1, "Plastic Medicine Box", 50.00, 0, "medical-box.jpg",
          lipsum.createParagraph()),
      Product(2, "Workplace FirstAid Kit", 30.00, 0,
          "workplace-first-aid-kit.jpg", lipsum.createParagraph()),
      Product(3, "Missionpharma", 120.00, 0, "corona.jpg",
          lipsum.createParagraph()),
    ];
    notifyListeners();
  }

  List<Product> get products => _products;
  List<Product> get cart => _cart;
  Product get activeProduct => _active;

  setActiveProduct(Product product) {
    _active = product;
  }

  clearCart() {
    for (Product p in _products) {
      p.quantity = 0;
    }
    _cart.clear();
    notifyListeners();
  }

  addItemToCart(Product product) {
    print("adding ${product.name}");
    Product found =
        _cart.firstWhere((p) => p.id == product.id, orElse: () => null);
    if (found != null) {
      found.quantity += 1;
    } else {
      _cart.add(product);
      product.quantity += 1;
    }
    notifyListeners();
  }

  removeItemFromCart(Product product) {
    Product found =
        _cart.firstWhere((p) => p.id == product.id, orElse: () => null);
    if (found != null && found.quantity == 1) {
      product.quantity = 0;
      _cart.remove(product);
    }
    if (found != null && found.quantity > 1) {
      found.quantity -= 1;
    }
    notifyListeners();
  }

  int getCartQuantity() {
    int total = 0;
    for (Product p in _cart) {
      total += p.quantity;
    }
    return total;
  }

  double getCartTotal() {
    double price = 0;
    for (Product p in _cart) {
      price += (p.price * p.quantity);
    }
    return price;
  }

  double getTotal(int parsentage) {
    double price = 0;
    for (Product p in _cart) {
      price += (p.price * p.quantity);
    }

    double y = (price * parsentage) / 100.0;
    _cartTotal = price + y;
    notifyListeners();
    return price + y;
  }

  navigatoToPersonalInfo(BuildContext context) {
    Navigator.pushNamed(context, '/personalinfo');
  }

  void navigateToPayment(BuildContext context) {
    Navigator.pushNamed(context, '/payment_method');
  }
}
