import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? timezone;

  const Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json['street'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        country: json['country'] as String?,
        timezone: json['timezone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
        'state': state,
        'country': country,
        'timezone': timezone,
      };

  Location copyWith({
    String? street,
    String? city,
    String? state,
    String? country,
    String? timezone,
  }) {
    return Location(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      timezone: timezone ?? this.timezone,
    );
  }

  @override
  List<Object?> get props => [street, city, state, country, timezone];
}
