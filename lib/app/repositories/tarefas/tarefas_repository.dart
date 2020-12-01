import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/models/tarefa_model.dart';
import 'package:todo/app/repositories/tarefas/tarefas_repository_interface.dart';

class TarefaRepository implements ITarefasRepository {
  final FirebaseFirestore firebaseFirestore;

  TarefaRepository({@required this.firebaseFirestore});

  @override
  Stream<List<Tarefa>> listTarefaRealTime() {
    return firebaseFirestore.collection('tarefas').snapshots().map((query) =>
        query.docs.map((doc) => Tarefa.fromJson(doc.data())).toList());
  }
}
