import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class ReCaptChaWidget extends StatefulWidget {
  final bool isHuman;
  final Function(bool) updateCheckBox;
  const ReCaptChaWidget(
      {Key? key, required this.isHuman, required this.updateCheckBox})
      : super(key: key);

  @override
  State<ReCaptChaWidget> createState() => _ReCaptChaWidgetState();
}

class _ReCaptChaWidgetState extends State<ReCaptChaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75.0,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "I am a human",
              style: Theme.of(context).textTheme.headline6,
            ),
            MSHCheckbox(
              size: 32,
              value: widget.isHuman,
              checkedColor: Colors.blue,
              style: MSHCheckboxStyle.stroke,
              onChanged: (value) {
                widget.updateCheckBox(value);
              },
            ),
          ],
        ));
  }
}
