import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:lykun_cashflow/model/UserModel.dart';
import 'package:lykun_cashflow/service/ServiceManager.dart';
import 'package:lykun_cashflow/widget/custom_label.dart';
import 'package:lykun_cashflow/widget/custom_unit.dart';

class PengambilanScreen extends StatefulWidget {
  const PengambilanScreen({Key key}) : super(key: key);

  @override
  State<PengambilanScreen> createState() => _PengambilanScreenState();
}

class _PengambilanScreenState extends State<PengambilanScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final TextEditingController _unitKgController = TextEditingController();
  final TextEditingController _unitGrController = TextEditingController();
  String _selectedRole;
  List<String> roleType = ["Admin", "Reseller"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedRole = roleType[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Apakah data sudah benar?"),
      content: Container(
        child: Text("[Admin] Mama: 1 kg 100gr"),
      ),
      actions: [
        TextButton(
          child: Text("Tidak"),
          onPressed: () {
            Navigator.of(context).pop();
            print("tidak");
          },
        ),
        TextButton(
          child: Text("Ya"),
          onPressed: () {
            Navigator.of(context).pop();
            print("iya");
          },
        ),
      ],
    );
    return Center(
      child: Container(
        child: Form(
          key: this._formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLabel(
                title: "ROLE",
                children: Container(
                  width: 150,
                  height: 60,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedRole,
                        elevation: 16,
                        onChanged: (String newValue) {
                          setState(() {
                            _selectedRole = newValue;
                          });
                        },
                        items: roleType.map<DropdownMenuItem<String>>(
                          (value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomLabel(
                title: "NAMA",
                customSpaceSize: 10,
                children: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: this._typeAheadController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  onSuggestionSelected: (suggestion) {
                    this._typeAheadController.text = suggestion;
                  },
                  suggestionsCallback: (pattern) {
                    print("pattern $pattern");
                    // return CitiesService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              CustomLabel(
                title: "TOTAL UNIT DIAMBIL",
                children: CustomUnit(
                  kgctr: _unitKgController,
                  grctr: _unitGrController,
                ),
              ),
              SizedBox(height: 50),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(double.maxFinite, 50),
                ),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  print("submit");
                  // if (this._formKey.currentState.validate()) {
                  //   this._formKey.currentState.save();
                  //   print("aman");
                  // } else {
                  //   print("ada yg kosong");
                  // }

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                  // List<UserModel> users =
                  //     await ServiceManager.sharedInstance.getUserName("Selly");
                  // print("total user selly: ${users.length}");
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
