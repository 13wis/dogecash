///
//  Generated code. Do not modify.
//  source: proto/dogecash.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class InteractionType extends $pb.ProtobufEnum {
  static const InteractionType recent = InteractionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'recent');
  static const InteractionType suggested = InteractionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'suggested');

  static const $core.List<InteractionType> values = <InteractionType> [
    recent,
    suggested,
  ];

  static final $core.Map<$core.int, InteractionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InteractionType? valueOf($core.int value) => _byValue[value];

  const InteractionType._($core.int v, $core.String n) : super(v, n);
}

class UpdateExternalAccountRequest_ExternalAccountType extends $pb.ProtobufEnum {
  static const UpdateExternalAccountRequest_ExternalAccountType bank_account = UpdateExternalAccountRequest_ExternalAccountType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bank_account');
  static const UpdateExternalAccountRequest_ExternalAccountType card = UpdateExternalAccountRequest_ExternalAccountType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'card');

  static const $core.List<UpdateExternalAccountRequest_ExternalAccountType> values = <UpdateExternalAccountRequest_ExternalAccountType> [
    bank_account,
    card,
  ];

  static final $core.Map<$core.int, UpdateExternalAccountRequest_ExternalAccountType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UpdateExternalAccountRequest_ExternalAccountType? valueOf($core.int value) => _byValue[value];

  const UpdateExternalAccountRequest_ExternalAccountType._($core.int v, $core.String n) : super(v, n);
}

class PayRequest_SourceType extends $pb.ProtobufEnum {
  static const PayRequest_SourceType account = PayRequest_SourceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'account');
  static const PayRequest_SourceType bank_account = PayRequest_SourceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bank_account');
  static const PayRequest_SourceType card = PayRequest_SourceType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'card');

  static const $core.List<PayRequest_SourceType> values = <PayRequest_SourceType> [
    account,
    bank_account,
    card,
  ];

  static final $core.Map<$core.int, PayRequest_SourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PayRequest_SourceType? valueOf($core.int value) => _byValue[value];

  const PayRequest_SourceType._($core.int v, $core.String n) : super(v, n);
}

class Activity_ActivityType extends $pb.ProtobufEnum {
  static const Activity_ActivityType add_cash = Activity_ActivityType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'add_cash');
  static const Activity_ActivityType cash_out = Activity_ActivityType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cash_out');
  static const Activity_ActivityType pay = Activity_ActivityType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'pay');
  static const Activity_ActivityType request = Activity_ActivityType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'request');

  static const $core.List<Activity_ActivityType> values = <Activity_ActivityType> [
    add_cash,
    cash_out,
    pay,
    request,
  ];

  static final $core.Map<$core.int, Activity_ActivityType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Activity_ActivityType? valueOf($core.int value) => _byValue[value];

  const Activity_ActivityType._($core.int v, $core.String n) : super(v, n);
}

