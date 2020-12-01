import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/app/repositories/auth/auth_repository_interface.dart';
import 'package:todo/app/services/auth_services_interface.dart';

class AuthService implements IAuthService {
  final IAuthRepository repository;

  AuthService({@required this.repository});

  @override
  Future<User> getGoogleLogin() {
    return repository.getGoogleLogin();
  }

  @override
  User getUser() {
    return repository.getUser();
  }

  @override
  Future logout() {
    return repository.logout();
  }
}
