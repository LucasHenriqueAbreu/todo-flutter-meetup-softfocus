import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/models/tarefa_model.dart';
import 'package:todo/app/services/tarefas/tarefa_service_interface.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITarefaService service;

  @observable
  ObservableStream<List<Tarefa>> tarefas;

  _HomeControllerBase({@required this.service}) {
    getTarefasRealTime();
  }

  @action
  getTarefasRealTime() {
    tarefas = service.listTarefaRealTime().asObservable();
  }
}
