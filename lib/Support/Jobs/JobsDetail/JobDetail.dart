import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Header/MyAppBarPage.dart';
import 'package:my_app/Support/Jobs/Examples/JobsExamples.dart';
import 'package:my_app/Support/Jobs/JobsDetail/SelectedJobDetail.dart';

class JobDetailWidgets extends StatefulWidget {
  final int selectedJobID;

  const JobDetailWidgets({super.key, required this.selectedJobID});

  @override
  State<JobDetailWidgets> createState() => _JobDetailWidgetsState();
}

class _JobDetailWidgetsState extends State<JobDetailWidgets> {
  late int currentSelectedJobID;

  JobsExamples jobsExamples = JobsExamples();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentSelectedJobID = widget.selectedJobID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leadingWidget: null,
      ),
      body: Row(
        children: [
          // Lists of Relavance Jobs
          Container(
              width: 350.0,
              child: Card(
                child: ListView(
                  children: jobsExamples.jobsTitle.map((job) {
                    return Card(
                      margin: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentSelectedJobID = job["Job ID"];
                          });
                        },
                        child: Container(
                          decoration: (currentSelectedJobID == job["Job ID"])
                              ? const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.blue, width: 4.0)))
                              : null,
                          height: 200.0,
                          child: Center(
                            child: ListTile(
                                title: Text(
                                  job["Job Title"],
                                  style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Job ID: ",
                                        style: const TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text:
                                                "${job["Job ID"].toString()} \n",
                                            style: const TextStyle(
                                                color: Colors.black38,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          TextSpan(
                                            text: "In-office: ",
                                            style: const TextStyle(
                                                color: Colors.black38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextSpan(
                                              text: "${job["Location"]} \n",
                                              style: const TextStyle(
                                                  color: Colors.black38,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          (job["Remote"] == true)
                                              ? const TextSpan(
                                                  text: "Remote eligible",
                                                  style: const TextStyle(
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : const TextSpan(),
                                        ]),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )),

          Expanded(
            flex: 3,
            child: SelectedJobDetail(selectedJob: jobsExamples.getSelectedJob(currentSelectedJobID)),
          ),
        ],
      ),
    );
  }
}
