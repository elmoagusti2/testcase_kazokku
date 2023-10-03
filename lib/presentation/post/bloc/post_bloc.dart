import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kazokku/commmon/enum.dart';
import 'package:kazokku/models/post/data_post.dart';
import 'package:kazokku/models/post/post.dart';
import 'package:kazokku/repositories/dummy_api.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  DummyApi dummyApi = DummyApi();
  PostBloc() : super(const PostInitial()) {
    on(_getPost);
  }
  _getPost(GetPosts event, emit) async {
    try {
      Post post = await dummyApi.getPost(event.limit);
      if (event.limit == 10) {
        emit(PostState(requestState: RequestState.success, post: post));
        emit(PostState(requestState: RequestState.success, post: post));
      }
      if (event.limit <= 50 && event.limit > 10) {
        List<DataPost> data = state.post.data!;
        data.addAll(post.data!);
        emit(state.copyWith(
            requestState: RequestState.success,
            post: post.copyWith(data: data)));
      }
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }
}
