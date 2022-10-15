import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:my_app/Header/MyAppBarPage.dart';
import 'package:my_app/Profile/Personal/PersonalInfoDetail/PersonalNameDetail/ChangePersonalName.dart';

class PersonalNameDetailWidget extends StatelessWidget {
  final String userFirstName;
  final String userLastName;
  final String? userNickname;
  const PersonalNameDetailWidget(
      {super.key, required this.userFirstName, required this.userLastName, required this.userNickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          leadingWidget: null,
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
                  child: Wrap(
                    children: [
                      ListTile(
                        title: const Text("Name"),
                        subtitle: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                          child: Text(userFirstName + " " + userLastName),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePersonalNameWidget(userFirstName: userFirstName,userLastName: userLastName,)));
                          },
                        ),
                      ),
                      const Divider(
                        thickness: 0.1,
                        color: Colors.black,
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      ListTile(
                        title: const Text("NICKNAME"),
                        subtitle: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            (userNickname != null)
                                ? userNickname!
                                : "No nickname",
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            debugPrint("Edit Nickname");
                          },
                        ),
                      ),
                      const Divider(
                        thickness: 0.1,
                        color: Colors.black,
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      Container(
                        width: 400.0,
                        child: ListTile(
                          title: Text("Who can see your name"),
                          subtitle: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
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
                    ],
                  ),
                )),
          ),
        ));
  }
}
