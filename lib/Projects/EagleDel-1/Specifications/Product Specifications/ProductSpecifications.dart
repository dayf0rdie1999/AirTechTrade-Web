import 'package:flutter/material.dart';
import 'package:my_app/Projects/EagleDel-1/Specifications/Product%20Specifications/ProductLists.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class EagleDelProductSpecifications extends StatelessWidget {
  const EagleDelProductSpecifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProductLists myProducts = ProductLists();

    return Container(
      color: Colors.black45,
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FixedColumnWidth(100),
          2: FixedColumnWidth(80),
          3: FlexColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
              TableRow(
                children: <Widget>[
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      "Product Name",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      "Quantity",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      "Cost",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      "Progress",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ] +
            myProducts.myProductList.map((product) {
              return TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: TextButton(
                      child: Text(
                        product.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onPressed: () async {
                        _launchUrl(product.linkName);
                      },
                    )),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      product.quantity.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      "\$${product.getPrice().toString()}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LinearPercentIndicator(
                            alignment: MainAxisAlignment.center,
                            width: 140.0,
                            lineHeight: 24.0,
                            percent: product.updateProgress(),
                            center: Text(
                              product.updateTextProgress(),
                              style: new TextStyle(fontSize: 12.0),
                            ),
                            leading: product.updateIconProgress(),
                            barRadius: Radius.circular(16.0),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.blue,
                          ),
                        ],
                      )),
                      ]
                    );
            }).toList(),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (url == "None") {
    } else {
      Uri _url = Uri.parse(url);

      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }
    
  }
}




          