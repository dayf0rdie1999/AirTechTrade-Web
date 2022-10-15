import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Header/MyAppBarPage.dart';

class PersonalGenderDetailWidget extends StatefulWidget {
  const PersonalGenderDetailWidget({super.key});

  @override
  State<PersonalGenderDetailWidget> createState() =>
      _PersonalGenderDetailWidgetState();
}

class _PersonalGenderDetailWidgetState
    extends State<PersonalGenderDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leadingWidget: Container(),
      ),
      body: const Center(child: Text("Gender Detail Section")),
    );
  }
}
