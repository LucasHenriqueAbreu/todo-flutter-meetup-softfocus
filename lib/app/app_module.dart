import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/app_widget.dart';
import 'package:todo/app/core/auth/auth_controller.dart';
import 'package:todo/app/modules/private/private_module.dart';
import 'package:todo/app/modules/public/public_module.dart';
import 'package:todo/app/repositories/auth/auth_repository_interface.dart';
import 'package:todo/app/services/auth_service.dart';
import 'package:todo/app/services/auth_services_interface.dart';

import 'repositories/auth/auth_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController(service: i.get())),
        Bind<IAuthService>((i) => AuthService(repository: i.get())),
        Bind<IAuthRepository>(
            (i) => AuthRepository(firebaseAuth: FirebaseAuth.instance)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: PublicModule()),
        ModularRouter('/private', module: PrivateModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
