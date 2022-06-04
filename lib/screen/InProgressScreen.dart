import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lykun_cashflow/widget/cardview_inprogress.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({Key key}) : super(key: key);

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, position) {
          return Column(
            children: [
              CardViewInProgress(
                roleType: "RESELLER",
                name: "Mama",
                takenDate: "04 Juni 2022",
                totalUnit: "1 kg 100 gram",
              ),
              SizedBox(height: 5),
            ],
          );
        },
      ),
    );
  }
}
