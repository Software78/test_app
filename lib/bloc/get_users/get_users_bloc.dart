import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_test/models/response_model.dart';
import 'package:mobile_test/models/user_model.dart';
import 'package:mobile_test/services/api_service.dart';

part 'get_users_event.dart';
part 'get_users_state.dart';

class GetUsersBloc extends Bloc<GetUsersEvent, GetUsersState> {
  GetUsersBloc() : super(GetUsersLoading()) {
    on<GetUsers>((event, emit) => _getUsers(event, emit));
  }

  _getUsers(GetUsers event, emit) async {
    UserResponseModel model = await ApiService().getUsers();
    model.status
        ? emit(GetUsersLoaded(users: model.users!))
        : emit(GetUsersError(message: model.message!));
  }
}
