import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Utils/MyTextFormField.dart';

import '../../Register/PlatformsAuthentication.dart';
import '../../Register/RegisterAgreement.dart';

class EmailVerificationWidget extends StatefulWidget {
  final String email;
  final Function(String, String?) updateLoginState;
  final Function(String) emailOnChanged;
  const EmailVerificationWidget(
      {Key? key, required this.updateLoginState, required this.email, required this.emailOnChanged})
      : super(key: key);

  @override
  State<EmailVerificationWidget> createState() =>
      _EmailVerificationWidgetState();
}

class _EmailVerificationWidgetState extends State<EmailVerificationWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400.0,
        width: 400.0,
        child: Card(
            child: Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                // Sign In With Our  Authenticate System
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.headline6,
                    )),

                MyTextFormField(
                  initialValue: null,
                  prefixIcon: const Icon(Icons.email),
                  onChanged: (value) => widget.emailOnChanged(value),
                  textInputType: TextInputType.emailAddress,
                  labelText: "Email Address",
                  obscuredText: false,
                  changeObscuredText: null,
                ),

                const RegisterAgreementWidget(),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: (widget.email != "")
                        ? () {
                            debugPrint("Check Email and Continue");
                            debugPrint(widget.email);
                            widget.updateLoginState(
                                "Password Verification", widget.email);
                          }
                        : null,
                    child: const Text("Continue"),
                  ),
                ),

                const Divider(
                  thickness: 2.0,
                ),

                const PlatformsAuthenticationWidget(),

              ],
            ),
          ),
        )));
  }
}
