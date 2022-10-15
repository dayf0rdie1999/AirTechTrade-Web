import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Support/Jobs/Examples/JobsExamples.dart';
import 'package:my_app/Support/Jobs/JobFilterHeader.dart';

class SelectedJobDetail extends StatefulWidget {
  final Map<String, dynamic> selectedJob;
  const SelectedJobDetail({super.key, required this.selectedJob});

  @override
  State<SelectedJobDetail> createState() => _SelectedJobDetailState();
}

class _SelectedJobDetailState extends State<SelectedJobDetail> {
  // List of job data
  late List<String> minQualifications;
  late List<String> preferredQualifications;
  late List<String> responsibilities;

  // controller
  AnimateIconController aboutTheJobIconController = AnimateIconController();
  AnimateIconController responsibilitiesIconController =
      AnimateIconController();

  // Boolean
  bool isAboutTheJobSectionOpen = false;
  bool isResponsibilitiesSectionOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    minQualifications = widget.selectedJob["Qualifications"];
    preferredQualifications = widget.selectedJob["Preferred qualifications"];
    responsibilities = widget.selectedJob["Responsibilities"];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Card(
          margin: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 32.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Title, Share & Save
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(
                            widget.selectedJob["Job Title"],
                            style: Theme.of(context).textTheme.headline6,
                          )),
                      Expanded(
                          flex: 1,
                          child: TextButton.icon(
                            onPressed: () {
                              setState(() {
                                widget.selectedJob["Share"] =
                                    !widget.selectedJob["Share"];
                              });
                            },
                            icon: (widget.selectedJob["Share"] == false)
                                ? const Icon(
                                    Icons.share_outlined,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.share,
                                    color: Colors.blue,
                                  ),
                            label: Text(
                              "Share",
                              style: TextStyle(
                                  color: (widget.selectedJob["Share"] == false)
                                      ? Colors.black
                                      : Colors.blue),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  widget.selectedJob["Save"] =
                                      !widget.selectedJob["Save"];
                                });
                              },
                              icon: (widget.selectedJob["Save"] == false)
                                  ? const Icon(
                                      Icons.bookmark_outline,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.bookmark,
                                      color: Colors.blue,
                                    ),
                              label: Text(
                                "Save",
                                style: TextStyle(
                                    color: (widget.selectedJob["Save"] == false)
                                        ? Colors.black
                                        : Colors.blue),
                              ))),
                    ],
                  ),
                ),

                // Share Section
                (widget.selectedJob["Share"] == true)
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Job Link: "),
                              Container(
                                width: 300.0,
                                decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide())),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SelectableText(
                                      widget.selectedJob["Job Link"]),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  debugPrint("Copy the website link");
                                },
                                child: const Text(
                                  "Copy",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),

                // Working Location
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Wrap(
                    runSpacing: 8.0,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.numbers),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text(
                            "Job ID: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.selectedJob["Job ID"].toString(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text(
                            "In-office: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.selectedJob["Location"]),
                        ],
                      ),
                      (widget.selectedJob["Remote"] == true)
                          ? Row(
                              children: const [
                                Icon(Icons.laptop),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "Remote eligible",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),

                // Button to apply for work
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                      child: Container(
                        height: 50.0,
                        width: 150.0,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              debugPrint("Applying for jobs");
                            },
                            icon: const Icon(Icons.open_in_new),
                            label: const Text("Apply")),
                      ),
                    )),

                // Adding Divider
                const Divider(
                  thickness: 0.5,
                  color: Colors.black38,
                ),

                // Text Header for minimum qualifications
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                  child: Container(
                    child: const Text(
                      "Minimum Qualifications:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                ),

                // List of text of min qualifications
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: minQualifications.map((value) {
                      return Text(
                        value,
                        style: const TextStyle(height: 2.0),
                      );
                    }).toList(),
                  ),
                ),

                // Text Header for preferred qualfications
                const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    "Preferred Qualifications",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),

                // List of Preferred qualifications
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: preferredQualifications.map((value) {
                      return Text(
                        value,
                        style: const TextStyle(height: 2.0),
                      );
                    }).toList(),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.black38,
                  ),
                ),

                // Text Header and Text of about the job
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.black38))),
                        child: Column(
                          children: [
                            JobFilterHeaderWidget(
                              controller: aboutTheJobIconController,
                              isSectionOpen: isAboutTheJobSectionOpen,
                              updateSection: () {
                                setState(() {
                                  isAboutTheJobSectionOpen =
                                      !isAboutTheJobSectionOpen;
                                });
                              },
                              headerTitle: "About the job",
                            ),
                            (isAboutTheJobSectionOpen == true)
                                ? Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      widget.selectedJob["About the job"],
                                      style: const TextStyle(height: 2.0),
                                    ),
                                  )
                                : const SizedBox(height: 16.0),
                            (isAboutTheJobSectionOpen == true)
                                ? const SizedBox(height: 16.0)
                                : Container(),
                          ],
                        ))),

                // Text Header and Text of the responsibilities
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Colors.black38))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          JobFilterHeaderWidget(
                            controller: responsibilitiesIconController,
                            isSectionOpen: isResponsibilitiesSectionOpen,
                            updateSection: () {
                              setState(() {
                                isResponsibilitiesSectionOpen =
                                    !isResponsibilitiesSectionOpen;
                              });
                            },
                            headerTitle: "Responsibilities",
                          ),

                          (isResponsibilitiesSectionOpen == true)
                              ? Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: responsibilities.map((value) {
                                      return Text(value, style: const TextStyle(height: 2.0),);
                                    }).toList(),
                                  ))
                              : const SizedBox(height: 16.0),

                          (isResponsibilitiesSectionOpen == true)
                              ? const SizedBox(height: 16.0)
                              : Container(),

                        ],
                      ))),

                // Text about Google's statement
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                  child: Text(widget.selectedJob["Google Statement"], style: const TextStyle(height: 2.0),),
                ),

                // Button to apply for work
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          debugPrint("Applying for jobs");
                        },
                        icon: const Icon(Icons.open_in_new),
                        label: const Text("Apply")),
                    ),
                  )
                ),

              ],
            ),
          )),
    ]);
  }
}
