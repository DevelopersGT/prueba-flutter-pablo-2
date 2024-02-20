// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterpablo2/controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              onChanged: (value) {
                _registerController.firstName = value;
              },
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(labelText: 'Apellido'),
              onChanged: (value) {
                _registerController.lastName = value;
              },
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(labelText: 'Correo Electrónico'),
              onChanged: (value) {
                _registerController.email = value;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Llamar a la función para registrar usuario
                _registerController.registerUser();
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
