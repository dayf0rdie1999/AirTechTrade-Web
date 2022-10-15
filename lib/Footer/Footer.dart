// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 400,
        color: Colors.yellow[800],
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                          child: ListView(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Center(
                              child: Text(
                            "Projects",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextButton(
                            style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Colors.blueAccent;
                                return Colors
                                    .black;
                              }),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, "projects/EagleDel-1");
                            },
                            child: Text(
                              "EagleDel-1",
                            )
                          )
                        ],
                      )),
                      Expanded(
                          child: ListView(
                        children: [
                          Center(
                              child: Text(
                            "Downloads",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextButton(
                            style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Colors.blueAccent;
                                return Colors
                                    .black;
                              }),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(context, "docs");
                            },
                            child: Text(
                              "Manual",
                            ))
                        ],
                      )),
                      Expanded(
                          child: ListView(
                        children: [
                          Center(
                              child: Text(
                            "Supports",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextButton(
                            style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Colors.blueAccent;
                                return Colors
                                    .black;
                              }),
                            ),
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, "supports/partner-with-us");
                              },
                              child: Text(
                                "Partner With Us",
                              )),
                          TextButton(
                            style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Colors.blueAccent;
                                return Colors
                                    .black;
                              }),
                            ),
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, "supports/join-our-team");
                              },
                              child: Text(
                                "Career With Us",
                              )),
                          TextButton(
                            style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Colors.blueAccent;
                                return Colors
                                    .black;
                              }),
                            ),
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, "supports/invest-in-us");
                              },
                              child: Text(
                                "Invest In Us",
                              )),
                        ],
                      )),
                      Expanded(
                        flex: 3,
                        child: Container(),
                      ),
                    ],
                  ),
                )),
            Divider(
              thickness: 2.0,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 400.0,
                    child: Center(
                        child: Text(
                      "AirTechTrade LLC",
                      style: Theme.of(context).textTheme.headline6,
                    )),
                  ),
                  Container(
                    width: 200.0,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              debugPrint("Go To FaceBook");
                            },
                            icon: Icon(Icons.facebook),
                          ),
                          IconButton(
                            onPressed: () {
                              debugPrint("Go To Apple");
                            },
                            icon: Icon(Icons.apple),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
