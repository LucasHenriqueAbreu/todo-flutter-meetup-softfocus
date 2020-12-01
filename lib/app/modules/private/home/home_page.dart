import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/core/auth/auth_controller.dart';
import 'package:todo/app/models/tarefa_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final AuthController authController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          CircleAvatar(
            child: Image.network(authController.user.photoURL),
            radius: 50,
          ),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                authController.logout();
                Modular.to.pushReplacementNamed('/login');
              })
        ],
      ),
      body: _criaConteudo(),
    );
  }

  Widget _criaConteudo() {
    return Observer(
      builder: (context) {
        if (controller.tarefas == null || controller.tarefas.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.tarefas.hasError) {
          return Center(
            child: Text('Não foi possível listar as tarefas'),
          );
        } else if (controller.tarefas.data.length <= 0) {
          return Center(
            child: Text('Não possui tarefas cadastradas'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.tarefas.data.length,
            itemBuilder: (context, index) {
              final Tarefa tarefa = controller.tarefas.data[index];
              return ListTile(
                title: Text(tarefa.decricao),
                subtitle: Text(tarefa.pronta),
              );
            },
          );
        }
      },
    );
  }
}
