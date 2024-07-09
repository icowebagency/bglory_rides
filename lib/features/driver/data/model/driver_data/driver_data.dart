import 'package:json_annotation/json_annotation.dart';

part 'driver_data.g.dart';

@JsonSerializable()
class DriverData {
  final int? id;
  final String? fullName;
  final String? phone;
  final DateTime? otpExpiresAt;
  final String? address;
  final DateTime? dob;
  final String? gender;
  final String? nextOfKinName;
  final String? nextOfKinPhoneNumber;
  final String? vehicleType;
  final String? licenseNumber;
  final String? licenseExpiryDate;
  final String? licensePicture;
  final String? profilePicture;
  final String? vehicleManufacturer;
  final String? vehicleModel;
  final String? vehicleYear;
  final String? vehicleColor;
  final String? plateNumber;
  final String? vehicleImageInterior;
  final String? vehicleImageExterior;
  final String? proofOfOwnership;
  final String? vehicleLicense;
  final String? vehicleRoadWorthiness;
  final String? vehicleInsurance;
  final String? motorcycleManufacturer;
  final String? motorcycleModel;
  final String? hackneyPermit;
  final String? motorcycleInsurance;
  final String? bank;
  final String? bankAccountName;
  final String? bankAccountNumber;
  final int? isProfileComplete;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DriverData({
    this.id,
    this.fullName,
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
    this.bank,
    this.bankAccountName,
    this.bankAccountNumber,
    this.isProfileComplete,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory DriverData.fromJson(Map<String, dynamic> json) => _$DriverDataFromJson(json);

  Map<String, dynamic> toJson() => _$DriverDataToJson(this);
}
