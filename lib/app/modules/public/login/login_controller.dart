import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/core/auth/auth_controller.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController authController = Modular.get();

  @action
  login() async {
    await authController.loginComGoogle();
    if (authController.authStatus == AuthStatus.logado) {
      Modular.to.pushReplacementNamed('/private');
    } else {
      print('Não foi possível logar');
    }
  }
}
