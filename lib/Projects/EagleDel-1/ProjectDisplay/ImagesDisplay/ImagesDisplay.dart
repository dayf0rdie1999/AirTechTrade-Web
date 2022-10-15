import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImagesDisplaySelectors extends StatefulWidget {
  final String fullDisplayImageName;

  final Function(String imageName) changeImage;

  const ImagesDisplaySelectors({
    Key? key,
    required this.fullDisplayImageName,
    required this.changeImage,
  }) : super(key: key);

  @override
  State<ImagesDisplaySelectors> createState() => _ImagesDisplaySelectorsState();
}

class _ImagesDisplaySelectorsState extends State<ImagesDisplaySelectors> {
  // Creating a list obtaining all images
  List<String> images = [
    "frontrightview_opendoor.png",
    "frontview.png",
    "rightview_opendoor.png",
    "rightview.png",
    "topview.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: images.map((image) {
          return Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                widget.changeImage(image);
              },
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/" + image),
                )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
