import 'package:flutter/material.dart';
import 'package:my_app/Authentication/LogIn/LogIn.dart';
import 'package:my_app/Authentication/Register/Register.dart';
import 'package:my_app/Documents/DocumentPage.dart';
import 'package:my_app/Profile/ProfilePage.dart';
import 'package:my_app/Support/InvestInUs/InvestInUs.dart';
import 'package:my_app/Support/Jobs/JoinOurTeam.dart';

import 'Authentication/ChangePassword/ChangePassword.dart';
import 'HomePage/HomePage.dart';
import 'Projects/EagleDel-1/EagleDelPage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        // Material Page Route
        onGenerateRoute: (settings) {
          if (settings.name == "/") {
            return MaterialPageRoute(builder: (context) => MyHomePage());
          }

          var uri = Uri.parse(settings.name!);
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == "projects") {
            var id = uri.pathSegments[1];
            if (id == "EagleDel-1") {
              return MaterialPageRoute(builder: (context) => EagleDelPage());
            }
          } else if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == "supports") {
            var id = uri.pathSegments[1];
            if (id == "join-our-team") {
              return MaterialPageRoute(builder: (context) => JoinOurTeamPage());
            } else if (id == "invest-in-us") {
              return MaterialPageRoute(builder: (context) => InvestInUsPage());
            }
          }

          if (settings.name == "register") {
            return MaterialPageRoute(builder: (context) => RegisterPage());
          } else if (settings.name == "login") {
            return MaterialPageRoute(builder: (context) => LogInPage());
          } else if (settings.name == "profile") {
            return MaterialPageRoute(builder: (context) => ProfilePage());
          } else if (settings.name == "changePassword") {
            return MaterialPageRoute(
                builder: (context) => ChangePasswordWidget());
          }

          if (settings.name == "docs") {
            return MaterialPageRoute(builder: (context) => DocumentsPage());
          }

        },
        title: 'AirTechTrade LLC',
        // Creating Theme
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.yellow,
          ),
          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline4: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                height: 2.0,
                fontWeight: FontWeight.bold),
            headline5: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                height: 2.0,
                fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText1:
                TextStyle(fontSize: 14.0, color: Colors.black, height: 2.0),
            bodyText2: TextStyle(
                fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
            button: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
        ),
        home: Builder(
          builder: (context) {
            return const MyHomePage();
          },
        ));
  }
}
