import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SubmitNewEntryScreen extends StatefulWidget {
  const SubmitNewEntryScreen({Key key}) : super(key: key);

  @override
  State<SubmitNewEntryScreen> createState() => _SubmitNewEntryScreenState();
}

class _SubmitNewEntryScreenState extends State<SubmitNewEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("SubmitNewEntryScreen"),
    );
  }
}
