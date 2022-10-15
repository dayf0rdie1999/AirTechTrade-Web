import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Utils/MyCheckBox.dart';

class NotifyAuthenticateWidget extends StatelessWidget {
  const NotifyAuthenticateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        "Opt-in to receive occasional product updates," +
            "user research invitations, company announcements, and digests.",
        style: Theme.of(context)
            .textTheme
            .bodyText1,
      ),
    );
    
  }
}
