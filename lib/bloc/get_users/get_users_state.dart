part of 'get_users_bloc.dart';

abstract class GetUsersState extends Equatable {
  const GetUsersState();

  @override
  List<Object> get props => [];
}

class GetUsersLoading extends GetUsersState {}

class GetUsersLoaded extends GetUsersState {
  final List<UserModel> users;

  const GetUsersLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class GetUsersError extends GetUsersState {
  final String message;

   const GetUsersError({required this.message});

  @override
  List<Object> get props => [message]; 
}
