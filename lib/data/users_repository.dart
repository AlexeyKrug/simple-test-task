import 'package:dio/dio.dart';
import 'package:test_task_github/data/users_response.dart';

class UserRepository {
  final String _userUrl = 'https://api.github.com/users';
  final _dio = Dio();

  Future<List<UserResponse>> getUsers() async {
    final response = await _dio.get(_userUrl);
    if (response.statusCode == 200) {
      List<UserResponse> users = (response.data as List)
          .map((json) => UserResponse.fromJson(json))
          .toList();
      return users;
    } else {
      throw Exception(response.statusCode);
    }
  }
}