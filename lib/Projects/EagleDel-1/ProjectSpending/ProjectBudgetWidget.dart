import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:my_app/Projects/EagleDel-1/ProjectSpending/ProjectBudget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProjectBudgetWidget extends StatelessWidget {
  const ProjectBudgetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final EagleDelProjectBudget = ProjectBudget(1132.0, 0.0);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "The Project Budget",
        style: Theme.of(context).textTheme.headline6,
      ),
      Text(
        "\$${EagleDelProjectBudget.currentMoney}/ ${EagleDelProjectBudget.projectGoal}",
        style: Theme.of(context).textTheme.headline3,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
        child: LinearPercentIndicator(
          alignment: MainAxisAlignment.center,
          width: MediaQuery.of(context).size.width - 100,
          animation: true,
          lineHeight: 20.0,
          animationDuration: 2000,
          percent: EagleDelProjectBudget.calculatePercentCompleted() / 100,
          center: Text("${EagleDelProjectBudget.calculatePercentCompleted()}%"),
          barRadius: const Radius.circular(16.0),
          progressColor: Colors.yellowAccent,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "supports/invest-in-us");
                },
                child: const Text("Invest The Project"),
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "supports/join-our-team");
                },
                child: const Text("Support Building"),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
