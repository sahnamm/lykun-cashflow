import 'dart:convert';
import 'package:lykun_cashflow/model/role_model.dart';

class UserModel {
  int id;
  String name;
  RoleModel roleType;

  UserModel({
    this.id,
    this.name,
    this.roleType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'roleType': roleType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    int roleId = map['role_id'] ?? 0;
    String roleName = map['role_name'] ?? '';

    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      roleType: RoleModel(
        roleId: roleId,
        roleName: roleName,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  static List<UserModel> convertToList(jsonData) {
    List<UserModel> result = [];
    List<dynamic> jsonMap = json.decode(jsonData);
    for (dynamic data in jsonMap) {
      UserModel mod = UserModel.fromMap(data);
      result.add(mod);
    }
    return result;
  }
}
