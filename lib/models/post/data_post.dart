import 'package:equatable/equatable.dart';

import 'owner.dart';

class DataPost extends Equatable {
  final String? id;
  final String? image;
  final int? likes;
  final List<String>? tags;
  final String? text;
  final DateTime? publishDate;
  final Owner? owner;

  const DataPost({
    this.id,
    this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.owner,
  });

  factory DataPost.fromJson(Map<String, dynamic> json) => DataPost(
        id: json['id'] as String?,
        image: json['image'] as String?,
        likes: json['likes'] as int?,
        tags:
            (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
        publishDate: json['publishDate'] == null
            ? null
            : DateTime.parse(json['publishDate'] as String),
        owner: json['owner'] == null
            ? null
            : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'likes': likes,
        'tags': tags,
        'text': text,
        'publishDate': publishDate?.toIso8601String(),
        'owner': owner?.toJson(),
      };

  DataPost copyWith({
    String? id,
    String? image,
    int? likes,
    List<String>? tags,
    String? text,
    DateTime? publishDate,
    Owner? owner,
  }) {
    return DataPost(
      id: id ?? this.id,
      image: image ?? this.image,
      likes: likes ?? this.likes,
      tags: tags ?? this.tags,
      text: text ?? this.text,
      publishDate: publishDate ?? this.publishDate,
      owner: owner ?? this.owner,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      image,
      likes,
      tags,
      text,
      publishDate,
      owner,
    ];
  }
}
