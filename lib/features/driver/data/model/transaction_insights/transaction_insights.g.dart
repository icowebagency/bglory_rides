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
      transactionHistory: (json['transaction_history'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionInsightsToJson(
        TransactionInsights instance) =>
    <String, dynamic>{
      'total_earnings': instance.totalEarnings,
      'total_withdrawals': instance.totalWithdrawals,
      'available_balance': instance.availableBalance,
      'transaction_history': instance.transactionHistory,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: (json['id'] as num?)?.toInt(),
      driverId: (json['driver_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      amount: json['amount'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_id': instance.driverId,
      'type': instance.type,
      'amount': instance.amount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
