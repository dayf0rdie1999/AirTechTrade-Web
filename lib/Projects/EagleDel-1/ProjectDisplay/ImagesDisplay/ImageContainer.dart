import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FullDisplayImage extends StatefulWidget {

  final fullDisplayImageName;
  const FullDisplayImage({Key? key, required this.fullDisplayImageName}) : super(key: key);

  @override
  State<FullDisplayImage> createState() => _FullDisplayImageState();
}

class _FullDisplayImageState extends State<FullDisplayImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        height: 400.0,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/" + widget.fullDisplayImageName),
        )),
      ),
    );
  }
}
