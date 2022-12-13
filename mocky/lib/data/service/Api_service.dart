import 'dart:convert';
import 'dart:developer';
import '../../util/app_urls.dart';
import 'package:http/http.dart' as http;

import '../model/menu_item.dart';

class APIService {
  Future<MenuResponse> getMenu() async {
    var response = await http.Client()
        .post(Uri.parse(AppUrls.baseUrl), body: jsonEncode({}));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return MenuResponse.fromJson(jsonResponse[0]);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
