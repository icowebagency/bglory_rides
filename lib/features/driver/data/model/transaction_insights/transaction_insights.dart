import 'package:bglory_rides/utils/constants/key_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_insights.g.dart';

@JsonSerializable()
class TransactionInsights {
  @JsonKey(name: DriverKey.totalEarnings)
  final String? totalEarnings;

  @JsonKey(name: DriverKey.totalWithdrawals)
  final int? totalWithdrawals;

  @JsonKey(name: DriverKey.availableBalance)
  final int? availableBalance;

  @JsonKey(name: DriverKey.transactionHistory)
  final List<Transaction>? transactionHistory;

  TransactionInsights({
    this.totalEarnings,
    this.totalWithdrawals,
    this.availableBalance,
    this.transactionHistory,
  });

  factory TransactionInsights.fromJson(Map<String, dynamic> json) =>
      _$TransactionInsightsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionInsightsToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'driver_id')
  final int? driverId;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'amount')
  final String? amount;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  Transaction({
    this.id,
    this.driverId,
    this.type,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor for creating a new `Transaction` instance from a map.
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  // Method for converting a `Transaction` instance to a map.
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
