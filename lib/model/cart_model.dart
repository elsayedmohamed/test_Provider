import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './items.dart';

class Cart with ChangeNotifier {
  static Card get(context) => Provider.of(context);

  List<Items> _items = [];
  double _price = 0.0;
  //add items to basket
  void addItem(Items items) {
    _items.add(items);
    _price += items.price!;
    notifyListeners();
  }

  // remove items from Basket

  void removeItem(Items item) {
    _items.remove(item);
    _price -= item.price!;
    notifyListeners();
  }

// count items in Cart
  int get count {
    return _items.length;
  }

  // get  total price

  double get totalPrice {
    return _price;
  }

  // get items in basket

  List<Items> get basketItems {
    return _items;
  }
}
