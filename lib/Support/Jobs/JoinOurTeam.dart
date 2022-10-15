import 'package:animate_icons/animate_icons.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Header/MyAppBarPage.dart';
import 'package:my_app/Support/Jobs/JobFilterHeader.dart';
import 'package:my_app/Support/Jobs/JobFilters.dart';
import 'package:my_app/Support/Jobs/JobsDescription.dart';
import 'package:my_app/Utils/MyCheckBox.dart';
import 'package:my_app/Utils/MyTextFormField.dart';

class JoinOurTeamPage extends StatefulWidget {

  const JoinOurTeamPage({Key? key}) : super(key: key);

  @override
  State<JoinOurTeamPage> createState() => _JoinOurTeamPageState();
}

class _JoinOurTeamPageState extends State<JoinOurTeamPage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leadingWidget: null,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Job Filters
          Container(
            width: 350.0,
            child: JobFiltersWidget(),
          ),

          // List of Showing Jobs
          Expanded(
            flex: 1,
            child: JobsDescriptionWidgets(),
          ),

        ],
      ),
    );
  }
}
