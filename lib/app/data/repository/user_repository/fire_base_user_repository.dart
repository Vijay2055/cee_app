import 'package:firebase_auth/firebase_auth.dart';
import 'package:psc_app/app/core/services/firebase/user_services/firebase_service.dart';
import 'package:psc_app/app/core/services/results/result.dart';
import 'package:psc_app/app/data/models/user.dart';

class FireBaseUserRepository {
  final FirebaseService _service;
  FireBaseUserRepository(this._service);

  Future<Result<void>> storeUser({
    required String uid,
    required String name,
    required String mobile,
    required String email,
  }) async {
    try {
      await _service.createUser(
        uid: uid,
        name: name,
        mobile: mobile,
        email: email,
      );

      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.error(e.message ?? "Can't Store data");
    } catch (e) {
      return Result.error("Something went wrong while storing user data: $e");
    }
  }

  Future<Result<UserModel>> getUserData(String uuid) async {
    try {
      final result = await _service.getUser(uuid);
      if (result != null) {
        return Result.success(UserModel.fromMap(result));
      } else {
        return Result.error("User not found");
      }
    } on FirebaseException catch (e) {
      return Result.error(e.message ?? "Unknown error");
    } catch (e) {
      return Result.error("GEtUserData::Error is due to $e");
    }
  }
}
