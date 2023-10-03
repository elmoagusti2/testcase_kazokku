import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazokku/commmon/enum.dart';
import 'package:kazokku/models/user/data_user.dart';
import 'package:kazokku/models/user/user.dart';
import 'package:kazokku/repositories/dummy_api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  DummyApi dummyApi = DummyApi();
  HomeBloc() : super(HomeState.initial()) {
    on(_getUsers);
  }

  _getUsers(GetUsers event, emit) async {
    try {
      UserModel user = await dummyApi.getUsers(event.limit);
      if (event.limit == 10) {
        emit(state.copyWith(requestState: RequestState.loading));
        emit(HomeState(requestState: RequestState.success, userModel: user));
      }
      if (event.limit <= 50 && event.limit > 10) {
        List<DataUser> data = state.userModel.data!;
        data.addAll(user.data!);
        emit(HomeState(
            requestState: RequestState.success,
            userModel: UserModel(
                data: data,
                limit: user.limit,
                page: user.page,
                total: user.total)));
      }
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error, message: '$e'));
    }
  }
}
