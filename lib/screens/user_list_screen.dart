// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterpablo2/controller/user_controll.dart';
import 'package:flutterpablo2/screens/edit_profile_screen.dart';
import 'package:flutterpablo2/screens/register_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class UserListScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          var user = userController.users[index];
          return ListTile(
            title: Text('${user['firstName']} ${user['lastName']}'),
            subtitle: Text(user['email']),
            onTap: () async {
              var updatedUserData = await Get.to(() => EditProfileScreen(userData: user));
              if (updatedUserData != null) {
                userController.updateUser(updatedUserData);
              }
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Get.defaultDialog(
                  title: 'Confirmar eliminación',
                  middleText: '¿Estás seguro de que quieres eliminar este usuario?',
                  textConfirm: 'Eliminar',
                  textCancel: 'Cancelar',
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    userController.deleteUser(user['id'].toString());
                    Get.back();
                  },
                  onCancel: () {},
                );
              },
            ),
          );
        },
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150),
        child: FloatingActionButton(
          onPressed: () async {
            final newUser = await Get.to(() => RegisterScreen());
            if (newUser != null) {
              userController.users.add(newUser);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

