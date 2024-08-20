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
  final List<dynamic>? transactionHistory;

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
