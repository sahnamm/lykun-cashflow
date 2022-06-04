import 'dart:convert';
import 'dart:ffi';

class UserModel {
  int id;
  String name;
  String roleType;

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
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      roleType: map['roleType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  static List<UserModel> convertToList(jsonData) {
    List<UserModel> result = List<UserModel>();
    List<dynamic> jsonMap = json.decode(jsonData);
    for (dynamic data in jsonMap) {
      UserModel mod = UserModel.fromMap(data);
      result.add(mod);
    }
    return result;
  }
}
