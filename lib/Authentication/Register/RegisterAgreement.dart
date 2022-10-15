import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterAgreementWidget extends StatelessWidget {
  const RegisterAgreementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "By clicking \"Sign up\", you agree to our ",
        style: Theme.of(context).textTheme.bodyText1,
        children: [
          TextSpan(
              text: "terms of service, privacy policy",
              style: const TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint("Transport to Privacy Policy Page");
                }),
          TextSpan(
            text: " and ",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
              text: "cookie policy",
              style: const TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint("Transport to Cookie Policy Page");
                }),
        ]),
    );
  }
}
