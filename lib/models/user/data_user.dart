import 'package:equatable/equatable.dart';

class DataUser extends Equatable {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? picture;

  const DataUser({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json['id'] as String?,
        title: json['title'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        picture: json['picture'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'firstName': firstName,
        'lastName': lastName,
        'picture': picture,
      };

  DataUser copyWith({
    String? id,
    String? title,
    String? firstName,
    String? lastName,
    String? picture,
  }) {
    return DataUser(
      id: id ?? this.id,
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      picture: picture ?? this.picture,
    );
  }

  @override
  List<Object?> get props => [id, title, firstName, lastName, picture];
}
