import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box;
  StorageService(this._box);
  static const String _tokenKey = 'token';
  static const String _userName = 'name';
  static const String _uuid = "uuid";

  void saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }

  Future<void> saveUserName(String name) async {
    await _box.write(_userName, name);
  }

  Future<void> storeUuid(String uuid) async {
    await _box.write(_uuid, uuid);
  }

  String? get token => _box.read(_tokenKey);

  String? get name => _box.read(_userName);

  String? get uuid => _box.read(_uuid);

  bool isLoggedIn() => token != null;
  void clear() async {
    await _box.erase();
  }
}
