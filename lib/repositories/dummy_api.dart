import 'package:dio/dio.dart';
import 'package:kazokku/models/user/user.dart';
import 'package:kazokku/models/user_details_model/user_details_model.dart';
import 'package:kazokku/models/post/post.dart';

class DummyApi {
  Dio dio = Dio();
  final String basePath = 'https://dummyapi.io/data/v1/';
  final Map<String, String> options = {'app-id': '651c13206b0e4c7033dc33d1'};

  Future<dynamic> getUsers(int limit) async {
    var response = await dio.get('$basePath/user',
        options: Options(headers: options),
        queryParameters: {'limit': '$limit'});
    return UserModel.fromJson(response.data);
  }

  Future<dynamic> getUsersDetails(String id) async {
    var response = await dio.get(
      '$basePath/user/$id',
      options: Options(headers: options),
    );
    return UserDetailsModel.fromJson(response.data);
  }

  Future<dynamic> getUsersDetailsPosts(String id) async {
    var response = await dio.get(
      '$basePath/user/$id/post',
      options: Options(headers: options),
    );
    return Post.fromJson(response.data);
  }

  Future<dynamic> getPost(int limit) async {
    var response = await dio.get('$basePath/post',
        options: Options(headers: options),
        queryParameters: {'limit': '$limit'});
    return Post.fromJson(response.data);
  }
}
