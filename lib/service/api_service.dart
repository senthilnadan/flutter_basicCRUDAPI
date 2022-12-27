import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:userapp/config/api_constants.dart';
import 'package:userapp/models/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserModel> createUser(UserModel user) async {
    Map data = user.toJson();

    final http.Response response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<UserModel> updateUsers(String id, UserModel user) async {
    Map data = user.toJson();
    final http.Response response = await http.put(
      Uri.parse("${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteUser(String id) async {
    http.Response res = await http.delete(
        Uri.parse("${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/$id"));

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}

void main() async {
  List<UserModel>? users = await ApiService().getUsers();
  users?.forEach((UserModel element) => print(element.name));
}
