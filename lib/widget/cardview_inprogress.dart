import 'package:flutter/material.dart';
import 'package:lykun_cashflow/widget/custom_tag.dart';
import 'package:lykun_cashflow/widget/custom_unit.dart';

class CardViewInProgress extends StatefulWidget {
  final String roleType;
  final String takenDate;
  final String name;
  final String totalUnit;

  CardViewInProgress({
    Key key,
    this.roleType,
    this.takenDate,
    this.name,
    this.totalUnit,
  }) : super(key: key);

  @override
  State<CardViewInProgress> createState() => _CardViewInProgressState();
}

class _CardViewInProgressState extends State<CardViewInProgress> {
  TextEditingController kgcrt = new TextEditingController();
  TextEditingController grcrt = new TextEditingController();

  @override
  void initState() {
    super.initState();
    kgcrt.text = "0";
    grcrt.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Apakah ada sisa unit?"),
      content: Container(
        child: CustomUnit(
          kgctr: kgcrt,
          grctr: grcrt,
        ),
      ),
      actions: [
        TextButton(
          child: Text("Submit"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    return Container(
      child: Card(
        elevation: 1.5,
        child: Container(
          height: 150,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTag(tag: widget.roleType),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.takenDate),
                  Text("|"),
                  Text(widget.name),
                  Text("|"),
                  Text(widget.totalUnit),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                      fixedSize: Size(80, 20),
                    ),
                    onPressed: () {
                      print("sini");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Text(
                      "Selesai",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        color: Colors.yellow.shade200,
      ),
    );
  }
}
