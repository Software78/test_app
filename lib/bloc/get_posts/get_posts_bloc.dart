import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_test/models/response_model.dart';
import 'package:mobile_test/services/api_service.dart';

import '../../models/post_model.dart';

part 'get_posts_event.dart';
part 'get_posts_state.dart';

class GetPostsBloc extends Bloc<GetPostsEvent, GetPostsState> {
  GetPostsBloc() : super(GetPostsLoading()) {
    on<GetPosts>((event, emit) => _getPosts(event, emit));
  }

  _getPosts(GetPosts event, emit) async {
    emit(GetPostsLoading());
    PostResponseModel responseModel = await ApiService().getUserPosts(event.id);
    responseModel.status
        ? emit(GetPostsLoaded(posts: responseModel.posts!))
        : GetPostsError(message: responseModel.message!);
  }
}
