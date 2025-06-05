import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService{
  final String baseUrl = "http://localhost:3000/api/v1";

  // Controller for getRequest
  Future<http.Response> getRequest(String endPoint) async {
    final uri = Uri.parse("$baseUrl/$endPoint");
    try {
      final response = await http.get(uri);
      return response;
    } catch (err) {
      return throw Exception("GET request error $err");
    }
  }


  // Controller for postRequest
  Future<http.Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return response;
    } catch (e) {
      throw Exception('POST request error: $e');
    }
  }

}