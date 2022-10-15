import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Header/MyAppBarPage.dart';
import 'package:my_app/Profile/Personal/Personal.dart';
import 'package:my_app/Profile/Personal/PersonalInfoDetail/PersonalNameDetail/PersonalNameDetail.dart';

class ChangePersonalNameWidget extends StatefulWidget {

  final String userFirstName;
  final String userLastName;
  const ChangePersonalNameWidget({super.key, required this.userFirstName, required this.userLastName});

  @override
  State<ChangePersonalNameWidget> createState() =>
      _ChangePersonalNameWidgetState();
}

class _ChangePersonalNameWidgetState extends State<ChangePersonalNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          leadingWidget: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 32.0),
            child: Container(
                width: 600.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Form(
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                      child: Wrap(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                            child: TextFormField(
                              initialValue: widget.userFirstName,
                              decoration: const InputDecoration(
                                label: Text("First Name"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                            child: TextFormField(
                              initialValue: widget.userLastName,
                              decoration: const InputDecoration(
                                label: Text("Last Name"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          Container(
                            width: 400.0,
                            child: ListTile(
                              title: const Text("Who can see your name"),
                              subtitle: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: RichText(
                                  text: const TextSpan(
                                    text:
                                        "Anyone can see this info when they communicate with you or view content you create in Google services. \n",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ),
                              leading: const Icon(Icons.group_outlined),
                            ),
                          ),

                          // Cancel and Validate Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              const SizedBox(
                                width: 16.0,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  debugPrint(
                                      "Complete updating the name change");
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                    child: Text("Save"),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ));
  }
}
