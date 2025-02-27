// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.phone,
    this.subPhone,
    this.profilePic,
    this.email,
    this.gender,
    this.dob,
    this.address,
    this.customerId,
    this.brandId,
    this.userType,
    this.source,
    this.accessToken,
  });

  factory User.fromJson(final Map<String, dynamic> json) =>
      _$UserFromJson(json);
  final String? id;
  final String? name;
  final String? phone;
  @JsonKey(name: 'sub_phone')
  final String? subPhone;
  @JsonKey(name: 'profile_pic', defaultValue: '')
  final String? profilePic;
  final String? email;
  final String? gender;
  final String? dob;
  final String? address;
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'brand_id')
  final String? brandId;
  @JsonKey(name: 'user_type')
  final String? userType;
  final String? source;
  @JsonKey(name: 'access_token')
  final String? accessToken;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        phone,
        subPhone,
        profilePic,
        email,
        gender,
        dob,
        address,
        customerId,
        brandId,
        userType,
        source,
      ];
}
