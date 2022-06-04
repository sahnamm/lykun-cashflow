import 'package:flutter/material.dart';

class CustomUnit extends StatefulWidget {
  TextEditingController kgctr;
  TextEditingController grctr;

  CustomUnit({
    Key key,
    this.kgctr,
    this.grctr,
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
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
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
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
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
