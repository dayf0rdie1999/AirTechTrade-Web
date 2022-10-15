import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderHistoryPopupMenu extends StatelessWidget {
  const OrderHistoryPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      onSelected: (value) {
        debugPrint("Hello World");
      },
      itemBuilder: (context) => const <PopupMenuEntry> [

        PopupMenuItem(
          value: "Track package",
          child: ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text(
              "Track"
            ),
          ),
        ),

        PopupMenuDivider(),

        PopupMenuItem(
          value: "Return",
          child: ListTile(
            leading: Icon(Icons.find_replace),
            title: Text(
              "Return or replace items"
            ),
          ),
        ),

        PopupMenuDivider(),

        PopupMenuItem(
          value: "Share gift receipt",
          child: ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text(
              "Share gift receipt"
            ),
          ),
        ),

        PopupMenuDivider(),

        PopupMenuItem(
          value: "Product review",
          child: ListTile(
            leading: Icon(Icons.rate_review),
            title: Text(
              "Review the product"
            ),
          ),
        ),
        


      ]
    );
  }
}
