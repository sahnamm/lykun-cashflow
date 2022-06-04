import 'package:lykun_cashflow/common/constants.dart';
import 'package:lykun_cashflow/model/UserModel.dart';
import 'package:lykun_cashflow/utils/APIHelper.dart';

class ServiceManager {
  ServiceManager._internal();
  static final ServiceManager _apiHelper = ServiceManager._internal();
  static ServiceManager get sharedInstance => _apiHelper;

  Future<List<UserModel>> getUserName(String name) async {
    String url = "$HOST$SECTION/user";
    final response = await APIHelper.sharedInstance.doGet(url: url);
    return UserModel.convertToList(response.body);
  }
}
