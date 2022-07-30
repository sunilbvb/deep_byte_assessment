import 'dart:math';

import 'package:deep_byte_assessment/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StocksCard extends StatelessWidget {
  const StocksCard({Key? key, required this.stockCard}) : super(key: key);
  final Map<String, dynamic> stockCard;

  List<FlSpot> returnPoints() {
    return List.generate(
        10,
        (index) =>
            FlSpot(index.toDouble(), Random().nextInt(++index).toDouble()));
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors =
        stockCard["negativeValue"] ? redGradientColors : gradientColors;
    return Card(
      color: const Color(0xffF5F5F5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            stockCard["negativeValue"]
                ? const Icon(Icons.arrow_circle_down_rounded, color: Colors.red)
                : const Icon(
                    Icons.arrow_circle_down_rounded,
                    color: Colors.green,
                  ),
            const SizedBox(width: 5),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  stockCard["bank"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: const Text("NSE"),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 5, bottom: 5, top: 5),
              width: 70,
              height: 70,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      lineChartStepData: LineChartStepData(
                          stepDirection:
                              LineChartStepData.stepDirectionForward),
                      dotData: FlDotData(show: false),
                      isCurved: true,
                      barWidth: 2,
                      color: stockCard["negativeValue"]
                          ? redGradientColors[1]
                          : null,
                      belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                              colors: colors
                                  .map((e) => e.withOpacity(0.5))
                                  .toList())),
                      spots: returnPoints(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    stockCard["value"],
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: stockCard["negativeValue"]
                            ? Colors.red
                            : Colors.green),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        stockCard["profit"],
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "(${stockCard["profitPercent"]})",
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: stockCard["negativeValue"]
                                ? Colors.red
                                : Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}