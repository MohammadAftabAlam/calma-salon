import 'package:http/http.dart' as http;

const String baseUrl = "https://calmarepo-production.up.railway.app/api/";
var client = http.Client();

class BaseClient {
  Future<dynamic>? get(String endPoint) async {
    http.Response response = await client.get(Uri.parse(baseUrl+endPoint));
    if (response.statusCode == 200) {
    } else {
      throw Exception();
    }
    // return "";
  }
}
