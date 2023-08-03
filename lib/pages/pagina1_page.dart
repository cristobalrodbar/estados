import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
        appBar: AppBar(title: const Text('pagina1')),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed('pagina2',
                arguments: {'nombre': 'Tomy', 'edad': 28}),
            child: const Icon(Icons.accessibility_new)),
        body: Obx(() => usuarioCtrl.existeUsuario.value
            ? InformacionUsuario(
                usuario: usuarioCtrl.usuario.value,
              )
            : NoInfo()));
  }
}

class NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('No hay usuario'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          /* const ListTile(title: Text('Profesión 1')),
          const ListTile(title: Text('Profesión 1')),
          const ListTile(title: Text('Profesión 1')), */
          ...usuario.profesiones.map((profesion) => ListTile(
                title: Text(profesion),
              ))
        ],
      ),
    );
  }
}
