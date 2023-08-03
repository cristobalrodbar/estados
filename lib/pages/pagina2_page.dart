import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments); //TODO borrar
    print(Get.arguments['nombre']); //TODO borrar

    final usuarioCtrl = Get.find<UsuarioController>();

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
                  usuarioCtrl.cargarUsuario(Usuario(edad: 28, nombre: 'Toms'));
                  Get.snackbar('Usuario establecido', '¡Bienvenido!',
                      backgroundColor: Colors.white,
                      boxShadows: [
                        const BoxShadow(color: Colors.black38, blurRadius: 10)
                      ]);
                },
                color: Colors.blue,
                child: const Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  usuarioCtrl.cambiarEdad(69);
                },
                color: Colors.blue,
                child: const Text(
                  'Cambiar Edad',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  usuarioCtrl.agregarProfesion(
                      'Profesión #${usuarioCtrl.profesionesCount + 1}');
                },
                color: Colors.blue,
                child: const Text(
                  'Añadir Profesión',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  //TODO fix
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                color: Colors.blue,
                child: const Text(
                  'Cambiar tema',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
