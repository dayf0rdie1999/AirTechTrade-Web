import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Header/MyAppBarPage.dart';

class BirthdayInfoDetailWidget extends StatefulWidget {
  final String userMonth;
  final String userDay;
  final String userYear;
  const BirthdayInfoDetailWidget(
      {super.key,
      required this.userMonth,
      required this.userDay,
      required this.userYear});

  @override
  State<BirthdayInfoDetailWidget> createState() =>
      _BirthdayInfoDetailWidgetState();
}

class _BirthdayInfoDetailWidgetState extends State<BirthdayInfoDetailWidget> {
  late String _userMonth;
  late String _userDay;
  late String _userYear;

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "November",
    "December"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _userMonth = widget.userMonth;
    _userDay = widget.userDay;
    _userYear = widget.userYear;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          leadingWidget: Container(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
          child: Column(
            children: [
              // Title
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 600.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        splashRadius: 24.0,
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      const Text(
                        "Birthday",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36.0,
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ),

              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),

              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 600.0,
                  child: Column(
                    children: [
                      const Text(
                        "Your birthday may be used for account security and personalization across Google services. If this Google Account is for a business or organization, use the birthday of the person who manages the account.",
                        style: TextStyle(color: Colors.black54, height: 1.5),
                      ),
                      Container(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Wrap(
                              children: [
                                const Text(
                                  "Update birthday",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),

                                const SizedBox(
                                  height: 32.0,
                                ),

                                // Update Birthday Section
                                Container(
                                  width: 500.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Month section
                                      Container(
                                        width: 200.0,
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                            label: Text("Month"),
                                            border: OutlineInputBorder(),
                                            isCollapsed: true,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                              child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: DropdownButton<String>(
                                              value: _userMonth,
                                              items: months.map((value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  _userMonth = value!;
                                                });
                                              },
                                            ),
                                          )),
                                        ),
                                      ),

                                      // Day Section
                                      Container(
                                        width: 100.0,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            label: Text("Day"),
                                            border: OutlineInputBorder(),
                                          ),
                                          initialValue: _userDay,
                                        ),
                                      ),

                                      // Year Section
                                      Container(
                                        width: 150.0,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            label: Text("Year"),
                                            border: OutlineInputBorder(),
                                          ),
                                          initialValue: _userYear,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 64.0,
                                ),

                                // Save or Cancel Button
                                Container(
                                  width: 500.0,
                                  child: Row(
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
                                              "Update the user birthday");
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              16.0, 8.0, 16.0, 8.0),
                                          child: Text("Save"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
