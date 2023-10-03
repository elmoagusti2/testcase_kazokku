part of 'details_user_bloc.dart';

abstract class DetailsUserEvent extends Equatable {
  const DetailsUserEvent();

  @override
  List<Object> get props => [];
}

class GetDetails extends DetailsUserEvent {
  final String id;

  const GetDetails({required this.id});
}

class FindPosts {
  final String? keyword;

  FindPosts({required this.keyword});
}
