import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constants.dart';
import 'package:sample/core/data/api/constants.dart' as core;

class ApiController {
  Future<Map<String, dynamic>?> getUsers(String pageNo) async {
    final queryParameters = {'page': pageNo};
    Uri request =
        Uri.http(core.Constants.baseUrl, Constants.getPage, queryParameters);
    try {
      http.Response response = await http.get(request);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseList = jsonDecode(response.body);
        return responseList;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Map<String, dynamic>?> getUser(String userId) async {
    Uri request = Uri.http(core.Constants.baseUrl, Constants.getUsers + userId);
    try {
      http.Response response = await http.get(request);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseList = jsonDecode(response.body);
        return responseList;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
