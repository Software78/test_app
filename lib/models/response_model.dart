import 'package:mobile_test/models/post_model.dart';
import 'package:mobile_test/models/todo_model.dart';
import 'package:mobile_test/models/user_model.dart';

class UserResponseModel {
  final bool status;
  List<UserModel>? users;
  String? message;

  UserResponseModel({
    required this.status,
    this.message,
    this.users,
  });
}

class TodoResponseModel {
  final bool status;
  List<TodoModel>? todos;
  String? message;

  TodoResponseModel({
    required this.status,
    this.message,
    this.todos,
  });
}

class PostResponseModel {
  final bool status;
  List<PostModel>? posts;
  String? message;

  PostResponseModel({
    required this.status,
    this.message,
    this.posts,
  });
}

