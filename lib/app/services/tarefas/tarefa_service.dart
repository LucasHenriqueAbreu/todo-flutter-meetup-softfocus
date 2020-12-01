import 'package:flutter/material.dart';
import 'package:todo/app/models/tarefa_model.dart';
import 'package:todo/app/repositories/tarefas/tarefas_repository_interface.dart';
import 'package:todo/app/services/tarefas/tarefa_service_interface.dart';

class TarefaService implements ITarefaService {
  final ITarefasRepository repository;

  TarefaService({@required this.repository});

  @override
  Stream<List<Tarefa>> listTarefaRealTime() {
    return repository.listTarefaRealTime();
  }
}
