import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Projects/EagleDel-1/Specifications/Product%20Specifications/ProductSpecifications.dart';

class SpecificationsTabs extends StatelessWidget {
  const SpecificationsTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      child: DefaultTabController(
        length: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
            Container(
              height: 50.0,
              width: 400.0,
              child: const TabBar(
                indicator: BoxDecoration(
                  color: Colors.black45,
                ),
                labelColor: Colors.white, 
                tabs: [
                  Tab(text: "Product Details"),
                ]
              ),
            ),
    
            Expanded(
              child: const TabBarView(
                children: [
                  EagleDelProductSpecifications(),
                ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}
