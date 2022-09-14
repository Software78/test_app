import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_test/models/response_model.dart';
import 'package:mobile_test/models/todo_model.dart';
import 'package:mobile_test/services/api_service.dart';

part 'get_todos_event.dart';
part 'get_todos_state.dart';

class GetTodosBloc extends Bloc<GetTodosEvent, GetTodosState> {
  GetTodosBloc() : super(GetTodosLoading()) {
    on<GetTodos>((event, emit) => _getTodos(event, emit));
  }

  _getTodos(GetTodos event, emit) async {
    emit(GetTodosLoading());
    TodoResponseModel responseModel = await ApiService().getUserTodos(event.id);

    responseModel.status
        ? emit(GetTodosLoaded(todos: responseModel.todos!))
        : emit(GetTodosError(message: responseModel.message!));
  }
}
