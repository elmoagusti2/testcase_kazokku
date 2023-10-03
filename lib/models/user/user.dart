import 'package:equatable/equatable.dart';
import 'package:kazokku/models/user/data_user.dart';

class UserModel extends Equatable {
  final List<DataUser>? data;
  final int? total;
  final int? page;
  final int? limit;

  const UserModel({this.data, this.total, this.page, this.limit});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DataUser.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        page: json['page'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'total': total,
        'page': page,
        'limit': limit,
      };

  UserModel copyWith({
    List<DataUser>? data,
    int? total,
    int? page,
    int? limit,
  }) {
    return UserModel(
      data: data ?? this.data,
      total: total ?? this.total,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [data, total, page, limit];
}
