import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Header/MenuItems/MenuItems.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {

  final Widget? leadingWidget;

  MyAppBar({Key? key, required this.leadingWidget}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  // Creating a list for product drop down menu
  final List<String> items = ["EagleDel-1"];
  String? selectedValue;

  // Creating a list for ways to join us
  final List<String> supportItems = [
    "Join Our Team",
    "Invest In Us"
  ];
  String? supportItemsSelectedValue;

  // Creating a state to login and logout
  bool isLogIn = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leadingWidget,
      title: const Text('AirTechTrade'),
      actions: [

        // Navigate to Home Page
        TextButton(
            child: const Text("Home", style: TextStyle(color: Colors.black)),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/");
            }),

        // DropDown Menu for Product
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            alignment: AlignmentDirectional.center,
            customButton: const Center(
                child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: Text(
                "Projects",
                textAlign: TextAlign.center,
              ),
            )),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              Navigator.popAndPushNamed(context, "projects/${value as String}");
            },
            dropdownWidth: 140.0,
          ),
        ),

        // Navigate to Documentation Page
        TextButton(
            child: const Text("Docs", style: TextStyle(color: Colors.black)),
            onPressed: () {
              Navigator.popAndPushNamed(context, "docs");
            }),

        // Creating a page to support us
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            alignment: AlignmentDirectional.center,
            customButton: const Center(
                child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: Text(
                "Support Us",
                textAlign: TextAlign.center,
              ),
            )),
            items: supportItems
                .map((supportItem) => DropdownMenuItem<String>(
                      value: supportItem,
                      child: Text(
                        supportItem,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ))
                .toList(),
            value: supportItemsSelectedValue,
            onChanged: (value) {
              String name = value.toString().replaceAll(" ", "-").toLowerCase();
              Navigator.popAndPushNamed(context, "supports/$name");
            },
            dropdownWidth: 140,
          ),
        ),

        // Creating a downdown menu button to access basic functionality
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: const Icon(
              Icons.list,
              size: 36,
            ),
            customItemsIndexes: const [3],
            items: isLogIn == false
                ? notLogInWidget(context)
                : logInWidget(context),
            onChanged: (value) {
              MenuItems.onChanged(context, value as MyMenuItem);
            },
            itemHeight: 36,
            itemPadding: const EdgeInsets.only(left: 16, right: 16),
            dropdownWidth: 160,
            dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            dropdownElevation: 8,
            offset: const Offset(0, 8),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<MyMenuItem>> notLogInWidget(BuildContext context) {
    return [
      ...MenuItems.firstItems.map(
        (item) => DropdownMenuItem(
          value: item,
          child: MenuItems.buildItem(item),
        ),
      ),
    ];
  }

  List<DropdownMenuItem<MyMenuItem>> logInWidget(BuildContext context) {
    return [
      ...MenuItems.secondItems.map(
        (item) => DropdownMenuItem(
          value: item,
          child: MenuItems.buildItem(item),
        ),
      ),
    ];
  }
}
