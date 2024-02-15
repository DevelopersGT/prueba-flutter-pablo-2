import 'dart:convert';

import 'package:flutterpablo2/config/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var isLoading = true.obs;
  var users = List<User>.empty().obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('https://dummyapi.io/data/api/user'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        users.assignAll((jsonResponse['data'] as List).map((data) => User.fromJson(data)).toList());
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } finally {
      isLoading(false);
    }
  }
}
