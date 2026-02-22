import 'package:psc_app/data/services/user_services.dart';
import 'package:psc_app/model/user_model.dart';

class UserRepository {
  final UserServices _userServices = UserServices();

  Future<void> storeUser(UserModel user) {
    return _userServices.storeUser(user);
  }

  Future<void> updateArea(String uuid, String area) {
    return _userServices.updateArea(uuid, area);
  }

  Future<String?> getUserName() {
    return _userServices.getUserName();
  }

  Future<String?> getUserRole() {
    return _userServices.getUserRole();
  }
}
