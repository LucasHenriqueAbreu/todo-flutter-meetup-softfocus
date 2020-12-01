import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  User getUser();
  Future<User> getGoogleLogin();
  Future logout();
}
