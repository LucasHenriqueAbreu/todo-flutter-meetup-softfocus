import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/app/repositories/tarefas/tarefas_repository.dart';
import 'package:todo/app/repositories/tarefas/tarefas_repository_interface.dart';
import 'package:todo/app/services/tarefas/tarefa_service.dart';
import 'package:todo/app/services/tarefas/tarefa_service_interface.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(service: i.get())),
        Bind<ITarefaService>((i) => TarefaService(repository: i.get())),
        Bind<ITarefasRepository>((i) =>
            TarefaRepository(firebaseFirestore: FirebaseFirestore.instance)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
