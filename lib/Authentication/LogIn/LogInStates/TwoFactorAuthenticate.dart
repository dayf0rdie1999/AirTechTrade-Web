import 'package:flutter/material.dart';
import 'package:my_app/Utils/MyTextFormField.dart';

class TwoFactorAuthenticateWidget extends StatefulWidget {
  final Function(String) updateLoginState;
  const TwoFactorAuthenticateWidget({Key? key, required this.updateLoginState})
      : super(key: key);

  @override
  State<TwoFactorAuthenticateWidget> createState() =>
      _TwoFactorAuthenticateWidgetState();
}

class _TwoFactorAuthenticateWidgetState
    extends State<TwoFactorAuthenticateWidget> {
  int _indexSelected = 0;

  String keyCode = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: (_indexSelected > 0) ? 400 : 200,
        width: 400.0,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Authentication",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: const TextSpan(
                  text: "You can only select ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: "one ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                    TextSpan(
                      text: "of the options",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
              ),

              // Creating Checkbox for authenticate with phone number
              SizedBox(
                width: double.infinity,
                child: ChoiceChip(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  label: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Text me at ***-***-3682"),
                            _indexSelected == 1
                                ? const Icon(Icons.arrow_drop_down)
                                : const Icon(Icons.arrow_left),
                          ],
                        ),
                      ]),
                  selected: _indexSelected == 1,
                  onSelected: (_indexSelected == 0)
                      ? (value) {
                          setState(() {
                            _indexSelected = value ? 1 : -1;
                          });
                        }
                      : null,
                ),
              ),

              _indexSelected == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _indexSelected == 1
                            ? RichText(
                                text: const TextSpan(
                                    text: "The code will expire in ",
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                    TextSpan(
                                        text: "15 minutes",
                                        style: TextStyle(color: Colors.red)),
                                  ]))
                            : Container(),
                        _indexSelected == 1
                            ? const SizedBox(
                                height: 16.0,
                              )
                            : Container(),
                        _indexSelected == 1
                            ? MyTextFormField(
                              initialValue: null,
                                prefixIcon: const Icon(Icons.code),
                                onChanged: (value) {
                                  setState(() {
                                    keyCode = value;
                                  });
                                },
                                textInputType: TextInputType.number,
                                labelText: "Key Code",
                                obscuredText: false,
                                changeObscuredText: null)
                            : Container(),
                      ],
                    )
                  : Container(),

              // Creating checkbox for authenticate with email
              SizedBox(
                width: double.infinity,
                child: ChoiceChip(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  label: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Email me at **********@gmail.com"),
                        _indexSelected == 2
                            ? const Icon(Icons.arrow_drop_down)
                            : const Icon(Icons.arrow_left),
                      ],
                    ),
                  ]),
                  selected: _indexSelected == 2,
                  onSelected: (_indexSelected == 0)
                      ? (value) {
                          setState(() {
                            _indexSelected = value ? 2 : -1;
                          });
                        }
                      : null,
                ),
              ),

              _indexSelected == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _indexSelected == 2
                            ? RichText(
                                text: const TextSpan(
                                    text: "The code will expire in ",
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                    TextSpan(
                                        text: "15 minutes",
                                        style: TextStyle(color: Colors.red)),
                                  ]))
                            : Container(),
                        _indexSelected == 2
                            ? const SizedBox(
                                height: 16.0,
                              )
                            : Container(),
                        _indexSelected == 2
                            ? MyTextFormField(
                              initialValue: null,
                                prefixIcon: const Icon(Icons.code),
                                onChanged: (value) {
                                  setState(() {
                                    keyCode = value;
                                  });
                                },
                                textInputType: TextInputType.number,
                                labelText: "Key Code",
                                obscuredText: false,
                                changeObscuredText: null)
                            : Container(),
                      ],
                    )
                  : Container(),

              // Button to submit

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: (keyCode != "")
                      ? () {
                          debugPrint("Hello World");
                          Navigator.pop(context);
                        }
                      : null,
                ),
              ),
            ],
          ),
        )));
  }
}
