import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:lykun_cashflow/model/role_model.dart';
import 'package:lykun_cashflow/model/transaction_model.dart';
import 'package:lykun_cashflow/model/user_model.dart';
import 'package:lykun_cashflow/service/service_manager.dart';
import 'package:lykun_cashflow/widget/custom_label.dart';
import 'package:lykun_cashflow/widget/custom_unit.dart';

class PengambilanScreen extends StatefulWidget {
  const PengambilanScreen({Key key}) : super(key: key);

  @override
  State<PengambilanScreen> createState() => _PengambilanScreenState();
}

class _PengambilanScreenState extends State<PengambilanScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<RoleModel> roleTypes = [];
  RoleModel _selectedRole;
  bool disableRoleDropdown = false;

  final TextEditingController _typeAheadController = TextEditingController();
  UserModel _pickedUserModel;
  bool flagUser = false;

  final TextEditingController _unitKgController = TextEditingController();
  final TextEditingController _unitGrController = TextEditingController();
  bool flagUnit = false;

  @override
  void initState() {
    super.initState();
    getRoles();
  }

  getRoles() async {
    roleTypes = await ServiceManager.sharedInstance.getRoles();
    _selectedRole = roleTypes[0];
    setState(() {});
  }

  String getAlertText() {
    String result = "";
    result =
        "[${_pickedUserModel.roleType.roleName}] ${_pickedUserModel.name}:";
    if (_unitKgController.text.isNotEmpty) {
      result = "$result ${_unitKgController.text} kg";
    }

    if (_unitGrController.text.isNotEmpty) {
      result = "$result ${_unitGrController.text} gr";
    }
    return result;
  }

  int totalWeightToGram() {
    int result = 0;
    if (_unitKgController.text.isNotEmpty) {
      result += int.parse(_unitKgController.text) * 1000;
    }
    if (_unitGrController.text.isNotEmpty) {
      result += int.parse(_unitGrController.text);
    }

    return result;
  }

  bool isUserModelValid() {
    bool result = false;
    if (_pickedUserModel == null &&
        ((_typeAheadController.text.trim() != "" &&
            _typeAheadController.text.trim() != null))) {
      this._pickedUserModel = UserModel(
        id: 0,
        name: _typeAheadController.text,
        roleType: _selectedRole,
      );
      result = false;
    } else if (_pickedUserModel != null) {
      this._pickedUserModel = UserModel(
        id: _pickedUserModel.id,
        name: _pickedUserModel.name,
        roleType: _selectedRole,
      );
      result = false;
    } else {
      result = true;
    }
    return result;
  }

  bool isUnitModelValid() {
    bool result = false;
    if ((_unitKgController.text.trim() != "" &&
            _unitKgController.text.trim() != null) ||
        (_unitGrController.text.trim() != "" &&
            _unitGrController.text.trim() != null)) {
      result = false;
    } else {
      result = true;
    }

    return result;
  }

  diplayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Apakah data sudah benar?"),
          content: Container(
            child: Text(getAlertText()),
          ),
          actions: [
            TextButton(
              child: Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Ya"),
              onPressed: () async {
                Navigator.of(context).pop();
                bool result = await ServiceManager.sharedInstance
                    .insertTransaction(TransactionModel(
                  roleId: _pickedUserModel.roleType.roleId,
                  userId: _pickedUserModel.id,
                  name: _pickedUserModel.name,
                  weightTaken: totalWeightToGram(),
                ).toJson());

                showDialog(
                  context: _formKey.currentContext,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(result ? "Berhasil" : "Gagal"),
                      content: Container(
                        child: Text(result
                            ? "Oke udah masuk. Lihat in progress."
                            : "Internet atau servernya lagi error. Coba lagi nanti."),
                      ),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  insertTransaction() {
    flagUser = isUserModelValid();
    flagUnit = isUnitModelValid();
    bool validate = this._formKey.currentState.validate();

    setState(() {});
    if (validate == true && flagUser == false && flagUnit == false) {
      this._formKey.currentState.save();
      print("aman");
      diplayDialog();
    } else {
      print(
          "ada yg kosong. flagUser: $flagUser. flagUnit: $flagUnit. validate: $validate");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          child: Form(
            key: this._formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //ROLE
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
                        child: DropdownButtonFormField<RoleModel>(
                          decoration: InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          value: _selectedRole,
                          elevation: 16,
                          onChanged: disableRoleDropdown
                              ? null
                              : (RoleModel newValue) {
                                  setState(() {
                                    _selectedRole = newValue;
                                  });
                                },
                          items: roleTypes.map<DropdownMenuItem<RoleModel>>(
                            (value) {
                              return DropdownMenuItem<RoleModel>(
                                value: value,
                                child: Text(value.roleName),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //NAMA
                CustomLabel(
                  title: "NAMA",
                  customSpaceSize: 10,
                  children: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                        autofocus: false,
                        controller: this._typeAheadController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            this._pickedUserModel = null;
                            this.disableRoleDropdown = false;
                          });
                        }),
                    onSuggestionSelected: (UserModel suggestion) {
                      print(
                          "suggestion ${suggestion.roleType.roleId} ${suggestion.roleType.roleName}");
                      this._pickedUserModel = suggestion;
                      this._selectedRole = roleTypes
                          .where((element) =>
                              element.roleId == suggestion.roleType.roleId)
                          .first;
                      this._typeAheadController.text = suggestion.name;
                      this.disableRoleDropdown = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                      setState(() {});
                    },
                    suggestionsCallback: (pattern) async {
                      print("pattern $pattern");
                      return await ServiceManager.sharedInstance
                          .getUserName(pattern);
                    },
                    itemBuilder: (context, UserModel suggestion) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(suggestion.name),
                            Text(
                              suggestion.roleType.roleName,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    validator: (value) {
                      if (value == null || value.trim() == "") {
                        return "Tulis nama sellernya";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                //UNIT TAKEN
                CustomLabel(
                  title: "TOTAL UNIT DIAMBIL",
                  children: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomUnit(
                        kgctr: _unitKgController,
                        grctr: _unitGrController,
                        isError: flagUnit,
                      ),
                      if (flagUnit) ...{
                        Container(
                          padding: EdgeInsets.only(top: 10, left: 13),
                          child: Text(
                            "Isi dulu unitnya, bebas boleh satu atau dua-duanya",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 13.5,
                            ),
                          ),
                        ),
                      }
                    ],
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
                    insertTransaction();
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
      ),
    );
  }
}
