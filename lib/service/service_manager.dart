import 'package:lykun_cashflow/common/constants.dart';
import 'package:lykun_cashflow/model/role_model.dart';
import 'package:lykun_cashflow/model/user_model.dart';
import 'package:lykun_cashflow/utils/api_helper.dart';

class ServiceManager {
  ServiceManager._internal();
  static final ServiceManager _apiHelper = ServiceManager._internal();
  static ServiceManager get sharedInstance => _apiHelper;

  Future<List<RoleModel>> getRoles() async {
    String url = "$HOST$SECTION/role";
    final response = await APIHelper.sharedInstance.doGet(url: url);
    return RoleModel.convertToList(response.body);
  }

  Future<List<UserModel>> getUserName(String name) async {
    String url = "$HOST$SECTION/user";
    final response = await APIHelper.sharedInstance.doGet(url: url);
    return UserModel.convertToList(response.body);
  }

  Future<bool> insertTransaction(String body) async {
    String url = "$HOST$SECTION/transaction";
    final response = await APIHelper.sharedInstance.doPost(
      url: url,
      body: body,
    );
    return response.statusCode == 200;
  }
}
