import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('pagina2'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  final newUser = Usuario(
                      nombre: 'Critóbal',
                      edad: 28,
                      profesiones: ['Full stack dev', 'Ingeniero videojuegos']);
                  userBloc.add(ActivateUser(newUser));
                },
                color: Colors.blue,
                child: const Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  userBloc.add(ChangeUserAge(35));
                },
                color: Colors.blue,
                child: const Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  userBloc.add(AddProfesion('nueva profesión'));
                },
                color: Colors.blue,
                child: const Text(
                  'Añadir Profesión',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
