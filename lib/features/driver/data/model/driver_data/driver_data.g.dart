// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverData _$DriverDataFromJson(Map<String, dynamic> json) => DriverData(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      otpExpiresAt: json['otpExpiresAt'] == null
          ? null
          : DateTime.parse(json['otpExpiresAt'] as String),
      address: json['address'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String?,
      nextOfKinName: json['nextOfKinName'] as String?,
      nextOfKinPhoneNumber: json['nextOfKinPhoneNumber'] as String?,
      vehicleType: json['vehicleType'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      licenseExpiryDate: json['licenseExpiryDate'] as String?,
      licensePicture: json['licensePicture'] as String?,
      profilePicture: json['profilePicture'] as String?,
      vehicleManufacturer: json['vehicleManufacturer'] as String?,
      vehicleModel: json['vehicleModel'] as String?,
      vehicleYear: json['vehicleYear'] as String?,
      vehicleColor: json['vehicleColor'] as String?,
      plateNumber: json['plateNumber'] as String?,
      vehicleImageInterior: json['vehicleImageInterior'] as String?,
      vehicleImageExterior: json['vehicleImageExterior'] as String?,
      proofOfOwnership: json['proofOfOwnership'] as String?,
      vehicleLicense: json['vehicleLicense'] as String?,
      vehicleRoadWorthiness: json['vehicleRoadWorthiness'] as String?,
      vehicleInsurance: json['vehicleInsurance'] as String?,
      motorcycleManufacturer: json['motorcycleManufacturer'] as String?,
      motorcycleModel: json['motorcycleModel'] as String?,
      hackneyPermit: json['hackneyPermit'] as String?,
      motorcycleInsurance: json['motorcycleInsurance'] as String?,
      bank: json['bank'] as String?,
      bankAccountName: json['bankAccountName'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      isProfileComplete: (json['isProfileComplete'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DriverDataToJson(DriverData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'otpExpiresAt': instance.otpExpiresAt?.toIso8601String(),
      'address': instance.address,
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'nextOfKinName': instance.nextOfKinName,
      'nextOfKinPhoneNumber': instance.nextOfKinPhoneNumber,
      'vehicleType': instance.vehicleType,
      'licenseNumber': instance.licenseNumber,
      'licenseExpiryDate': instance.licenseExpiryDate,
      'licensePicture': instance.licensePicture,
      'profilePicture': instance.profilePicture,
      'vehicleManufacturer': instance.vehicleManufacturer,
      'vehicleModel': instance.vehicleModel,
      'vehicleYear': instance.vehicleYear,
      'vehicleColor': instance.vehicleColor,
      'plateNumber': instance.plateNumber,
      'vehicleImageInterior': instance.vehicleImageInterior,
      'vehicleImageExterior': instance.vehicleImageExterior,
      'proofOfOwnership': instance.proofOfOwnership,
      'vehicleLicense': instance.vehicleLicense,
      'vehicleRoadWorthiness': instance.vehicleRoadWorthiness,
      'vehicleInsurance': instance.vehicleInsurance,
      'motorcycleManufacturer': instance.motorcycleManufacturer,
      'motorcycleModel': instance.motorcycleModel,
      'hackneyPermit': instance.hackneyPermit,
      'motorcycleInsurance': instance.motorcycleInsurance,
      'bank': instance.bank,
      'bankAccountName': instance.bankAccountName,
      'bankAccountNumber': instance.bankAccountNumber,
      'isProfileComplete': instance.isProfileComplete,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
