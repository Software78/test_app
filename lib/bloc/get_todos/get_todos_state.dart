part of 'get_todos_bloc.dart';

abstract class GetTodosState extends Equatable {
  const GetTodosState();

  @override
  List<Object> get props => [];
}

class GetTodosLoading extends GetTodosState {}

class GetTodosLoaded extends GetTodosState {
  final List<TodoModel> todos;

  const GetTodosLoaded({required this.todos});

  @override
  List<Object> get props => [todos];
}

class GetTodosError extends GetTodosState {
  final String message;

  const GetTodosError({required this.message});

  @override
  List<Object> get props => [message];
}
