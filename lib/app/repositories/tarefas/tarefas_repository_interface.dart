import 'package:todo/app/models/tarefa_model.dart';

abstract class ITarefasRepository {
  Stream<List<Tarefa>> listTarefaRealTime();
}
