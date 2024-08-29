// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverData _$DriverDataFromJson(Map<String, dynamic> json) => DriverData(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      otpExpiresAt: json['otp_expires_at'] == null
          ? null
          : DateTime.parse(json['otp_expires_at'] as String),
      address: json['address'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String?,
      nextOfKinName: json['next_of_kin_name'] as String?,
      nextOfKinPhoneNumber: json['next_of_kin_phone_number'] as String?,
      vehicleType: json['vehicle_type'] as String?,
      licenseNumber: json['license_number'] as String?,
      licenseExpiryDate: json['license_expiry_date'] == null
          ? null
          : DateTime.parse(json['license_expiry_date'] as String),
      licensePicture: json['license_picture'] as String?,
      profilePicture: json['profile_picture'] as String?,
      vehicleManufacturer: json['vehicle_manufacturer'] as String?,
      vehicleModel: json['vehicle_model'] as String?,
      vehicleYear: json['vehicle_year'] as String?,
      vehicleColor: json['vehicle_color'] as String?,
      plateNumber: json['plate_number'] as String?,
      vehicleImageInterior: json['vehicle_image_interior'] as String?,
      vehicleImageExterior: json['vehicle_image_exterior'] as String?,
      proofOfOwnership: json['proof_of_ownership'] as String?,
      vehicleLicense: json['vehicle_license'] as String?,
      vehicleRoadWorthiness: json['vehicle_road_worthiness'] as String?,
      vehicleInsurance: json['vehicle_insurance'] as String?,
      motorcycleManufacturer: json['motorcycle_manufacturer'] as String?,
      motorcycleModel: json['motorcycle_model'] as String?,
      hackneyPermit: json['hackney_permit'] as String?,
      motorcycleInsurance: json['motorcycle_insurance'] as String?,
      motorcycleImage: json['motorcycle_image'] as String?,
      bank: json['bank'] as String?,
      bankAccountName: json['bank_account_name'] as String?,
      bankAccountNumber: json['bank_account_number'] as String?,
      isProfileComplete: json['is_profile_complete'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      earnings: (json['earnings'] as List<dynamic>?)
          ?.map((e) => Earning.fromJson(e as Map<String, dynamic>))
          .toList(),
      trips: (json['trips'] as List<dynamic>?)
          ?.map((e) => Trip.fromJson(e as Map<String, dynamic>))
          .toList(),
      balance: (json['balance'] as num?)?.toDouble(),
      completedRides: (json['completed_rides'] as num?)?.toDouble(),
      rejectedRides: (json['rejected_rides'] as num?)?.toDouble(),
      canceledRides: (json['canceled_rides'] as num?)?.toDouble(),
      driveRate: (json['drive_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DriverDataToJson(DriverData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'otp_expires_at': instance.otpExpiresAt?.toIso8601String(),
      'address': instance.address,
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'next_of_kin_name': instance.nextOfKinName,
      'next_of_kin_phone_number': instance.nextOfKinPhoneNumber,
      'vehicle_type': instance.vehicleType,
      'license_number': instance.licenseNumber,
      'license_expiry_date': instance.licenseExpiryDate?.toIso8601String(),
      'license_picture': instance.licensePicture,
      'profile_picture': instance.profilePicture,
      'vehicle_manufacturer': instance.vehicleManufacturer,
      'vehicle_model': instance.vehicleModel,
      'vehicle_year': instance.vehicleYear,
      'vehicle_color': instance.vehicleColor,
      'plate_number': instance.plateNumber,
      'vehicle_image_interior': instance.vehicleImageInterior,
      'vehicle_image_exterior': instance.vehicleImageExterior,
      'proof_of_ownership': instance.proofOfOwnership,
      'vehicle_license': instance.vehicleLicense,
      'vehicle_road_worthiness': instance.vehicleRoadWorthiness,
      'vehicle_insurance': instance.vehicleInsurance,
      'motorcycle_manufacturer': instance.motorcycleManufacturer,
      'motorcycle_model': instance.motorcycleModel,
      'hackney_permit': instance.hackneyPermit,
      'motorcycle_insurance': instance.motorcycleInsurance,
      'motorcycle_image': instance.motorcycleImage,
      'bank': instance.bank,
      'bank_account_name': instance.bankAccountName,
      'bank_account_number': instance.bankAccountNumber,
      'is_profile_complete': instance.isProfileComplete,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'earnings': instance.earnings,
      'trips': instance.trips,
      'balance': instance.balance,
      'completed_rides': instance.completedRides,
      'rejected_rides': instance.rejectedRides,
      'canceled_rides': instance.canceledRides,
      'drive_rate': instance.driveRate,
    };
