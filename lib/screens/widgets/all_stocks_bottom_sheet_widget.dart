import 'package:deep_byte_assessment/screens/widgets/stocks_card.dart';
import 'package:flutter/material.dart';

class AllStocksBottomSheetWidget extends StatelessWidget {
  const AllStocksBottomSheetWidget({Key? key, required this.data})
      : super(key: key);
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "All Stocks",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              ...data.map((e) => StocksCard(stockCard: e)),
            ],
          ),
        ),
      ],
    );
  }
}