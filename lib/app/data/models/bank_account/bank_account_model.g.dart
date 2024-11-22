// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountModelImpl _$$BankAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountModelImpl(
      id: json['id'] as String,
      bank: json['bank'] as String,
      accountNumber: json['accountNumber'] as String,
      accountType: json['accountType'] as String,
      fullname: json['fullname'] as String,
      documentType: json['documentType'] as String,
      document: json['document'] as String,
    );

Map<String, dynamic> _$$BankAccountModelImplToJson(
        _$BankAccountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bank': instance.bank,
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'fullname': instance.fullname,
      'documentType': instance.documentType,
      'document': instance.document,
    };
