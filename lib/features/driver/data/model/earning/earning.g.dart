// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Earning _$EarningFromJson(Map<String, dynamic> json) => Earning(
      id: (json['id'] as num?)?.toInt(),
      driverId: json['driver_id'] as String?,
      tripId: json['trip_id'] as String?,
      amount: json['amount'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      trip: json['trip'] == null
          ? null
          : Trip.fromJson(json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EarningToJson(Earning instance) => <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'trip_id': instance.tripId,
      'amount': instance.amount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'trip': instance.trip,
    };
