import 'dart:convert';
import 'dart:developer';
import '../../util/app_urls.dart';
import '../api/menu_response.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<MenuResponse> getStores() async {
    try {
      var response = await http.Client().post(Uri.parse(AppUrls.baseUrl),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          body: jsonEncode({}));

      log("API>>>URL>>${AppUrls.baseUrl}<<<RES>>>${response.body}<<<REQ>>>${jsonEncode({})}");

      if (response.statusCode == 200) {
        return MenuResponse.fromJson(json.decode(response.body));
      } else if (response.statusCode == 401) {
        return MenuResponse(code: 401);
      } else {
        return MenuResponse(code: 500);
      }
    } catch (e) {
      log("Error in API$e");

      if (e.toString().startsWith("SocketException")) {
        //no inter net case
        return MenuResponse(code: 200);
      } else {
        return MenuResponse(code: 500);
      }
    }
  }
}
