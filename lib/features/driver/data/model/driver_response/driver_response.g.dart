// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverResponse _$DriverResponseFromJson(Map<String, dynamic> json) =>
    DriverResponse(
      driver: json['driver'] == null
          ? null
          : DriverData.fromJson(json['driver'] as Map<String, dynamic>),
      earnings: (json['earnings'] as List<dynamic>?)
          ?.map((e) => Earning.fromJson(e as Map<String, dynamic>))
          .toList(),
      balance: json['balance'] as String?,
      completedRides: (json['completed_rides'] as num?)?.toInt(),
      rejectedRides: (json['rejected_rides'] as num?)?.toInt(),
      canceledRides: (json['canceled_rides'] as num?)?.toInt(),
      driveRate: (json['drive_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DriverResponseToJson(DriverResponse instance) =>
    <String, dynamic>{
      'driver': instance.driver?.toJson(),
      'earnings': instance.earnings?.map((e) => e.toJson()).toList(),
      'balance': instance.balance,
      'completed_rides': instance.completedRides,
      'rejected_rides': instance.rejectedRides,
      'canceled_rides': instance.canceledRides,
      'drive_rate': instance.driveRate,
    };
