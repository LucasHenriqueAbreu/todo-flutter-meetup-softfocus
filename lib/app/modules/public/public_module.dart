import 'package:todo/app/modules/public/login/login_module.dart';
import 'package:todo/app/modules/public/splash/splash_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class PublicModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter('/login', module: LoginModule()),
      ];

  static Inject get to => Inject<PublicModule>.of();
}
