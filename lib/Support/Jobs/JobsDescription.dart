import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Support/Jobs/Examples/JobsExamples.dart';
import 'package:my_app/Support/Jobs/JobsDetail/JobDetail.dart';

class JobsDescriptionWidgets extends StatefulWidget {
  const JobsDescriptionWidgets({super.key});

  @override
  State<JobsDescriptionWidgets> createState() => _JobsDescriptionWidgetsState();
}

class _JobsDescriptionWidgetsState extends State<JobsDescriptionWidgets> {
  JobsExamples jobs = JobsExamples();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jobs.jobsTitle.map((job) {
        List<String> qualifications = job["Qualifications"]!;

        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => JobDetailWidgets(selectedJobID: job["Job ID"],)));
          },
          child: Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Button
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

                    // Share Section
                    (job["Share"] == true)
                        ? Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
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
                                    Text("Remote eligible", style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),

                    const Divider(
                      thickness: 0.25,
                      color: Colors.black38,
                    ),

                    // Qualifications Header
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                      child: Text(
                        "Qualifications: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),

                    // Qualifications List
                    Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: qualifications.map((value) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Text(
                                  value,
                                  style: const TextStyle(
                                    height: 2.0,
                                  ),
                                  textAlign: TextAlign.start,
                                )),
                              ],
                            );
                          }).toList(),
                        )),

                    Center(
                      child: TextButton(
                        child: const Text(
                          "Expand",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => JobDetailWidgets(selectedJobID: job["Job ID"])));
                        },
                      ),
                    )
                  ],
                ),
              )),
        );
      }).toList(),
    );
  }
}
