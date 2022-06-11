import 'dart:convert';

class HistoryTransactionModel {
  int id;
  int userId;
  String name;
  int roleId;
  String roleName;
  int priceId;
  int productId;
  String productName;
  int price;
  int totalPrice;
  int takenWeight;
  int soldWeight;
  String status;
  String finishAt;
  String createdAt;
  String updatedAt;
  String totalPriceStr;
  String soldWeightKg;

  HistoryTransactionModel({
    this.id,
    this.userId,
    this.name,
    this.roleId,
    this.roleName,
    this.priceId,
    this.productId,
    this.productName,
    this.price,
    this.totalPrice,
    this.takenWeight,
    this.soldWeight,
    this.status,
    this.finishAt,
    this.createdAt,
    this.updatedAt,
    this.totalPriceStr,
    this.soldWeightKg,
  });

  HistoryTransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    roleId = json['role_id'];
    roleName = json['role_name'];
    priceId = json['price_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    price = json['price'];
    totalPrice = json['total_price'];
    takenWeight = json['taken_weight'];
    soldWeight = json['sold_weight'];
    status = json['status'];
    finishAt = json['finish_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalPriceStr = json['total_price_str'];
    soldWeightKg = json['sold_weight_kg'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'roleId': roleId,
      'roleName': roleName,
      'priceId': priceId,
      'productId': productId,
      'productName': productName,
      'price': price,
      'totalPrice': totalPrice,
      'takenWeight': takenWeight,
      'soldWeight': soldWeight,
      'status': status,
      'finishAt': finishAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'totalPriceStr': totalPriceStr,
      'soldWeightKg': soldWeightKg,
    };
  }

  factory HistoryTransactionModel.fromMap(Map<String, dynamic> map) {
    return HistoryTransactionModel(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      roleId: map['roleId']?.toInt() ?? 0,
      roleName: map['roleName'] ?? '',
      priceId: map['priceId']?.toInt() ?? 0,
      productId: map['productId']?.toInt() ?? 0,
      productName: map['productName'] ?? '',
      price: map['price']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toInt() ?? 0,
      takenWeight: map['takenWeight']?.toInt() ?? 0,
      soldWeight: map['soldWeight']?.toInt() ?? 0,
      status: map['status'] ?? '',
      finishAt: map['finishAt'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      totalPriceStr: map['totalPriceStr'] ?? '',
      soldWeightKg: map['soldWeightKg'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['role_id'] = this.roleId;
    data['role_name'] = this.roleName;
    data['price_id'] = this.priceId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    data['taken_weight'] = this.takenWeight;
    data['sold_weight'] = this.soldWeight;
    data['status'] = this.status;
    data['finish_at'] = this.finishAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_price_str'] = this.totalPriceStr;
    data['sold_weight_kg'] = this.soldWeightKg;
    return data;
  }

  static List<HistoryTransactionModel> convertToList(jsonData) {
    List<HistoryTransactionModel> result = [];
    List<dynamic> jsonMap = json.decode(jsonData);
    for (dynamic data in jsonMap) {
      HistoryTransactionModel mod = HistoryTransactionModel.fromMap(data);
      result.add(mod);
    }
    return result;
  }
}
