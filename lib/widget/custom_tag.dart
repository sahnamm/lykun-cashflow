import 'package:flutter/material.dart';

class CustomTag extends StatefulWidget {
  final String tag;
  CustomTag({
    Key key,
    this.tag,
  }) : super(key: key);

  @override
  State<CustomTag> createState() => _CustomTagState();
}

class _CustomTagState extends State<CustomTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        widget.tag,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
