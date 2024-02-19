// ignore_for_file: use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutterpablo2/controller/edit_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileController _editProfileController;

  EditProfileScreen({required Map<String, dynamic> userData})
      : _editProfileController = EditProfileController(userData: userData);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstNameController =
        TextEditingController(text: _editProfileController.userData['firstName']);
    final TextEditingController _lastNameController =
        TextEditingController(text: _editProfileController.userData['lastName']);
    final TextEditingController _emailController =
        TextEditingController(text: _editProfileController.userData['email']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 1,
              child: TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
            ),
            const SizedBox(height: 10.0),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 1,
              child: TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Apellido'),
              ),
            ),
            const SizedBox(height: 10.0),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 1,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Correo Electrónico'),
              ),
            ),
            // Agregar más campos para otros datos del usuario si es necesario
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Llamar a la función para actualizar usuario
                _editProfileController.updateUser(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  email: _emailController.text,
                );
              },
              child: const Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
