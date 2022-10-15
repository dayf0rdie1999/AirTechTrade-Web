import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Profile/DashBoard/InvestmentSummary/3MonthInvestment.dart';
import 'package:my_app/Profile/DashBoard/InvestmentSummary/Examples/InvestmentSummaryData.dart';
import 'package:my_app/Profile/DashBoard/InvestmentSummary/MonthlyInvestment.dart';
import 'package:my_app/Profile/DashBoard/InvestmentSummary/YearInvestment.dart';

import 'WeeklyInvestment.dart';

class InvestmentSummaryWidget extends StatelessWidget {
  final Function(int) investmentUpdateWidget;
  const InvestmentSummaryWidget(
      {super.key, required this.investmentUpdateWidget});

  @override
  Widget build(BuildContext context) {
    // InvestData
    InvestmentData _investmentData = InvestmentData();

    // Investment Return data list
    List<Tab> tabs = const [
      Tab(text: "1W"),
      Tab(text: "1M"),
      Tab(text: "3M"),
      Tab(text: "1Y"),
    ];

    return Row(children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text Title

              Text("Investment", style: Theme.of(context).textTheme.headline6),

              const SizedBox(
                height: 16.0,
              ),

              Expanded(
                flex: 0,
                child: RichText(
                    text: TextSpan(
                  text:
                      "Invest: \$${_investmentData.initialInvestMoney.toStringAsFixed(2)} \n",
                  style: const TextStyle(fontSize: 16.0, color: Colors.blue),
                  children: [
                    TextSpan(
                      text:
                          "Value: \$${_investmentData.currentInvestMoney.toStringAsFixed(2)} \n",
                    ),
                    TextSpan(
                        text:
                            "Return: ${_investmentData.differenceCalculator(_investmentData.currentInvestMoney)["Text"]} ${_investmentData.differenceCalculatorPercentage(_investmentData.currentInvestMoney)["Text"]}",
                        style: TextStyle(
                            color: _investmentData.differenceCalculator(
                                _investmentData.currentInvestMoney)["Color"])),
                  ],
                )),
              ),

              DefaultTabController(
                  length: tabs.length,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300.0,
                        child: const TabBarView(children: [
                          WeeklyInvestmentWidgets(),
                          MonthlyInvestmentWidget(),
                          ThreeMonthInvestmentSummary(),
                          YearInvestmentSummaryWidget(),
                        ]),
                      ),
                      Container(
                        height: 25.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 250.0,
                                child: TabBar(
                                  labelColor: Colors.black,
                                  tabs: tabs,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    investmentUpdateWidget(3);
                                  },
                                  child: const Text(
                                    "To Investment Details >",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        height: 2.0,
                                        color: Colors.blue),
                                  )),
                            ]),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      Expanded(flex: 0, child: Container()),
    ]);
  }
}
