part of 'post_bloc.dart';

class PostState extends Equatable {
  final Post post;
  final RequestState requestState;
  const PostState({required this.requestState, required this.post});

  @override
  List<Object> get props => [post, requestState];

  PostState copyWith({Post? post, RequestState? requestState}) {
    return PostState(
        requestState: requestState ?? this.requestState,
        post: post ?? this.post);
  }
}

class PostInitial extends PostState {
  const PostInitial(
      {super.post = const Post(), super.requestState = RequestState.empty});
}
