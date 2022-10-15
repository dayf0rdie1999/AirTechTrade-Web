import 'package:flutter/material.dart';
import 'package:my_app/Support/Jobs/Examples/JobsExamples.dart';

class SavedJobsSummaryWidgets extends StatefulWidget {
  final Function(int) savedJobsUpdateWidget;

  const SavedJobsSummaryWidgets(
      {super.key, required this.savedJobsUpdateWidget});

  @override
  State<SavedJobsSummaryWidgets> createState() =>
      _SavedJobsSummaryWidgetsState();
}

class _SavedJobsSummaryWidgetsState extends State<SavedJobsSummaryWidgets> {
  List<Map<String, dynamic>> savedJobs = JobsExamples().getSavedJob();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Saved Jobs",
                  style: Theme.of(context).textTheme.headline6,
                ))),
        Column(
          children: savedJobs.map((job) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  job["Job Title"],
                                  style: Theme.of(context).textTheme.headline6,
                                )),
                            Expanded(
                                flex: 1,
                                child: TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      job["Share"] = !job["Share"];
                                    });
                                  },
                                  icon: (job["Share"] == false)
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
                                        color: (job["Share"] == false)
                                            ? Colors.black
                                            : Colors.blue),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        job["Save"] = !job["Save"];
                                      });
                                    },
                                    icon: (job["Save"] == false)
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
                                          color: (job["Save"] == false)
                                              ? Colors.black
                                              : Colors.blue),
                                    ))),
                          ],
                        ),
                      ),

                      (job["Share"] == true)
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 16.0, 0.0, 0.0),
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
                                        child: SelectableText(job["Job Link"]),
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
                                Text(
                                  "Job ID: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  job["Job ID"].toString(),
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
                                Text(job["Location"]),
                              ],
                            ),
                            (job["Remote"] == true)
                                ? Row(
                                    children: const [
                                      Icon(Icons.laptop),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "Remote eligible",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: const Text(
                "To Saved Jobs Detail >",
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
              onPressed: () {
                widget.savedJobsUpdateWidget(5);
              },
            ),
          ),
        )
      ],
    );
  }
}
