import 'dart:convert';
import 'package:test_task_github/data/users_response.dart';
import 'package:http/http.dart';

class UserRepository {
  String userUrl = 'https://api.github.com/users';

  Future<List<UserResponse>> getUsers() async {
    final response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<UserResponse> users = jsonData.map((json) => UserResponse.fromJson(json)).toList();
      return users;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
