import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';

class JobFilterHeaderWidget extends StatefulWidget {
  final AnimateIconController controller;
  final bool isSectionOpen;
  final VoidCallback updateSection;
  final String headerTitle;
  const JobFilterHeaderWidget(
      {super.key,
      required this.controller,
      required this.isSectionOpen,
      required this.updateSection,
      required this.headerTitle,
      });

  @override
  State<JobFilterHeaderWidget> createState() => _JobFilterHeaderWidgetState();
}

class _JobFilterHeaderWidgetState extends State<JobFilterHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.controller.isStart()) {
            widget.controller.animateToEnd();
          } else if (widget.controller.isEnd()) {
            widget.controller.animateToStart();
          }
        });
        
        widget.updateSection();

      },
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.headerTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
          AnimateIcons(
            startIconColor: Colors.black,
            endIconColor: Colors.black,
            startIcon: Icons.arrow_drop_down,
            controller: widget.controller,
            endIcon: Icons.arrow_drop_up,
            size: 24.0,
            onEndIconPress: () {
              return false;
            },
            onStartIconPress: () {
              return false;
            },
            duration: const Duration(milliseconds: 500),
          )
        ],
      )),
    );
  }
}
