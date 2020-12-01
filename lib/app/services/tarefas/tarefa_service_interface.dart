import 'package:todo/app/models/tarefa_model.dart';

abstract class ITarefaService {
  Stream<List<Tarefa>> listTarefaRealTime();
}
