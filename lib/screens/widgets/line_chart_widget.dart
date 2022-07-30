import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key, required this.points}) : super(key: key);
  final List<FlSpot> points;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            lineChartStepData: LineChartStepData(
                stepDirection: LineChartStepData.stepDirectionForward),
            dotData: FlDotData(show: false),
            isCurved: true,
            barWidth: 2,
            color: Colors.green,
            spots: points,
          ),
        ],
      ),
    );
  }
}