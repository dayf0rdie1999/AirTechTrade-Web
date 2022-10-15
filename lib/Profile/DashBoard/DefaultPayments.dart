import 'package:flutter/material.dart';

class DefaultPaymentsWidgets extends StatelessWidget {
  final Function(int) paymentUpdateWidget;
  const DefaultPaymentsWidgets({super.key, required this.paymentUpdateWidget});

  @override
  Widget build(BuildContext context) {
    double cardHeight = 150.0;
    double cardRatio = 1.58;

    return InkWell(
      onTap: () {
        paymentUpdateWidget(4);
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
              height: cardHeight,
              width: cardHeight * cardRatio,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue[900],
              ),
              // ignore: sort_child_properties_last
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "VISA",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontStyle: FontStyle.italic),
                      ),
                      Container(
                        color: Colors.green,
                        child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Default",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "\u2022\u2022\u2022\u2022 ####",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        "Card's Holder Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      )
                    ],
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
