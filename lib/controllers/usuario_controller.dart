import 'package:estados/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  get profesionesCount {
    return usuario.value.profesiones.length;
  }

  void cargarUsuario(Usuario user) {
    existeUsuario.value = true;
    usuario.value = user;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}