import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazokku/commmon/enum.dart';
import 'package:kazokku/models/user_details_model/user_details_model.dart';
import 'package:kazokku/models/post/data_post.dart';
import 'package:kazokku/models/post/post.dart';
import 'package:kazokku/repositories/dummy_api.dart';

part 'details_user_event.dart';
part 'details_user_state.dart';

class DetailsUserBloc extends Bloc<DetailsUserEvent, DetailsUserState> {
  DummyApi dummyApi = DummyApi();
  DetailsUserBloc() : super(const DetailsUserInitial()) {
    on(_getUserDetails);
  }

  _getUserDetails(GetDetails event, emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    try {
      UserDetailsModel detail = await dummyApi.getUsersDetails(event.id);
      Post detailPost = await dummyApi.getUsersDetailsPosts(event.id);

      emit(state.copyWith(
          dataPost: detailPost.data,
          userDetailsModel: detail,
          userDetailsPostModel: detailPost,
          requestState: RequestState.success));
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }
}
