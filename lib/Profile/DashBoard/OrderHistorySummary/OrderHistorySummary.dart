import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Profile/DashBoard/OrderHistorySummary/OrderHistoryPopupMenu.dart';

class OrderHistorySummaryWidget extends StatefulWidget {
  final Function(int) orderHistoryUpdateWidget;
  const OrderHistorySummaryWidget(
      {super.key, required this.orderHistoryUpdateWidget});

  @override
  State<OrderHistorySummaryWidget> createState() =>
      _OrderHistorySummaryWidgetState();
}

class _OrderHistorySummaryWidgetState extends State<OrderHistorySummaryWidget> {
  static const int numItems = 2;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order History",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                child: DataTable(
                  showCheckboxColumn: false,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                          child: Text(
                        'Order #',
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Text(
                        'Order Date',
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Text(
                        'Product',
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Text(
                        'Cost',
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Text(
                        'Status',
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Text(
                        'Last Update',
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                    DataColumn(
                      label: Expanded(
                          child: Text(
                        '',
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    numItems,
                    (int index) => DataRow(
                      color: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        // All rows will have the same selected color.
                        if (states.contains(MaterialState.selected)) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.08);
                        }
                        // Even rows will have a grey color.
                        if (index.isEven) {
                          return Colors.grey.withOpacity(0.3);
                        }
                        return null; // Use default value for other states and odd rows.
                      }),
                      cells: const [
                        DataCell(Text(
                          '1',
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                          'Sep 6,2022',
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                          'EagleDel-1',
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                          '\$1132',
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                          'Delivered',
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(Text(
                          'Sep 7,2022',
                          overflow: TextOverflow.ellipsis,
                        )),
                        DataCell(OrderHistoryPopupMenu()),
                      ],
                      selected: selected[index],
                      onSelectChanged: (bool? value) {
                        setState(() {
                          selected[index] = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    child: const Text(
                      "To Order History Detail >",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      widget.orderHistoryUpdateWidget(2);
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
    ;
  }
}
