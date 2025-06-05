import 'package:http/http.dart' as http;

import 'package:calma/Controllers/api_services.dart';

class UserController {
  final ApiService _apiService;

  UserController(this._apiService);

  // register controller
  Future<http.Response> registerUser({
    required String name,
    required String age,
    required String email,
    required String gender,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await _apiService.postRequest("/user/register", {
      'name': name,
      'age': age,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Registration failed: ${response.body}");
    }
  }

  // login controller
  Future<http.Response> loginUser({
    required String phoneNumber,
    required String password,
  }) async {
    final response = await _apiService.postRequest("/user/login", {
      'phoneNumber': phoneNumber,
      'password': password,
    });
    if (response.statusCode == 200) {
      return response;
    } else {
      return throw Exception("Invalid phone number or password");
    }
  }

  // controller to change current user password
  Future<http.Response> changeCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    final response = await _apiService.postRequest('/user/change-password', {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'confirmNewPassword': confirmNewPassword,
    });

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          "Failed to update password. Please try again: ${response.body}");
    }
  }

  // Update user account detail like name & email
  Future<http.Response> updateAccountDetails({
    required String name,
    required String email,
}) async{
    final response = await _apiService.postRequest('/user/update-account-details', {
      'name': name,
      'email': email,
    });
    if(response.statusCode == 200){
      return response;
    }
    else{
      throw Exception("Failed to update account details. Please try again: ${response.body}");
    }
}
}
