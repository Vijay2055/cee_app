import 'package:firebase_auth/firebase_auth.dart';
import 'package:psc_app/app/core/services/firebase/user_services/firebase_auth_service.dart';
import 'package:psc_app/app/core/services/results/result.dart';

class FirebaseAuthRepository {
  final FirebaseAuthService _service;

  FirebaseAuthRepository(this._service);

  Future<Result<UserCredential>> register({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _service.registerUser(email: email, password: password);
      return Result.success(res);
    } on FirebaseAuthException catch (e) {
      return Result.error(e.message ?? "Registration failed");
    } catch (e) {
      return Result.error("Some thing went wrong");
    }
  }

  Future<Result<UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _service.loginUser(email: email, password: password);
      return Result.success(res);
    } on FirebaseAuthException catch (e) {
      return Result.error(e.message ?? "Login failed");
    } catch (e) {
      return Result.error("Some thing went wrong");
    }
  }

  Future<Result<void>> logout() async {
    try {
      await _service.logOut();
      return Result.success(null);
    } catch (e) {
      return Result.error("Logout failed");
    }
  }
}
