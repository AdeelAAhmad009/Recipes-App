import 'package:api_project/const/const.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<String?> login(String userName, String password) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/login'));
    request.fields.addAll({'username': userName, 'password': password});
    http.StreamedResponse response = await request.send();
    String? data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return data;
    } else {
      if (kDebugMode) {
        print("LOGIN RESPONSE............$data");
      }
      return null;
    }
  }

  Future<String?> recipesResponse() async {
    var request = http.Request('GET', Uri.parse('https://dummyjson.com/recipes'));

    http.StreamedResponse response = await request.send();
    String? res = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return res;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String?> searchApi({String? search}) async {
    var request = http.MultipartRequest('GET', Uri.parse('https://dummyjson.com/recipes/search?q=$search'));

    http.StreamedResponse response = await request.send();
    String? res = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return res;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
