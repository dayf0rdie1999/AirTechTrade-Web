import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300,
      color: Colors.yellow[600],
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 16.0,),
            Text(
              'About Us',
              style: Theme.of(context).textTheme.headline6,
            ),
            
            const SizedBox(height: 16.0,),
            Align(
              alignment: Alignment.center,
              child: Text(
                "AirTechTrade is established with the dream and hope of giving products that will give the people the higher standard of living."
                "Our team is dedicated to provide sustainable, high-quality, innovative with competitive prices to the customer."
                "Our team will continuously work with our customers feedback to develop our products and to achieve much more.",
                style: Theme.of(context).textTheme.bodyText1,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            
            const SizedBox(height: 36.0,),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Welcome to AirTechTrade",
                style: Theme.of(context).textTheme.headline6,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
