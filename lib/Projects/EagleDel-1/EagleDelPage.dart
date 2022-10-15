// ignore_for_file: prefer_const_constructors

import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Footer/Footer.dart';
import 'package:my_app/Header/MenuItems/MenuItems.dart';
import 'package:my_app/Projects/EagleDel-1/Description/EagleDelDescription.dart';
import 'package:my_app/Projects/EagleDel-1/ProjectDisplay/ImagesDisplay/ImageContainer.dart';
import 'package:my_app/Projects/EagleDel-1/ProjectDisplay/ImagesDisplay/ImagesDisplay.dart';
import 'package:my_app/Projects/EagleDel-1/ProjectProgression/ProgressStepper.dart';
import 'package:my_app/Projects/EagleDel-1/ProjectSpending/ProjectBudgetWidget.dart';
import 'package:my_app/Projects/EagleDel-1/Specifications/EagleDelSpecificationsTabs.dart';
import 'package:video_player/video_player.dart';
import '../../Header/MyAppBarPage.dart';
import 'ProjectDisplay/VideosDisplay/VideosDisplay.dart';

class EagleDelPage extends StatefulWidget {
  const EagleDelPage({Key? key}) : super(key: key);

  @override
  State<EagleDelPage> createState() => _EagleDelPageState();
}

class _EagleDelPageState extends State<EagleDelPage> {
  String fullDisplayImageName = "frontrightview_opendoor.png";

  bool isShowVideo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          leadingWidget: null,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      height: 500.0,
                      child: TabBarView(
                        children: [
                          Container(
                            height: 450.0,
                            child: Column(children: [
                              FullDisplayImage(
                                  fullDisplayImageName: fullDisplayImageName),
                              ImagesDisplaySelectors(
                                  fullDisplayImageName: fullDisplayImageName,
                                  changeImage: (image) {
                                    setState(() {
                                      fullDisplayImageName = image;
                                    });
                                  })
                            ]),
                          ),
                          VideosDisplay(),
                        ],
                      ),
                    ),
                    Container(
                        height: 50.0,
                        width: 400.0,
                        child: TabBar(
                          splashBorderRadius: BorderRadius.circular(50),
                          labelColor: Colors.white,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black38,
                          ),
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(
                              text: "Images",
                              icon: Icon(Icons.photo),
                              iconMargin: EdgeInsets.zero,
                            ),
                            Tab(
                              text: "Videos",
                              icon: Icon(Icons.play_arrow),
                              iconMargin: EdgeInsets.zero),
                          ],
                        )),
                  ],
                )),
            Divider(
              thickness: 2.0,
              color: Colors.grey[300],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Container(
                height: 200.0,
                child: EagleDelDescription(),
              ),
            ),
            Container(
              height: 400.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(64.0,0.0,64.0,0.0),
                child: SpecificationsTabs(),
              ),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.grey[300],
            ),
            Container(
              height: 600.0,
              child: ProjectProgress(),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.grey[300],
            ),
            Container(
              height: 200.0,
              child: ProjectBudgetWidget(),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FooterWidget(),
            ),
          ],
        )));
  }
}
