import 'package:equatable/equatable.dart';

import 'location.dart';

class UserDetailsModel extends Equatable {
  final String? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? picture;
  final String? gender;
  final String? email;
  final DateTime? dateOfBirth;
  final String? phone;
  final Location? location;
  final DateTime? registerDate;
  final DateTime? updatedDate;

  const UserDetailsModel({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.phone,
    this.location,
    this.registerDate,
    this.updatedDate,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      picture: json['picture'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      phone: json['phone'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      registerDate: json['registerDate'] == null
          ? null
          : DateTime.parse(json['registerDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'firstName': firstName,
        'lastName': lastName,
        'picture': picture,
        'gender': gender,
        'email': email,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'phone': phone,
        'location': location?.toJson(),
        'registerDate': registerDate?.toIso8601String(),
        'updatedDate': updatedDate?.toIso8601String(),
      };

  UserDetailsModel copyWith({
    String? id,
    String? title,
    String? firstName,
    String? lastName,
    String? picture,
    String? gender,
    String? email,
    DateTime? dateOfBirth,
    String? phone,
    Location? location,
    DateTime? registerDate,
    DateTime? updatedDate,
  }) {
    return UserDetailsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      picture: picture ?? this.picture,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      registerDate: registerDate ?? this.registerDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      firstName,
      lastName,
      picture,
      gender,
      email,
      dateOfBirth,
      phone,
      location,
      registerDate,
      updatedDate,
    ];
  }
}
