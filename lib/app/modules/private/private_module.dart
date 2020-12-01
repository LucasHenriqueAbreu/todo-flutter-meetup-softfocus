import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/private/home/home_module.dart';

class PrivateModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter(Modular.initialRoute, module: HomeModule())];

  static Inject get to => Inject<PrivateModule>.of();
}
