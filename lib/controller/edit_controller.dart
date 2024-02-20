// controllers/edit_controller.dart

// ignore_for_file: avoid_prints http;
import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class EditProfileController extends GetxController {
  final Map<String, dynamic> userData;

  EditProfileController({required this.userData});

  Future<void> updateUser({required String firstName, required String lastName, required String email}) async {
    var url = Uri.parse('https://dummyjson.com/users/${userData['id']}');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    });

    try {
      var response = await http.put(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        var updatedUser = jsonDecode(response.body);
        print('Usuario actualizado con éxito:');
        print(updatedUser);
        // Devolver el usuario actualizado a la pantalla anterior
        Get.back(result: updatedUser);
      } else {
        print('Error al actualizar usuario: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al actualizar usuario: $e');
    }
  }
}
