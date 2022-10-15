import 'package:flutter/material.dart';
import 'package:my_app/Authentication/LogIn/LogInStates/PasswordVerification/PasswordVerification.dart';
import 'package:my_app/Authentication/LogIn/LogInStates/TwoFactorAuthenticate.dart';

import 'LogInStates/EmailVerification.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  List<String> listLogInState = [
    "Email Verification",
    "Password Verification",
    "Two-Factor Authentication"
  ];

  String logInState = "Email Verification";

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "AirTechTrade",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 36.0,
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width / 4),
              child: checkLogInState(),
            )),
      ],
    ));
  }

  Widget checkLogInState() {
    switch (logInState) {
      case ("Two-Factor Authentication"):
        return TwoFactorAuthenticateWidget(
          updateLoginState: (val) {
            setState(() {
              logInState = val;
            });
          },
        );

      case ("Password Verification"):
        return PasswordVerificationWidget(
          password: password,
          passwordOnChanged: (value) {
            setState(() {
              password = value;
            });
          },
          email: email,
          updateLoginState: (val) {
            setState(() {
              logInState = val;
            });
          },
        );

      default:
        return EmailVerificationWidget(
          email: email,
          emailOnChanged: (value) {
            setState(() {
              email = value;
            });
          },
          updateLoginState: (val, email) {
            setState(() {
              logInState = val;
              email = email;
            });
          },
        );
    }
  }
}
