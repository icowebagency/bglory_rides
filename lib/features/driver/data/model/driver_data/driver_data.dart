import 'package:bglory_rides/features/driver/data/model/earning/earning.dart';
import 'package:bglory_rides/features/driver/data/model/trip/trip.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'driver_data.g.dart';

@JsonSerializable()
class DriverData {
  @JsonKey(name: DriverKey.id)
  final int? id;

  @JsonKey(name: DriverKey.fullName)
  final String? fullName;

  @JsonKey(name: DriverKey.email)
  final String? email;

  @JsonKey(name: DriverKey.phone)
  final String? phone;

  @JsonKey(name: DriverKey.otpExpiresAt)
  final DateTime? otpExpiresAt;

  @JsonKey(name: DriverKey.address)
  final String? address;

  @JsonKey(name: DriverKey.dob)
  final DateTime? dob;

  @JsonKey(name: DriverKey.gender)
  final String? gender;

  @JsonKey(name: DriverKey.nextOfKinName)
  final String? nextOfKinName;

  @JsonKey(name: DriverKey.nextOfKinPhoneNumber)
  final String? nextOfKinPhoneNumber;

  @JsonKey(name: DriverKey.vehicleType)
  final String? vehicleType;

  @JsonKey(name: DriverKey.licenseNumber)
  final String? licenseNumber;

  @JsonKey(name: DriverKey.licenseExpiryDate)
  final DateTime? licenseExpiryDate;

  @JsonKey(name: DriverKey.licensePicture)
  final String? licensePicture;

  @JsonKey(name: DriverKey.profilePicture)
  final String? profilePicture;

  @JsonKey(name: DriverKey.vehicleManufacturer)
  final String? vehicleManufacturer;

  @JsonKey(name: DriverKey.vehicleModel)
  final String? vehicleModel;

  @JsonKey(name: DriverKey.vehicleYear)
  final String? vehicleYear;

  @JsonKey(name: DriverKey.vehicleColor)
  final String? vehicleColor;

  @JsonKey(name: DriverKey.plateNumber)
  final String? plateNumber;

  @JsonKey(name: DriverKey.vehicleImageInterior)
  final String? vehicleImageInterior;

  @JsonKey(name: DriverKey.vehicleImageExterior)
  final String? vehicleImageExterior;

  @JsonKey(name: DriverKey.proofOfOwnership)
  final String? proofOfOwnership;

  @JsonKey(name: DriverKey.vehicleLicense)
  final String? vehicleLicense;

  @JsonKey(name: DriverKey.vehicleRoadWorthiness)
  final String? vehicleRoadWorthiness;

  @JsonKey(name: DriverKey.vehicleInsurance)
  final String? vehicleInsurance;

  @JsonKey(name: DriverKey.motorcycleManufacturer)
  final String? motorcycleManufacturer;

  @JsonKey(name: DriverKey.motorcycleModel)
  final String? motorcycleModel;

  @JsonKey(name: DriverKey.hackneyPermit)
  final String? hackneyPermit;

  @JsonKey(name: DriverKey.motorcycleInsurance)
  final String? motorcycleInsurance;

  @JsonKey(name: DriverKey.motorcycleImage)
  final String? motorcycleImage;

  @JsonKey(name: DriverKey.bank)
  final String? bank;

  @JsonKey(name: DriverKey.bankAccountName)
  final String? bankAccountName;

  @JsonKey(name: DriverKey.bankAccountNumber)
  final String? bankAccountNumber;

  @JsonKey(name: DriverKey.isProfileComplete)
  final String? isProfileComplete;

  @JsonKey(name: DriverKey.status)
  final String? status;

  @JsonKey(name: DriverKey.createdAt)
  final DateTime? createdAt;

  @JsonKey(name: DriverKey.updatedAt)
  final DateTime? updatedAt;

  @JsonKey(name: DriverKey.earnings)
  final List<Earning>? earnings;

  @JsonKey(name: DriverKey.trips)
  final List<Trip>? trips;

  @JsonKey(name: DriverKey.balance)
  final double? balance;
  @JsonKey(name: DriverKey.completedRides)
  final double? completedRides;
  @JsonKey(name: DriverKey.rejectedRides)
  final double? rejectedRides;
  @JsonKey(name: DriverKey.canceledRides)
  final double? canceledRides;
  @JsonKey(name: DriverKey.driveRate)
  final double? driveRate;



  DriverData({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.otpExpiresAt,
    this.address,
    this.dob,
    this.gender,
    this.nextOfKinName,
    this.nextOfKinPhoneNumber,
    this.vehicleType,
    this.licenseNumber,
    this.licenseExpiryDate,
    this.licensePicture,
    this.profilePicture,
    this.vehicleManufacturer,
    this.vehicleModel,
    this.vehicleYear,
    this.vehicleColor,
    this.plateNumber,
    this.vehicleImageInterior,
    this.vehicleImageExterior,
    this.proofOfOwnership,
    this.vehicleLicense,
    this.vehicleRoadWorthiness,
    this.vehicleInsurance,
    this.motorcycleManufacturer,
    this.motorcycleModel,
    this.hackneyPermit,
    this.motorcycleInsurance,
    this.motorcycleImage,
    this.bank,
    this.bankAccountName,
    this.bankAccountNumber,
    this.isProfileComplete,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.earnings,
    this.trips,
    this.balance,
    this.completedRides,
    this.rejectedRides,
    this.canceledRides,
    this.driveRate,
  });

  bool? get profileIsIncomplete => (isProfileComplete == null
      ? null
      : (int.parse(isProfileComplete!) == 0 ? true : false));

  factory DriverData.fromJson(Map<String, dynamic> json) =>
      _$DriverDataFromJson(json);

  Map<String, dynamic> toJson() => _$DriverDataToJson(this);
}
