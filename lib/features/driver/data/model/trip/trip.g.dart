// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: (json['id'] as num?)?.toInt(),
      driverId: json['driver_id'] as String?,
      startLocation: json['start_location'] as String?,
      endLocation: json['end_location'] as String?,
      fare: json['fare'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'start_location': instance.startLocation,
      'end_location': instance.endLocation,
      'fare': instance.fare,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
