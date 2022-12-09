import 'dart:convert';
import 'dart:developer';
import '../../util/app_urls.dart';
import '../api/menu_response.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<MenuResponse?> getMenu() async {
    try {
      var response = await http.Client().post(Uri.parse(AppUrls.baseUrl),
          headers: {},
          body: jsonEncode({}));

      log("API>>>URL>>${AppUrls.baseUrl}");

      if (response.statusCode == 200) {
        return MenuResponse.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {

      }
    } catch (e) {
      log("Error in API$e");

      if (e.toString().startsWith("SocketException")) {
        //no inter net case
      }
    }
    return null;
  }
}
