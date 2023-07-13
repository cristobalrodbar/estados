import 'package:estados/models/usuario.dart';
import 'package:estados/singleton/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: usuarioService.usuarioStream,
            builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
              return snapshot.hasData
                  ? Text('Nombre: ${snapshot.data!.nombre}')
                  : const Text('Pagina 2');
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  final nuevoUsuario =
                      Usuario(nombre: 'Cristóbal', edad: 27, profesiones: []);
                  usuarioService.cargarUsuario(nuevoUsuario);
                },
                color: Colors.blue,
                child: const Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  usuarioService.cambiarEdad(30);
                },
                color: Colors.blue,
                child: const Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {},
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
