// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverDashboardData _$DriverDashboardDataFromJson(Map<String, dynamic> json) =>
    DriverDashboardData(
      todaysEarnings: (json['todays_earnings'] as num).toInt(),
      averageRating: (json['average_rating'] as num).toInt(),
      completedTrips: (json['completed_trips'] as num).toInt(),
      driveRate: (json['drive_rate'] as num).toInt(),
      acceptanceRate: (json['acceptance_rate'] as num).toInt(),
    );

Map<String, dynamic> _$DriverDashboardDataToJson(
        DriverDashboardData instance) =>
    <String, dynamic>{
      'todays_earnings': instance.todaysEarnings,
      'average_rating': instance.averageRating,
      'completed_trips': instance.completedTrips,
      'drive_rate': instance.driveRate,
      'acceptance_rate': instance.acceptanceRate,
    };
