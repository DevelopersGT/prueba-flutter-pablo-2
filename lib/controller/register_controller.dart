import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class RegisterController extends GetxController {
  late String firstName;
  late String lastName;
  late String email;

  String generateUniqueId() {
    var uuid = const Uuid();
    return uuid.v4(); 
  }

  Future<void> registerUser() async {
    // Validar si el correo electrónico contiene "@gmail.com"
    if (!email.contains("@gmail.com")) {
      // Mostrar un mensaje de error si el correo no contiene "@gmail.com"
      Get.snackbar(
        'Error',
        'El correo electrónico debe ser de tipo @gmail.com',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return; // Salir del método si el correo no es válido
    }

    String userId = generateUniqueId();

    Map<String, dynamic> newUser = {
      'id': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
    Get.back(result: newUser);
  }
}
