import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PersonalInfoSection extends StatelessWidget {
  final String title;
  final Widget subtitle;
  final bool isImage;
  final bool isDividerNeeded;
  final VoidCallback navigatingWidget;
  const PersonalInfoSection(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isImage,
      required this.isDividerNeeded,
      required this.navigatingWidget
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigatingWidget,
      child: Container(
        decoration: BoxDecoration(
            border: (isDividerNeeded == true)
                ? const Border(bottom: BorderSide())
                : null),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200.0,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: subtitle,
                  ),
                  Container(
                    width: 200.0,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                      child: (isImage == true)
                          ? const CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 32.0,
                            )
                          : const Icon(
                              Icons.chevron_right,
                              size: 32.0,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
