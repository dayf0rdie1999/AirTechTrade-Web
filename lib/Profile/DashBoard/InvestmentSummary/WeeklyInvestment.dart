import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Profile/DashBoard/InvestmentSummary/Examples/InvestmentSummaryData.dart';

class WeeklyInvestmentWidgets extends StatefulWidget {
  const WeeklyInvestmentWidgets({super.key});

  @override
  State<WeeklyInvestmentWidgets> createState() =>
      _WeeklyInvestmentWidgetsState();
}

class _WeeklyInvestmentWidgetsState extends State<WeeklyInvestmentWidgets> {
  @override
  Widget build(BuildContext context) {
    InvestmentData _investmentData = InvestmentData();

    List<Map<String, dynamic>> weeklyInvestSummary =
        _investmentData.weekInvestmentData;

    double currentInvestMoney = weeklyInvestSummary.last["Money"];

    return Padding(
      padding: EdgeInsets.zero,
      child: AspectRatio(
        aspectRatio: 4,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                      maxContentWidth: 200.0,
                      tooltipBgColor: Colors.transparent,
                      fitInsideHorizontally: false,
                      fitInsideVertically: false,
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                        return touchedBarSpots.map((barSpot) {
                          return LineTooltipItem(
                              weeklyInvestSummary[barSpot.spotIndex]["Date"],
                              const TextStyle(),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                              children: [
                                TextSpan(
                                  text:
                                      "\n\$${weeklyInvestSummary[barSpot.spotIndex]["Money"].toString()} \n",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: _investmentData
                                                .differenceCalculator(
                                                    weeklyInvestSummary[
                                                            barSpot.spotIndex]
                                                        ["Money"])["Text"] +
                                            "\n",
                                        style: TextStyle(
                                            color: _investmentData
                                                .differenceCalculator(
                                                    weeklyInvestSummary[
                                                            barSpot.spotIndex]
                                                        ["Money"])["Color"])),
                                    TextSpan(
                                        text: _investmentData
                                                .differenceCalculatorPercentage(
                                                    weeklyInvestSummary[
                                                            barSpot.spotIndex]
                                                        ["Money"])["Text"] +
                                            "\n",
                                        style: TextStyle(
                                            color: _investmentData
                                                .differenceCalculatorPercentage(
                                                    weeklyInvestSummary[
                                                            barSpot.spotIndex]
                                                        ["Money"])["Color"])),
                                  ],
                                ),
                              ]);
                        }).toList();
                      })),
              clipData: FlClipData.none(),
              minX: weeklyInvestSummary[0]["Index"] - 0.25,
              maxX: weeklyInvestSummary[weeklyInvestSummary.length - 1]
                      ["Index"] +
                  0.50,
              minY: weeklyInvestSummary[0]["Money"] - 100,
              maxY: weeklyInvestSummary[weeklyInvestSummary.length - 1]
                      ["Money"] +
                  100,
              lineBarsData: [
                LineChartBarData(
                  dotData: FlDotData(show: false),
                  color: Colors.green,
                  spots: weeklyInvestSummary.map((mapData) {
                    return FlSpot(mapData["Index"], mapData["Money"]);
                  }).toList(),
                ),
              ],
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(show: false),
              gridData: FlGridData(show: false),
            ),
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, //
          ),
        ),
      ),
    );
  }
}
