import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:todo/app/services/auth_services_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthService service;

  @observable
  User user;

  @observable
  AuthStatus authStatus;

  _AuthControllerBase({@required this.service});

  @action
  Future loginComGoogle() async {
    authStatus = AuthStatus.carregando;
    setUser(await service.getGoogleLogin());
  }

  @action
  getUser() {
    setUser(service.getUser());
  }

  @action
  setUser(User user) {
    this.user = user;
    authStatus = this.user != null ? AuthStatus.logado : AuthStatus.deslogado;
  }

  @action
  logout() {
    service.logout();
    setUser(null);
  }
}

enum AuthStatus { carregando, logado, deslogado }
