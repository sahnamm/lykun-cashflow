import 'package:flutter/material.dart';
import 'package:lykun_cashflow/widget/custom_tag.dart';

class HistoryItem extends StatefulWidget {
  int position;
  String name;
  String roleType;
  String dateTaken;
  String totalUnit;
  String totalPrice;

  HistoryItem({
    Key key,
    this.position,
    this.name,
    this.roleType,
    this.dateTaken,
    this.totalUnit,
    this.totalPrice,
  }) : super(key: key);

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.position % 2 == 0
              ? const Color(0xFFF7F7F9)
              : Colors.white),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: TextStyle(fontSize: 16.0)),
                      SizedBox(height: 5),
                      Text(
                        widget.dateTaken,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      )
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.totalUnit, style: TextStyle(fontSize: 16.0)),
                      SizedBox(height: 5),
                      Text("Unit Terjual",
                          style: TextStyle(color: Colors.grey, fontSize: 14.0))
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTag(tag: widget.roleType),
                  SizedBox(height: 10),
                  Text(
                    "Rp. ${widget.totalPrice},-",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green.shade900,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
