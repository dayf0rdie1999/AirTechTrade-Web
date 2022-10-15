import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Projects/EagleDel-1/ProjectProgression/ProjectDetailStep/ProjectStep.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProjectProgress extends StatefulWidget {
  const ProjectProgress({Key? key}) : super(key: key);

  @override
  State<ProjectProgress> createState() => _ProjectProgressState();
}

class _ProjectProgressState extends State<ProjectProgress> {
  int _index = 0;

  final projectProgressList = ProjectDetailProgressionList();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(
          "The Project Progress",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index = _index - 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < 4) {
              setState(() {
                _index = _index + 1;
              });
            }
          },
          steps: projectProgressList.projectDetailList.map((product) {
            return Step(
                title: LinearPercentIndicator(
                  width: 140.0,
                  lineHeight: 14.0,
                  percent: product.progress,
                  center: Text(
                    "${(product.progress * 100).toString()}%",
                  ),
                  leading: Text("${product.title}"),
                  barRadius: const Radius.circular(16.0),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                ),
                content: Text(
                  "${product.projectDetailName}",
                  style: Theme.of(context).textTheme.bodyText1,
                ));
          }).toList(),
        ),
      ),
    ]);
  }
}
