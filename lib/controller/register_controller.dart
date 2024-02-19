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
