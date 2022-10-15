import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';

class PlatformsAuthenticationWidget extends StatefulWidget {
  const PlatformsAuthenticationWidget({Key? key}) : super(key: key);

  @override
  State<PlatformsAuthenticationWidget> createState() =>
      _PlatformsAuthenticationWidgetState();
}

class _PlatformsAuthenticationWidgetState
    extends State<PlatformsAuthenticationWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 150.0,
        width: 400.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(

              width: MediaQuery.of(context).size.width,
              child: GoogleAuthButton(
                onPressed: () {
                  debugPrint("Sign In Using Google");
                },
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FacebookAuthButton(
                onPressed: () {
                  debugPrint("Sign In Using Facebook");
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MicrosoftAuthButton(
                onPressed: () {
                  debugPrint("Sign In Using Microsoft");
                },
              ),
            ),
          ]),
      ),
    );
  }
}
