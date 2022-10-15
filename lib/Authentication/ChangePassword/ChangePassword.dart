import 'package:flutter/material.dart';
import 'package:my_app/Utils/MyTextFormField.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  bool isObscuredText = true;

  String password = "";

  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "AirTechTrade",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 400.0,
          width: 400.0,
          child: Card(
              child: Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // The Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Change Password",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),

                  // Creating two password form
                  // Change Password
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

                  // Confirm the password
                  MyTextFormField(
                    initialValue: null,
                    onChanged: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    },
                    textInputType: TextInputType.visiblePassword,
                    labelText: "Confirm Password",
                    obscuredText: true,
                    changeObscuredText: null,
                    prefixIcon: const Icon(Icons.password)),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (confirmPassword != "" && password != "")
                          ? () {
                              Navigator.pop(context);
                            }
                          : null,
                        child: const Text("Submit")),
                  )
                ],
              ),
            ),
          )),
        ),
      ]),
    );
  }
}
