import 'package:flutter/material.dart';

class CustomUnit extends StatefulWidget {
  final TextEditingController kgctr;
  final TextEditingController grctr;
  final bool isError;

  CustomUnit({
    Key key,
    this.kgctr,
    this.grctr,
    this.isError = false,
  }) : super(key: key);

  @override
  State<CustomUnit> createState() => _CustomUnitState();
}

class _CustomUnitState extends State<CustomUnit> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: TextField(
            decoration: InputDecoration(
              hintText: "0",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.isError
                        ? Colors.red.shade700
                        : Colors.grey.shade500,
                    width: 1),
              ),
            ),
            controller: widget.kgctr,
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 10),
        Text("KG"),
        SizedBox(width: 20),
        Container(
          width: 100,
          child: TextField(
            decoration: InputDecoration(
              hintText: "0",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.isError
                        ? Colors.red.shade700
                        : Colors.grey.shade500,
                    width: 1),
              ),
            ),
            controller: widget.grctr,
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 10),
        Text("GR"),
      ],
    );
  }
}
