import 'dart:convert';

class TransactionModel {
  int userId;
  int roleId;
  String name;
  int weightTaken;

  TransactionModel({
    this.userId,
    this.roleId,
    this.name,
    this.weightTaken,
  });

  Map<String, dynamic> toMap() {
    if (userId == 0) {
      return {
        'user_id': userId,
        'role_id': roleId,
        'name': name,
        'taken_weight': weightTaken,
      };
    } else {
      return {
        'user_id': userId,
        'taken_weight': weightTaken,
      };
    }
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      userId: map['user_id']?.toInt() ?? 0,
      roleId: map['role_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      weightTaken: map['taken_weight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));
}
