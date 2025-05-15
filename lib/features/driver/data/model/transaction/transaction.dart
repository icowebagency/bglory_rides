import 'package:bglory_rides/features/driver/data/model/transaction/transaction_widget_data.dart';
import 'package:bglory_rides/utils/constants/colors.dart';
import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final int id;
  @JsonKey(name: 'driver_id')
  final int driverId;
  final String type;
  final String amount;
  final String status;
  @JsonKey(name: DriverKey.createdAt)
  final DateTime createdAt;
  @JsonKey(name: DriverKey.updatedAt)
  final DateTime updatedAt;

  Transaction({
    required this.id,
    required this.driverId,
    required this.type,
    required this.amount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  // Method to transform Transaction to TransactionData
  TransactionWidgetData mapApiToTransactionData() {
    IconData progressIcon;
    Color progressColor;
    if (status == "Successful") {
      progressIcon = Iconsax.tick_circle;
      progressColor = TColors.success;
    } else if (status == "Pending") {
      progressIcon = Iconsax.minus_cirlce;
      progressColor = TColors.warning;
    } else {
      progressIcon = Iconsax.close_circle;
      progressColor = TColors.error;
    }

    return TransactionWidgetData(
      withdrawalDate: createdAt.toString(), // Format as needed
      withdrawalIconProgress: progressIcon,
      withdrawalIconProgressColor: progressColor,
      withdrawalIconType: Iconsax.send, // Assuming send icon for all
      withdrawalProgress: status,
      withdrawalProgressColor: progressColor,
      withdrawIconTypeColor: progressColor,
      withdrewedAmount: amount,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}