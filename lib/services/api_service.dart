import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_test/models/post_model.dart';
import 'package:mobile_test/models/response_model.dart';
import 'package:mobile_test/models/todo_model.dart';
import 'package:mobile_test/models/user_model.dart';

class ApiService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<UserResponseModel> getUsers() async {
    try {
      Response response = await get(Uri.parse('$_baseUrl/users'));
      if (response.statusCode == 200) {
        List results = jsonDecode(response.body) as List;
        List<UserModel> users =
            results.map((e) => UserModel.fromJson(e)).toList();

        return UserResponseModel(status: true, users: users);
      } else {
        return UserResponseModel(status: false, message: 'An error occured');
      }
    } catch (e) {
      return UserResponseModel(status: false, message: e.toString());
    }
  }

  Future<TodoResponseModel> getUserTodos(int id) async {
    try {
      Response response = await get(Uri.parse('$_baseUrl/users/$id/todos'));
      if (response.statusCode == 200) {
        List results = jsonDecode(response.body) as List;
        List<TodoModel> todos =
            results.map((e) => TodoModel.fromJson(e)).toList();

        return TodoResponseModel(status: true, todos: todos);
      } else {
        return TodoResponseModel(status: false, message: 'An error occured');
      }
    } catch (e) {
      return TodoResponseModel(status: false, message: e.toString());
    }
  }

  Future<PostResponseModel> getUserPosts(int id) async {
    try {
      Response response = await get(Uri.parse('$_baseUrl/users/$id/posts'));
      if (response.statusCode == 200) {
        List results = jsonDecode(response.body) as List;
        List<PostModel> posts =
            results.map((e) => PostModel.fromJson(e)).toList();

        return PostResponseModel(status: true, posts: posts);
      } else {
        return PostResponseModel(status: false, message: 'An error occured');
      }
    } catch (e) {
      return PostResponseModel(status: false, message: e.toString());
    }
  }

  addNewPost() async {
    try {
      Response response = await post(
        Uri.parse('$_baseUrl/posts'),
        //  headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: {
          "title":"foo",
          "body": "bar",
          "userId": "1",
        },
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
