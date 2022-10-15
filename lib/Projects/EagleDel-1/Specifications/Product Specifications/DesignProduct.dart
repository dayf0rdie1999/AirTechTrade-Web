import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

enum DesignProgress {
  None,
  Research,
  Design,
  Manufacture,
  Test,
}

class DesignProduct {
  late final String name;
  late final String linkName;
  late final int quantity;
  late final double price;
  late final DesignProgress progress;

  DesignProduct(this.name,this.linkName, this.quantity, this.price, this.progress);

  int getPrice() {
    double totalPrice = price * quantity;

    int roundTotalPrice = totalPrice.round();

    return roundTotalPrice;
  }

  String updateTextProgress() {
    switch (progress) {
      case (DesignProgress.None):
        return "0.0%";
        break;
      case (DesignProgress.Research):
        return "25.0%";
        break;
      case (DesignProgress.Design):
        return "50.0%";
        break;
      case (DesignProgress.Manufacture):
        return "75.0%";
        break;
      default:
        return "100.0%";
        break;
    }
  }

  double updateProgress() {
    switch (progress) {
      case (DesignProgress.None):
        return 0.0;
        break;
      case (DesignProgress.Research):
        return 0.25;
        break;
      case (DesignProgress.Design):
        return 0.5;
        break;
      case (DesignProgress.Manufacture):
        return 0.75;
        break;
      default:
        return 1.0;
        break;
    }
  }

  Icon updateIconProgress() {
    switch (progress) {
      case (DesignProgress.None):
        return Icon(Ionicons.document_outline);
        break;
      case (DesignProgress.Research):
        return Icon(Ionicons.search_outline);
        break;
      case (DesignProgress.Design):
        return Icon(Ionicons.hardware_chip_outline);
        break;
      case (DesignProgress.Manufacture):
        return Icon(Ionicons.print_outline);
        break;
      default:
        return Icon(Ionicons.shield_checkmark_outline);
        break;
    }
  }
}
