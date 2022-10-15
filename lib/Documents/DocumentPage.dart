import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Footer/Footer.dart';
import 'package:my_app/Header/MyAppBarPage.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(leadingWidget: null,),
      body: ListView(
        children: [
          Container(
            height: 200.0,
            child: Center(child: Text("Documents",style: Theme.of(context).textTheme.headline6,)),
          ),
          FooterWidget(),
        ],
      ),
    );
  }
}
