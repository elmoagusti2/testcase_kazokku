part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetUsers extends HomeEvent {
  final int limit;

  const GetUsers({required this.limit});
}
