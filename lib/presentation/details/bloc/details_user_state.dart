part of 'details_user_bloc.dart';

class DetailsUserState extends Equatable {
  final UserDetailsModel userDetailsModel;
  final Post userDetailsPostModel;
  final List<DataPost> dataPost;
  final RequestState requestState;
  const DetailsUserState(
      {required this.userDetailsModel,
      required this.userDetailsPostModel,
      required this.requestState,
      required this.dataPost});

  @override
  List<Object> get props =>
      [userDetailsModel, userDetailsPostModel, requestState];

  @override
  bool get stringify => true;
  DetailsUserState copyWith({
    UserDetailsModel? userDetailsModel,
    Post? userDetailsPostModel,
    List<DataPost>? dataPost,
    RequestState? requestState,
  }) {
    return DetailsUserState(
      userDetailsModel: userDetailsModel ?? this.userDetailsModel,
      userDetailsPostModel: userDetailsPostModel ?? this.userDetailsPostModel,
      dataPost: dataPost ?? this.dataPost,
      requestState: requestState ?? this.requestState,
    );
  }
}

class DetailsUserInitial extends DetailsUserState {
  const DetailsUserInitial(
      {super.userDetailsModel = const UserDetailsModel(),
      super.userDetailsPostModel = const Post(),
      super.dataPost = const [],
      super.requestState = RequestState.empty});
}
