import 'package:flutter/material.dart';
import 'package:my_app/Footer/Footer.dart';
import 'package:my_app/Header/MyAppBarPage.dart';
import 'package:my_app/HomePage/AboutUS/AboutUs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    
    final pages = List.generate(
        6,
        (index) => Center(
          child: Text(
        "Page $index",
        style: TextStyle(color: Colors.indigo),
      )),
    );

    return Scaffold(
      appBar: MyAppBar(
        leadingWidget: null,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          // Creating a Page Selector Tab
          Container(
              height: 400.0,
              child: Stack(
                children: [
                Align(
                  alignment: Alignment.center,
                  child: PageView.builder(
                    controller: controller,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    },
                  ),
                ),
                
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: pages.length,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 16,
                        dotWidth: 16,
                        // strokeWidth: 5,
                      ),
                      onDotClicked: (index) {
                        setState(() {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        });
                      },
                    ),
                  ),
                )
              ])),
          AboutUsWidget(),
          FooterWidget(),
        ],
      ),
    );
  }
}
