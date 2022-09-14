part of 'get_todos_bloc.dart';

abstract class GetTodosEvent extends Equatable {
  const GetTodosEvent();

  @override
  List<Object> get props => [];
}

class GetTodos extends GetTodosEvent {
  final int id;

  const GetTodos({required this.id});
}
