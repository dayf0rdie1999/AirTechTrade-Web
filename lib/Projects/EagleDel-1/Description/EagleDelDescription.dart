import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EagleDelDescription extends StatelessWidget {
  const EagleDelDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text("Description", style: Theme.of(context).textTheme.headline6,),

        const SizedBox(
          height: 16.0,
        ),

        Container(
          width: 1000.0,
          child: Text(
            
            "The EagleDel-1 is the first prototype in the drone delivery series of the company. " 
            "It is designed as a proof of concept that the team has the capabilities to design and meet the mission requirements."
            "The mission requires the drone to have the capabilities such as performing autopilot with the mission plan"
            "Deliverying goods from one destination to the other while maintaining the quality of the product.",

            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
