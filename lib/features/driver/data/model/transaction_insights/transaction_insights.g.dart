// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_insights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionInsights _$TransactionInsightsFromJson(Map<String, dynamic> json) =>
    TransactionInsights(
      totalEarnings: json['total_earnings'] as String?,
      totalWithdrawals: (json['total_withdrawals'] as num?)?.toInt(),
      availableBalance: (json['available_balance'] as num?)?.toInt(),
      transactionHistory: json['transaction_history'] as List<dynamic>?,
    );

Map<String, dynamic> _$TransactionInsightsToJson(
        TransactionInsights instance) =>
    <String, dynamic>{
      'total_earnings': instance.totalEarnings,
      'total_withdrawals': instance.totalWithdrawals,
      'available_balance': instance.availableBalance,
      'transaction_history': instance.transactionHistory,
    };
