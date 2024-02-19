
// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var users = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    var url = Uri.parse('https://dummyjson.com/users?_limit=30');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        users.assignAll(responseData['users']);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateUser(Map<String, dynamic> updatedUserData) async {
    var url = Uri.parse('https://dummyjson.com/users/${updatedUserData['id']}');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(updatedUserData);

    try {
      var response = await http.put(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Usuario actualizado con éxito:');
        print(updatedUserData);
        // Actualizar la lista de usuarios después de editar
        var index = users.indexWhere((user) => user['id'] == updatedUserData['id']);
        if (index != -1) {
          users[index] = updatedUserData;
        }
      } else {
        print('Error al actualizar usuario: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al actualizar usuario: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    var url = Uri.parse('https://dummyjson.com/users/$userId');
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        print('Usuario eliminado con éxito: $userId');
        // Actualizar la lista de usuarios después de eliminar
        users.removeWhere((user) => user['id'].toString() == userId);
      } else {
        print('Error al eliminar usuario: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al eliminar usuario: $e');
    }
  }
}
