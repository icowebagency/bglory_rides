// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  @JsonSerializable(explicitToJson: true)
  const factory Trip({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'driver_id') String? driverId,
    @JsonKey(name: 'start_location') String? startLocation,
    @JsonKey(name: 'end_location') String? endLocation,
    @JsonKey(name: 'fare') String? fare,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

}
