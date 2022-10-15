import 'package:flutter/material.dart';
import 'package:my_app/Profile/Personal/PersonalExample/PersonalExample.dart';
import 'package:my_app/Profile/Personal/PersonalInfoDetail/BirthdayInfoDetail/BirthdayInfoDetail.dart';
import 'package:my_app/Profile/Personal/PersonalInfoDetail/PersonalGenderDetail/PersonalGenderDetail.dart';
import 'package:my_app/Profile/Personal/PersonalInfoDetail/PersonalNameDetail/PersonalNameDetail.dart';
import 'package:my_app/Profile/Personal/PersonalInfoSection.dart';

class PersonalWidgets extends StatelessWidget {
  const PersonalWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> myPersonalInfo = PersonalExample().myPersonalInfo;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
      child: ListView(
        children: [
          // Title
          const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Your Profile Info",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0),
              )),

          const SizedBox(height: 8.0),

          // Title Description
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 500.0,
                child: const Text(
                  "Personal info and options to manage it. You can make some of this info, like your contact details, visible to others so they can reach you easily. You can also see a summary of your profiles.",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0),
                ),
              )),

          const SizedBox(height: 16.0),

          // Basic Personal Info
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 32.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Basic info",
                        style: TextStyle(fontSize: 24.0, color: Colors.black),
                      ),

                      // Section for personal photo
                      PersonalInfoSection(
                        title: "Photo",
                        subtitle: const Text(
                          "A photo helps personalzie your account",
                          style: TextStyle(color: Colors.black87),
                        ),
                        isImage: true,
                        isDividerNeeded: true,
                        navigatingWidget: () {
                          _dialogBuilder(context);
                        },
                      ),

                      // Name Section
                      PersonalInfoSection(
                        title: "Name",
                        subtitle: Text(
                          myPersonalInfo["Name"]["firstName"] +
                              " " +
                              myPersonalInfo["Name"]["lastName"],
                          style: TextStyle(color: Colors.black87),
                        ),
                        isImage: false,
                        isDividerNeeded: true,
                        navigatingWidget: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PersonalNameDetailWidget(
                                        userFirstName: myPersonalInfo["Name"]
                                            ["firstName"],
                                        userLastName: myPersonalInfo["Name"]
                                            ["lastName"],
                                        userNickname: null,
                                      )));
                        },
                      ),

                      PersonalInfoSection(
                        title: "Birthday",
                        subtitle: Text(
                          "${myPersonalInfo["Birthday"]["Month"]} ${myPersonalInfo["Birthday"]["Day"]}, ${myPersonalInfo["Birthday"]["Year"]}",
                          style: const TextStyle(color: Colors.black87),
                        ),
                        isImage: false,
                        isDividerNeeded: true,
                        navigatingWidget: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BirthdayInfoDetailWidget(
                                        userDay: myPersonalInfo["Birthday"]
                                            ["Day"],
                                        userMonth: myPersonalInfo["Birthday"]
                                            ["Month"],
                                        userYear: myPersonalInfo["Birthday"]
                                            ["Year"],
                                      )));
                        },
                      ),

                      // Section Gender Section
                      PersonalInfoSection(
                        title: "Gender",
                        subtitle: Text(
                          myPersonalInfo["Gender"],
                          style: TextStyle(color: Colors.black87),
                        ),
                        isImage: false,
                        isDividerNeeded: false,
                        navigatingWidget: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                    const  PersonalGenderDetailWidget()));
                        },
                      ),

                      // Section for personal name
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Contact Info
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 32.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Contact info",
                        style: TextStyle(fontSize: 24.0, color: Colors.black),
                      ),

                      // Section for email
                      PersonalInfoSection(
                        title: "Email",
                        subtitle: Text(
                          myPersonalInfo["Email"],
                          style: TextStyle(color: Colors.black87),
                        ),
                        isImage: false,
                        isDividerNeeded: true,
                        navigatingWidget: () {
                          debugPrint("Hello World");
                        },
                      ),

                      // Section for phone
                      PersonalInfoSection(
                        title: "Phone",
                        subtitle: Text(
                          myPersonalInfo["Phone Number"],
                          style: TextStyle(color: Colors.black87),
                        ),
                        isImage: false,
                        isDividerNeeded: false,
                        navigatingWidget: () {
                          debugPrint("Hello World");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Options for two-factor authentication
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 32.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Signing in to AirTechTrade",
                        style: TextStyle(fontSize: 24.0, color: Colors.black),
                      ),

                      // Password Section
                      PersonalInfoSection(
                        title: "Password",
                        subtitle: Text(
                            myPersonalInfo["Password"]["Updated Time"],
                            style: TextStyle(color: Colors.black87)),
                        isImage: false,
                        isDividerNeeded: true,
                        navigatingWidget: () {
                          debugPrint("Hello World");
                        },
                      ),

                      // 2-Step Verification
                      PersonalInfoSection(
                        title: "2-Step Verification",
                        subtitle: Row(children: [
                          (myPersonalInfo["2-Step Verification"]
                                      ["isTurnedOn"] ==
                                  true)
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                )
                              : const Icon(
                                  Icons.dangerous,
                                  color: Colors.red,
                                ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          (myPersonalInfo["2-Step Verification"]
                                      ["isTurnedOn"] ==
                                  true)
                              ? const Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.black87),
                                )
                              : const Text(
                                  "No",
                                  style: TextStyle(color: Colors.black87),
                                ),
                        ]),
                        isImage: false,
                        isDividerNeeded: false,
                        navigatingWidget: () {
                          debugPrint("Hello World");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Ways to verify that it is you
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 32.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your verification",
                        style: TextStyle(fontSize: 24.0, color: Colors.black),
                      ),

                      // Recovery Phone
                      PersonalInfoSection(
                        title: "Recovery Phone",
                        subtitle: Text(
                          myPersonalInfo["Recovery"]["Phone"],
                          style: const TextStyle(color: Colors.black87),
                        ),
                        isImage: false,
                        isDividerNeeded: true,
                        navigatingWidget: () {
                          debugPrint("Hello World");
                        },
                      ),

                      // Recovery Email
                      PersonalInfoSection(
                        title: "Recovery Email",
                        subtitle: Text(
                          myPersonalInfo["Recovery"]["Email"],
                          style: const TextStyle(color: Colors.black87),
                        ),
                        isImage: false,
                        isDividerNeeded: false,
                        navigatingWidget: () {
                          debugPrint("Hello World");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 128.0, 0.0, 128.0),
          child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.clear)),
                const SizedBox(
                  width: 32.0,
                ),
                Text(
                  "Profile Picture",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  width: 32.0,
                ),
                IconButton(
                    onPressed: () {
                      debugPrint("Navigating to different widget for feedback");
                    },
                    icon: const Icon(Icons.feedback)),
              ],
            ),
            content: Container(
              width: 350.0,
              child: Wrap(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "A picture helps people recognize you and lets you know when you’re signed in to your account",
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.black54,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 128.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            label: const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                                child: Text("Change")),
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              debugPrint("Change Avatar");
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: OutlinedButton.icon(
                            label: const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                                child: Text("Remove")),
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              debugPrint("Remove Avatar");
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
