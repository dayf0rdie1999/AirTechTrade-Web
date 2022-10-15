import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Header/MyAppBarPage.dart';
import 'package:my_app/Profile/OrderHistory/OrderHistory.dart';
import 'package:my_app/Profile/Personal/Personal.dart';
import 'package:my_app/Profile/SavedSections/SaveSections.dart';

import 'DashBoard/DashBoard.dart';
import 'Investment/Investment.dart';
import 'Payments/Payments.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          leadingWidget: null,
        ),
        body: Row(
          children: [
            Container(
              width: 150.0,
              child: NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                labelType: labelType,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard_outlined),
                    selectedIcon: Icon(Icons.dashboard),
                    label: Text('Dasboard'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.badge_outlined),
                    selectedIcon: Icon(Icons.badge),
                    label: Text('Personal Info'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.feed_outlined),
                    selectedIcon: Icon(Icons.feed),
                    label: Text('Order History'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.business_center_outlined),
                    selectedIcon: Icon(Icons.business_center),
                    label: Text('Investment'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.credit_card_outlined),
                    selectedIcon: Icon(Icons.credit_card),
                    label: Text('Payments'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark_outline),
                    selectedIcon: Icon(Icons.bookmark),
                    label: Text('Saved Jobs'),
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              thickness: 1.0,
              width: 1.0,
            ),
            Expanded(
              flex: 3,
              child: railNavigator(),
            ),
          ],
        ));
  }

  Widget railNavigator() {
    switch (_selectedIndex) {
      case (1):
        {
          return const PersonalWidgets();
        }
      case (2):
        {
          return const OrderHistoryWidgets();
        }
      case (3):
        {
          return const InvestmentWidget();
        }
      case (4):
        {
          return const PaymentsWidget();
        }
      case (5):
        {
          return const SavedSectionsWidgets();
        }
      default:
        {
          return DashBoardWidget(
            updateWidget: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        }
    }
  }
}
