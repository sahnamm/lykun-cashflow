import 'package:flutter/material.dart';
import 'package:lykun_cashflow/common/style.dart';

class CustomLabel extends StatefulWidget {
  final String title;
  final double customSpaceSize;
  final Widget children;

  CustomLabel({
    Key key,
    this.title,
    this.customSpaceSize,
    this.children,
  }) : super(key: key);

  @override
  State<CustomLabel> createState() => _CustomLabelState();
}

class _CustomLabelState extends State<CustomLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: labelTextBold),
        SizedBox(height: widget.customSpaceSize ?? 10),
        widget.children,
      ],
    );
  }
}
