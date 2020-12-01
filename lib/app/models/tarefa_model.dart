class Tarefa {
  String decricao;
  String pronta;

  Tarefa({this.decricao, this.pronta});

  Tarefa.fromJson(Map<String, dynamic> json) {
    decricao = json['decricao'];
    pronta = json['pronta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['decricao'] = this.decricao;
    data['pronta'] = this.pronta;
    return data;
  }
}
