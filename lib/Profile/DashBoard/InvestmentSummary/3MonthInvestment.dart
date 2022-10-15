import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Profile/DashBoard/InvestmentSummary/Examples/InvestmentSummaryData.dart';

class ThreeMonthInvestmentSummary extends StatelessWidget {
  const ThreeMonthInvestmentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    InvestmentData _investmentData = InvestmentData();

    List<Map<String, dynamic>> threeMonthlyInvestSummary =
        _investmentData.threeMonthInvestmentData;

    double currentInvestMoney = threeMonthlyInvestSummary.last["Money"];

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
                              threeMonthlyInvestSummary[barSpot.spotIndex]["Date"],
                              const TextStyle(),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                              children: [
                                TextSpan(
                                  text:
                                      "\n\$${threeMonthlyInvestSummary[barSpot.spotIndex]["Money"].toString()} \n",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                        text: _investmentData
                                                .differenceCalculator(
                                                    threeMonthlyInvestSummary[
                                                            barSpot.spotIndex]
                                                        ["Money"])["Text"] +
                                            "\n",
                                        style: TextStyle(
                                            color: _investmentData
                                                .differenceCalculator(
                                                    threeMonthlyInvestSummary[
                                                            barSpot.spotIndex]
                                                        ["Money"])["Color"])),
                                    TextSpan(
                                        text: _investmentData
                                                .differenceCalculatorPercentage(
                                                    threeMonthlyInvestSummary[
                                                            barSpot.spotIndex]
                                                        ["Money"])["Text"] +
                                            "\n",
                                        style: TextStyle(
                                            color: _investmentData
                                                .differenceCalculatorPercentage(
                                                    threeMonthlyInvestSummary[
                                                            barSpot.spotIndex]
                                                        ["Money"])["Color"])),
                                  ],
                                ),
                              ]);
                        }).toList();
                      })),
              minX: threeMonthlyInvestSummary[0]["Index"] - 0.25,
              maxX: threeMonthlyInvestSummary[threeMonthlyInvestSummary.length - 1]
                      ["Index"] +
                  0.50,
              minY: threeMonthlyInvestSummary[0]["Money"] - 100,
              maxY: threeMonthlyInvestSummary[threeMonthlyInvestSummary.length - 1]
                      ["Money"] +
                  100,
              lineBarsData: [
                LineChartBarData(
                  dotData: FlDotData(show: false),
                  color: Colors.green,
                  spots: threeMonthlyInvestSummary.map((mapData) {
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