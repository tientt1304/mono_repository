// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      subPhone: json['sub_phone'] as String?,
      profilePic: json['profile_pic'] as String? ?? '',
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      address: json['address'] as String?,
      customerId: json['customer_id'] as String?,
      brandId: json['brand_id'] as String?,
      userType: json['user_type'] as String?,
      source: json['source'] as String?,
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'sub_phone': instance.subPhone,
      'profile_pic': instance.profilePic,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob,
      'address': instance.address,
      'customer_id': instance.customerId,
      'brand_id': instance.brandId,
      'user_type': instance.userType,
      'source': instance.source,
      'access_token': instance.accessToken,
    };
