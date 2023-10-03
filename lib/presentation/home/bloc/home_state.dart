part of 'home_bloc.dart';

class HomeState extends Equatable {
  final UserModel userModel;
  final RequestState requestState;

  final String? message;
  const HomeState(
      {required this.userModel, required this.requestState, this.message});
  factory HomeState.initial() {
    return const HomeState(
      requestState: RequestState.empty,
      message: '',
      userModel: UserModel(),
    );
  }
  @override
  List<Object?> get props => [
        userModel,
        requestState,
        message,
      ];

  HomeState copyWith({
    UserModel? userModel,
    RequestState? requestState,
    String? message,
  }) {
    return HomeState(
        userModel: userModel ?? this.userModel,
        requestState: requestState ?? this.requestState,
        message: message ?? this.message);
  }
}
