import 'package:flutter/material.dart';

class MyMenuItem {
  final String text;
  final IconData icon;

  const MyMenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {

  static const List<MyMenuItem> firstItems = [signup, login];
  static const List<MyMenuItem> secondItems = [profile,logout];
  static const List<MyMenuItem> thirdItems = [settings];

  static const signup = MyMenuItem(text: 'Sign Up', icon: Icons.person_add_alt_1);
  static const login = MyMenuItem(text: 'Log In', icon: Icons.login);
  static const settings = MyMenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MyMenuItem(text: 'Log Out', icon: Icons.logout);
  static const profile = MyMenuItem(text: 'My Profile', icon: Icons.person_outline);

  static Widget buildItem(MyMenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          size: 22
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MyMenuItem item) {
    switch (item) {
      case MenuItems.signup:
        //Do something
        Navigator.pushNamed(context, "register");
        break;
      case MenuItems.login:
        //Do something
        Navigator.pushNamed(context, "login");
        break;
      case MenuItems.settings:
        //Do something
        debugPrint('Change Settings');
        break;
      case MenuItems.logout:
        //Do something
        debugPrint('Log User Out');
        break;
      case MenuItems.profile:
        Navigator.popAndPushNamed(context, "profile");
        break;
    }
  }
}