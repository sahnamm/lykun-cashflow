import 'package:flutter/material.dart';
import 'package:lykun_cashflow/widget/history_item.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, position) {
          return HistoryItem(
            position: position,
            name: "Mama",
            roleType: "Admin",
            dateTaken: "04 Juni 2022",
            totalUnit: "1,1 kg",
            totalPrice: position == 4 ? "1.000.000" : "111.000",
          );
        },
      ),
    );
  }
}
