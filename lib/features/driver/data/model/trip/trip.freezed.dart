// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_id')
  String? get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_location')
  String? get startLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_location')
  String? get endLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'fare')
  String? get fare => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'driver_id') String? driverId,
      @JsonKey(name: 'start_location') String? startLocation,
      @JsonKey(name: 'end_location') String? endLocation,
      @JsonKey(name: 'fare') String? fare,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? driverId = freezed,
    Object? startLocation = freezed,
    Object? endLocation = freezed,
    Object? fare = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: freezed == startLocation
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      endLocation: freezed == endLocation
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      fare: freezed == fare
          ? _value.fare
          : fare // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'driver_id') String? driverId,
      @JsonKey(name: 'start_location') String? startLocation,
      @JsonKey(name: 'end_location') String? endLocation,
      @JsonKey(name: 'fare') String? fare,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? driverId = freezed,
    Object? startLocation = freezed,
    Object? endLocation = freezed,
    Object? fare = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TripImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      startLocation: freezed == startLocation
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      endLocation: freezed == endLocation
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      fare: freezed == fare
          ? _value.fare
          : fare // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TripImpl implements _Trip {
  const _$TripImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'driver_id') this.driverId,
      @JsonKey(name: 'start_location') this.startLocation,
      @JsonKey(name: 'end_location') this.endLocation,
      @JsonKey(name: 'fare') this.fare,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'driver_id')
  final String? driverId;
  @override
  @JsonKey(name: 'start_location')
  final String? startLocation;
  @override
  @JsonKey(name: 'end_location')
  final String? endLocation;
  @override
  @JsonKey(name: 'fare')
  final String? fare;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Trip(id: $id, driverId: $driverId, startLocation: $startLocation, endLocation: $endLocation, fare: $fare, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.startLocation, startLocation) ||
                other.startLocation == startLocation) &&
            (identical(other.endLocation, endLocation) ||
                other.endLocation == endLocation) &&
            (identical(other.fare, fare) || other.fare == fare) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, driverId, startLocation,
      endLocation, fare, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(
      this,
    );
  }
}

abstract class _Trip implements Trip {
  const factory _Trip(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'driver_id') final String? driverId,
      @JsonKey(name: 'start_location') final String? startLocation,
      @JsonKey(name: 'end_location') final String? endLocation,
      @JsonKey(name: 'fare') final String? fare,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'driver_id')
  String? get driverId;
  @override
  @JsonKey(name: 'start_location')
  String? get startLocation;
  @override
  @JsonKey(name: 'end_location')
  String? get endLocation;
  @override
  @JsonKey(name: 'fare')
  String? get fare;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
