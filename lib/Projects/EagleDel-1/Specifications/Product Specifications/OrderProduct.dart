import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

enum OrderProgress {
  None,
  Order,
  Deliver,
  Arrive,
  Test,
}

class OrderedProduct {
  late final String name;
  late final String linkName;
  late final int quantity;
  late final double price;
  late final OrderProgress progress;

  OrderedProduct(this.name, this.linkName, this.quantity, this.price, this.progress);

  int getPrice() {
    double totalPrice = price * quantity;

    int roundTotalPrice = totalPrice.round();

    return roundTotalPrice;
  }

  String updateTextProgress() {
    switch (progress) {
      case (OrderProgress.None):
        return "0.0%";
        break;
      case (OrderProgress.Order):
        return "25.0%";
        break;
      case (OrderProgress.Deliver):
        return "50.0%";
        break;
      case (OrderProgress.Arrive):
        return "75.0%";
        break;
      default:
        return "100.0%";
        break;
    }
  }

  double updateProgress() {
    switch (progress) {
      case (OrderProgress.None):
        return 0.0;
        break;
      case (OrderProgress.Order):
        return 0.25;
        break;
      case (OrderProgress.Deliver):
        return 0.5;
        break;
      case (OrderProgress.Arrive):
        return 0.75;
        break;
      default:
        return 1.0;
        break;
    }
  }

  Icon updateIconProgress() {
    switch (progress) {
      case (OrderProgress.None):
        return Icon(Ionicons.cart_outline);
        break;
      case (OrderProgress.Order):
        return Icon(Ionicons.bag_check_outline);
        break;
      case (OrderProgress.Deliver):
        return Icon(Icons.delivery_dining_outlined);
        break;
      case (OrderProgress.Arrive):
        return Icon(Ionicons.home_outline);
        break;
      default:
        return Icon(Ionicons.shield_checkmark_outline);
        break;
    }
  }
}




