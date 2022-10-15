import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Authentication/Register/PlatformsAuthentication.dart';
import 'package:my_app/Authentication/Register/RegisterAgreement.dart';
import 'package:my_app/Header/MyAppBarPage.dart';
import 'package:my_app/Utils/MyTextFormField.dart';

import '../../Utils/MyCheckBox.dart';
import 'NotifyAuthenticate.dart';
import 'ReCaptCha.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String confirmPassword = "";

  //
  bool isNotifyChecked = false;

  // Verifying Human Being
  bool isHuman = false;

  // Making password visible
  bool isObscuredText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Align(
        alignment: Alignment.topCenter,
        child: Text(
          "AirTechTrade",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width / 4),
          child: const PlatformsAuthenticationWidget()),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width / 4),
          child: SizedBox(
            height: 700.0,
            width: 400.0,
            child: Card(
                child: Form(
                    key: _registerFormKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyTextFormField(
                            initialValue: null,
                            prefixIcon: const Icon(Icons.email),
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            textInputType: TextInputType.visiblePassword,
                            labelText: "Email Address",
                            obscuredText: false,
                            changeObscuredText: null,
                          ),

                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isObscuredText,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(Icons.password),
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscuredText = !isObscuredText;
                                    });
                                  },
                                  icon: (isObscuredText == true)
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                )),
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Must have at least 10-12 characters \nMust container symbols \$%^&*() \nMust contain 1-2 numbers';
                              }
                              return null;
                            },
                          ),

                          MyTextFormField(
                            initialValue: null,
                            prefixIcon: const Icon(Icons.password),
                            onChanged: (value) {
                              setState(() {
                                confirmPassword = value;
                              });
                            },
                            textInputType: TextInputType.visiblePassword,
                            labelText: "Re-entered Password",
                            obscuredText: true,
                            changeObscuredText: null,
                          ),

                          Text(
                            "Must have at least 10-12 characters including symbols \$%^&*() and 1-2 numbers",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),

                          // Container I am not a robot CAPTCHA
                          ReCaptChaWidget(
                            isHuman: isHuman,
                            updateCheckBox: (value) {
                              setState(() {
                                isHuman = value;
                              });
                            },
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyCheckBox(
                                checkbox: isNotifyChecked,
                                updateCheckBox: (val) {
                                  setState(() {
                                    isNotifyChecked = val;
                                  });
                                },
                              ),
                              const NotifyAuthenticateWidget(),
                            ],
                          ),

                          SizedBox(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: (email != "" &&
                                      password != "" &&
                                      confirmPassword != "" &&
                                      isNotifyChecked == true &&
                                      isHuman == true)
                                  ? () {
                                      checkPassword();
                                    }
                                  : null,
                              child: const Text('Sign Up'),
                            ),
                          ),

                          const RegisterAgreementWidget(),
                        ],
                      ),
                    ))),
          ),
        ),
      ),
    ]));
  }

  void checkPassword() {
    final regExp = RegExp(
        r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' // <-- Notice the escaped symbols
        "'" // <-- ' is added to the expression
        ']');

    if (password.length > 10 &&
        password.contains(regExp) &&
        password.contains(RegExp(r'[0-9]'))) {
      debugPrint("Qualified");
      Navigator.of(context).pop();
    } else {
      debugPrint("Password is weak");
    }
  }
}
