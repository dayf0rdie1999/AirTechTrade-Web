import 'package:flutter/material.dart';

class PersonalInfoSummaryWidget extends StatefulWidget {
  const PersonalInfoSummaryWidget({super.key});

  @override
  State<PersonalInfoSummaryWidget> createState() =>
      _PersonalInfoSummaryWidgetState();
}

class _PersonalInfoSummaryWidgetState extends State<PersonalInfoSummaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 128.0,
            height: 128.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.blue),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: Row(
                    children: const [
                      Icon(Icons.email),
                      SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                        child: Text(
                          "Email Address",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.cake,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                        child: Text(
                          "Member since Month, Year",
                          style: TextStyle(color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: TextButton(
                    onPressed: () {
                      debugPrint("Change Your Password >");
                    },
                    child: const Text(
                      "Change Your Password >",
                      style: TextStyle(color: Colors.blue),
                      overflow: TextOverflow.ellipsis,
                    )),
                ),
  
              ],
            ),
          ),
        ],
      ),
    );
  }
}
