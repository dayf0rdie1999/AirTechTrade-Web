import 'package:animate_icons/animate_icons.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Support/Jobs/JobFilterHeader.dart';
import 'package:my_app/Utils/MyCheckBox.dart';

import '../../Utils/MyTextFormField.dart';

class JobFiltersWidget extends StatefulWidget {
  const JobFiltersWidget({super.key});

  @override
  State<JobFiltersWidget> createState() => _JobFiltersWidgetState();
}

class _JobFiltersWidgetState extends State<JobFiltersWidget> {

  // Job Selection Text Field
  String jobSelection = "";

  // Locations
  List<String> locationSelect = [];

  TextEditingController locationTextController = TextEditingController();

  // Locations
  List<String> cities = [
    'Austin, TX, USA',
    'Daytona Beach, FL, USA',
    'Seattle, WA, USA',
    'Foutain Valley, CA, USA',
    'United States',
    'California, USA',
  ];

  // CheckBox Show Remote-Eligible Jobs
  bool isRemoteEligible = false;

  // Creating a List Map for Skills & Qualifications
  List<Map<String, dynamic>> jobCategory = [
    {"Job": "Software Enginner", "isSelected": false, "Job Positions": 1},
    {"Job": "Mechanical Engineer", "isSelected": false, "Job Positions": 1},
    {
      "Job": "Sales, Advertising, & Account Management",
      "isSelected": false,
      "Job Positions": 1
    },
    {"Job": "Human Resources", "isSelected": false, "Job Positions": 1},
  ];

  // Creating a List Map for types of degrees
  List<Map<String, dynamic>> degreeList = [
    {"Degree": "Associate", "isSelected": false},
    {"Degree": "Bachelor's", "isSelected": false},
    {"Degree": "Master's", "isSelected": false},
    {"Degree": "Ph.D.", "isSelected": false},
    {"Degree": "Pursuing Degree", "isSelected": false},
  ];

  // Creating a List Map for types of jobs
  List<Map<String, dynamic>> jobTypesList = [
    {"Job Types": "Full-time", "isSelected": false},
    {"Job Types": "Part-time", "isSelected": false},
    {"Job Types": "Temporary", "isSelected": false},
    {"Job Types": "Intern", "isSelected": false},
  ];

  // Bool for opening the filter sections
  bool isLocationSectionOpen = false;
  bool isSkillsSectionOpen = false;
  bool isDegreeSectionOpen = false;
  bool isJobTypesSectionOpen = false;

  // Controller for icon
  AnimateIconController locationIconController = AnimateIconController();
  AnimateIconController skillsIconController = AnimateIconController();
  AnimateIconController degreeIconController = AnimateIconController();
  AnimateIconController jobTypesIconController = AnimateIconController();

  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: ListView(
          children: [
            Column(
              children: [
                // Profession Types
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Job Types",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          TextButton(
                              onPressed: () {
                                debugPrint(
                                    "Reset the Job Filters Settings");
                              },
                              child: const Text(
                                "Reset Filters",
                                style: TextStyle(color: Colors.blue),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      MyTextFormField(
                          onChanged: (value) {
                            setState(() {
                              jobSelection = value;
                            });
                          },
                          textInputType: TextInputType.name,
                          labelText: "Engineer, Design, Sales",
                          obscuredText: false,
                          changeObscuredText: null,
                          prefixIcon: const Icon(Icons.work),
                          initialValue: null),
                    ],
                  ),
                ),
          
                const SizedBox(
                  height: 32.0,
                ),
          
                // Profession Locations
                Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide())),
                    child: Column(
                      children: [
                        // Click to open the Locations Drawer
                        JobFilterHeaderWidget(
                          controller: locationIconController,
                          isSectionOpen: isLocationSectionOpen,
                          updateSection: () {
                            setState(() {
                              isLocationSectionOpen =
                                  !isLocationSectionOpen;
                            });
                          },
                          headerTitle: "Locations",
                        ),
          
                        (isLocationSectionOpen == true)
                            ? Container(
                                child: Column(children: [
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  (locationSelect.isNotEmpty)
                                      ? Container(
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Wrap(
                                              spacing: 5.0,
                                              children: locationSelect
                                                  .map((value) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: InputChip(
                                                    onDeleted: () {
                                                      setState(() {
                                                        locationSelect
                                                            .remove(value);
                                                      });
                                                    },
                                                    label: Text(value),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  (locationSelect.isNotEmpty)
                                      ? const SizedBox(
                                          height: 16.0,
                                        )
                                      : Container(),
                                  (locationSelect.length < 4)
                                      ? DropDownField(
                                          controller:
                                              locationTextController,
                                          icon:
                                              const Icon(Icons.location_on),
                                          labelText: 'Select Locations',
                                          items: cities,
                                          onValueChanged:
                                              (dynamic newValue) {
                                            setState(() {
                                              locationSelect.add(newValue);
          
                                              locationTextController
                                                  .clear();
                                            });
                                          },
                                        )
                                      : const Text(
                                          "You can only choose 4 locations at a time"),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  Row(children: [
                                    MyCheckBox(
                                        checkbox: isRemoteEligible,
                                        updateCheckBox: (value) {
                                          setState(() {
                                            isRemoteEligible = value;
                                          });
                                        }),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    const Text(
                                        "Show all remote-eligible jobs"),
                                  ]),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                ]),
                              )
                            : Container(),
                      ],
                    )),
          
                const SizedBox(
                  height: 32.0,
                ),
          
                // Jobs Categories
                Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide())),
                  child: Column(
                    children: [
                      // Click to open the Locations Drawer
                      JobFilterHeaderWidget(
                        controller: skillsIconController,
                        isSectionOpen: isSkillsSectionOpen,
                        updateSection: () {
                          setState(() {
                            isSkillsSectionOpen = !isSkillsSectionOpen;
                          });
                        },
                        headerTitle: "Job Categories",
                      ),
          
                      // Widgets For Job Categories
                      (isSkillsSectionOpen == true)
                          ? Container(
                              height: 200.0,
                              child: ListView(
                                children: jobCategory.map((category) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        border: Border(bottom: BorderSide())),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: RichText(
                                            text: TextSpan(
                                                text: category["Job"],
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "  (${category["Job Positions"].toString()})",
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.black38),
                                                  ),
                                                ]),
                                          )),
                                          MyCheckBox(
                                            checkbox:
                                                category["isSelected"],
                                            updateCheckBox: (value) {
                                              setState(() {
                                                category["isSelected"] =
                                                    value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
          
                const SizedBox(
                  height: 32.0,
                ),
          
                // Degree Selections
                Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide())),
                    child: Column(
                      children: [
                        JobFilterHeaderWidget(
                          headerTitle: "Degree",
                          controller: degreeIconController,
                          isSectionOpen: isDegreeSectionOpen,
                          updateSection: () {
                            setState(() {
                              isDegreeSectionOpen = !isDegreeSectionOpen;
                            });
                          },
                        ),
                        (isDegreeSectionOpen == true)
                            ? Container(
                                height: 150.0,
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5.0,
                                  crossAxisSpacing: 5.0,
                                  childAspectRatio: 4.0,
                                  children: degreeList.map((degree) {
                                    return Row(
                                      children: [
                                        MyCheckBox(
                                            checkbox: degree["isSelected"],
                                            updateCheckBox: (value) {
                                              setState(() {
                                                degree["isSelected"] =
                                                    !degree["isSelected"];
                                              });
                                            }),
                                        Text(degree["Degree"]),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              )
                            : Container(),
                      ],
                    )),
          
                const SizedBox(
                  height: 32.0,
                ),
          
                // Job Types
                Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide())),
                  child: Column(children: [
          
                    // Job Types Header
                    JobFilterHeaderWidget(
                        controller: jobTypesIconController,
                        isSectionOpen: isJobTypesSectionOpen,
                        updateSection: () {
                          setState(() {
                            isJobTypesSectionOpen = !isJobTypesSectionOpen;
                          });
                        },
                        headerTitle: "Job types"),
          
                    (isJobTypesSectionOpen == true) ? Container(
                      height: 100.0,
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 4.0,
                        children: jobTypesList.map((jobTypes) {
                          return Row(
                            children: [
                              MyCheckBox(
                                checkbox: jobTypes["isSelected"],
                                updateCheckBox: (value) {
                                  setState(() {
                                    jobTypes["isSelected"] = value;
                                  });
                                },
                              ),
                              Text(jobTypes["Job Types"]),
                            ],
                          );
                        }).toList(),
                      ),
                    ) : Container(),
          
          
                  ]),
                )
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}