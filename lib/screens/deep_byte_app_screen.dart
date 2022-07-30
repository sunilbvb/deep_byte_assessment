import 'dart:math';

import 'package:deep_byte_assessment/screens/widgets/all_stocks_bottom_sheet_widget.dart';
import 'package:deep_byte_assessment/screens/widgets/line_chart_widget.dart';
import 'package:deep_byte_assessment/screens/widgets/stocks_card.dart';
import 'package:deep_byte_assessment/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DeepByteAssessmentApp extends StatefulWidget {
  const DeepByteAssessmentApp({Key? key}) : super(key: key);

  @override
  State<DeepByteAssessmentApp> createState() => _DeepByteAssessmentAppState();
}

class _DeepByteAssessmentAppState extends State<DeepByteAssessmentApp>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  //static data
  final List<Map<String, dynamic>> data = [
    {
      "bank": "AXISBANK",
      "negativeValue": false,
      "value": "2126.20",
      "profit": "+30.10",
      "profitPercent": "+0.72%"
    },
    {
      "bank": "YESBANK",
      "negativeValue": true,
      "value": "245.20",
      "profit": "-15.10",
      "profitPercent": "-1.72%"
    },
    {
      "bank": "HDFCBANK",
      "negativeValue": false,
      "value": "1085",
      "profit": "+45.10",
      "profitPercent": "+0.01%"
    },
    {
      "bank": "PARLE",
      "negativeValue": false,
      "value": "245.20",
      "profit": "+15.10",
      "profitPercent": "+1.72%"
    },
    {
      "bank": "RELIANCE",
      "negativeValue": false,
      "value": "2510",
      "profit": "+15.10",
      "profitPercent": "+1.00%"
    },
    {
      "bank": "Sunpharma",
      "negativeValue": true,
      "value": "252.02",
      "profit": "-45.10",
      "profitPercent": "-2.48%"
    },
    {
      "bank": "HDFC BANK",
      "negativeValue": false,
      "value": "2510",
      "profit": "+15.65",
      "profitPercent": "+1.00%"
    },
    {
      "bank": "ICICI BANK",
      "negativeValue": false,
      "value": "451.20",
      "profit": "+59.20",
      "profitPercent": "+2.50%"
    },
  ];

  final RoundedRectangleBorder _roundedRectangleBorder =
      const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        color: lightGreyColor,
        child: TabBar(
          padding: const EdgeInsets.all(20),
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(icon: Icon(Icons.map)),
            Tab(icon: Icon(Icons.message)),
            Tab(icon: Icon(Icons.card_giftcard)),
            Tab(icon: Icon(Icons.account_balance_wallet_outlined)),
            Tab(icon: Icon(Icons.person_outline)),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 5,
        child: TabBarView(
          controller: tabController,
          children: [
            Scaffold(
              backgroundColor: greyColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: greyColor,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          const Center(
                            child: Text("NIFTY 50",
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w700)),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(greyColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  _roundedRectangleBorder.copyWith(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              onPressed: () => setState(() {}),
                              child: const Text(
                                "Click on the button to rebuild the chart",
                                style: TextStyle(color: Colors.black),
                              )),
                          const SizedBox(height: 10),
                          Expanded(
                            child: LineChartWidget(
                              points: [
                                ...List.generate(
                                  10,
                                  (index) => FlSpot(
                                    index.toDouble(),
                                    Random().nextInt(++index).toDouble(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      shape: _roundedRectangleBorder,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Stocks",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: _roundedRectangleBorder,
                                      builder: (_) =>
                                          AllStocksBottomSheetWidget(
                                              data: data),
                                    );
                                  },
                                  child: const Text(
                                    "See All",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                            ...data
                                .getRange(0, 4)
                                .map((e) => StocksCard(stockCard: e)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Center(child: Text("N/A")),
            const Center(child: Text("N/A")),
            const Center(child: Text("N/A")),
            const Center(child: Text("N/A")),
          ],
        ),
      ),
    );
  }
}