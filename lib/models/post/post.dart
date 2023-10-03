import 'package:equatable/equatable.dart';

import 'data_post.dart';

class Post extends Equatable {
  final List<DataPost>? data;
  final int? total;
  final int? page;
  final int? limit;

  const Post({
    this.data,
    this.total,
    this.page,
    this.limit,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'total': total,
        'page': page,
        'limit': limit,
      };

  Post copyWith({
    List<DataPost>? data,
    int? total,
    int? page,
    int? limit,
  }) {
    return Post(
      data: data ?? this.data,
      total: total ?? this.total,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [data, total, page, limit];
}
