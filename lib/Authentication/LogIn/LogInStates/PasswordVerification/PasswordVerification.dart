import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Utils/MyCheckBox.dart';
import 'package:my_app/Utils/MyTextFormField.dart';

class PasswordVerificationWidget extends StatefulWidget {
  final Function(String) updateLoginState;
  final String email;
  final String password;
  final Function(String) passwordOnChanged;

  const PasswordVerificationWidget(
      {Key? key,
      required this.updateLoginState,
      required this.email,
      required this.password,
      required this.passwordOnChanged})
      : super(key: key);

  @override
  State<PasswordVerificationWidget> createState() =>
      _PasswordVerificationWidgetState();
}

class _PasswordVerificationWidgetState
    extends State<PasswordVerificationWidget> {
  // Change email button is hovered
  bool isChangeHovered = false;

  // forgot password buttin is hovered
  bool isForgotPasswordHovered = false;

  // Bool keepMeSignedIn
  bool keepMeSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300.0,
        width: 400.0,
        child: Card(
            child: Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Sign In With Our  Authenticate System
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.headline6,
                    )),

                RichText(
                    text: TextSpan(
                        text: widget.email,
                        style: Theme.of(context).textTheme.bodyText2,
                        children: [
                      const TextSpan(
                        text: "   ",
                      ),
                      TextSpan(
                          text: "Change",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: (isChangeHovered == true)
                                  ? TextDecoration.underline
                                  : null),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint("Return to Email Verification");
                            },
                          onEnter: (value) {
                            setState(() {
                              isChangeHovered = true;
                            });
                          },
                          onExit: (value) {
                            setState(() {
                              isChangeHovered = false;
                            });
                          }),
                    ])),

                Column(
                  children: [
                    // TextFormField
                    MyTextFormField(
                      initialValue: null,
                      prefixIcon: const Icon(Icons.password),
                      onChanged: (value) => widget.passwordOnChanged(value),
                      textInputType: TextInputType.visiblePassword,
                      labelText: "Password",
                      obscuredText: true,
                      changeObscuredText: null,
                    ),

                    // Forget Password
                    Align(
                      alignment: Alignment.topRight,
                      child: RichText(
                          text: TextSpan(
                              text: "Forgot your password?",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: (isForgotPasswordHovered == true)
                                      ? TextDecoration.underline
                                      : null),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  forgotPasswordDialog();
                                },
                              onEnter: (value) {
                                setState(() {
                                  isForgotPasswordHovered = true;
                                });
                              },
                              onExit: (value) {
                                setState(() {
                                  isForgotPasswordHovered = false;
                                });
                              })),
                    ),
                  ],
                ),

                // Having a submitted button
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: (widget.password != "")
                          ? () {
                              debugPrint(widget.password);
                              widget.updateLoginState(
                                  "Two-Factor Authentication");
                            }
                          : null,
                      child: const Text("Submit")),
                ),

                // Having Check box to remember
                Row(
                  children: [
                    MyCheckBox(
                      checkbox: keepMeSignedIn,
                      updateCheckBox: (value) {
                        setState(() {
                          keepMeSignedIn = value;
                        });
                      },
                    ),
                    const Text("Keep me signed in."),
                  ],
                )
              ],
            ),
          ),
        )));
  }

  Future<void> forgotPasswordDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          String keyCode = "";

          return SimpleDialog(
            title: const Text("Verification"),
            contentPadding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
            children: [
              RichText(
                  text: TextSpan(
                      text: "The code is sent to your ",
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: widget.email,
                        style: const TextStyle(color: Colors.blue)),
                  ])),
              const SizedBox(
                height: 16.0,
              ),
              MyTextFormField(
                initialValue: null,
                  onChanged: (value) {
                    setState(() {
                      keyCode = value;
                    });
                  },
                  textInputType: TextInputType.number,
                  labelText: "Key Code",
                  obscuredText: false,
                  changeObscuredText: null,
                  prefixIcon: const Icon(Icons.code)),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (keyCode != "") {
                        Navigator.pushNamedAndRemoveUntil(context,
                            "changePassword", ModalRoute.withName("/"));
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
