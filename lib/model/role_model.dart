import 'dart:convert';

class RoleModel {
  int roleId;
  String roleName;

  RoleModel({
    this.roleId,
    this.roleName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': roleId,
      'name': roleName,
    };
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      roleId: int.parse(map['id'] ?? 0),
      roleName: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) =>
      RoleModel.fromMap(json.decode(source));

  static List<RoleModel> convertToList(jsonData) {
    List<RoleModel> result = [];
    List<dynamic> jsonMap = json.decode(jsonData);
    for (dynamic data in jsonMap) {
      RoleModel mod = RoleModel.fromMap(data);
      result.add(mod);
    }
    return result;
  }
}
