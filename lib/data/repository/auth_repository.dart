import 'package:firebase_auth/firebase_auth.dart';
import 'package:psc_app/data/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

 const AuthRepository({required AuthService authService}) : _authService = authService;

  


 
  Future<UserCredential> login(String email, String password) {
    return _authService.signIn(email, password);
  }

  Future<UserCredential> register(String email, String password) {
    return _authService.signUp(email, password);
  }

  Future<void> logout() {
    return _authService.signOut();
  }
}
