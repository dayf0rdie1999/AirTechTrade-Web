import 'package:flutter/material.dart';
import 'package:my_app/Profile/DashBoard/DefaultPayments.dart';
import 'package:my_app/Profile/DashBoard/InvestmentSummary/InvestmentSummary.dart';
import 'package:my_app/Profile/DashBoard/OrderHistorySummary/OrderHistorySummary.dart';
import 'package:my_app/Profile/DashBoard/PersonalInfoSummary.dart';
import 'package:my_app/Profile/DashBoard/SavedJobsSummary.dart';

class DashBoardWidget extends StatelessWidget {
  final Function(int) updateWidget;
  const DashBoardWidget({super.key, required this.updateWidget});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        Row(
          children: [
            // Personal Info Widget
            Expanded(
              child: Container(
                height: 200.0,
                child: InkWell(
                  onTap: () {
                    updateWidget(1);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Personal Info",
                                style: Theme.of(context).textTheme.headline6,
                              )),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const PersonalInfoSummaryWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Payment Card Widget
            Container(
              width: 300.0,
              height: 200.0,
              child: Card(
                child: DefaultPaymentsWidgets(
                  paymentUpdateWidget: updateWidget,
                ),
              )
            ),
          ],
        ),
        
        // Order History Summary Widget
        Card(child: OrderHistorySummaryWidget(orderHistoryUpdateWidget: updateWidget),),
        // Investment Summary Widget
        Card(child: InvestmentSummaryWidget(investmentUpdateWidget: updateWidget,),),

        const Divider(
          thickness: 0.5,
          color: Colors.black,
          endIndent: 5.0,
          indent: 5.0,
        ),

        // Saved Jobs Summary Widget
        SavedJobsSummaryWidgets(savedJobsUpdateWidget: updateWidget,),

      ],
    );
  }
}
