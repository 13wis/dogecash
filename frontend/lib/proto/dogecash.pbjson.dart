///
//  Generated code. Do not modify.
//  source: proto/dogecash.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use interactionTypeDescriptor instead')
const InteractionType$json = const {
  '1': 'InteractionType',
  '2': const [
    const {'1': 'recent', '2': 0},
    const {'1': 'suggested', '2': 1},
  ],
};

/// Descriptor for `InteractionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List interactionTypeDescriptor = $convert.base64Decode('Cg9JbnRlcmFjdGlvblR5cGUSCgoGcmVjZW50EAASDQoJc3VnZ2VzdGVkEAE=');
@$core.Deprecated('Use authenticationRequestDescriptor instead')
const AuthenticationRequest$json = const {
  '1': 'AuthenticationRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `AuthenticationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationRequestDescriptor = $convert.base64Decode('ChVBdXRoZW50aWNhdGlvblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use baseDogeDescriptor instead')
const BaseDoge$json = const {
  '1': 'BaseDoge',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'dogetag', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'dogetag', '17': true},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'first_name', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'firstName', '17': true},
    const {'1': 'last_name', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'lastName', '17': true},
    const {'1': 'profile_pic_url', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'profilePicUrl', '17': true},
    const {'1': 'interaction_type', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'interactionType', '17': true},
  ],
  '8': const [
    const {'1': '_dogetag'},
    const {'1': '_first_name'},
    const {'1': '_last_name'},
    const {'1': '_profile_pic_url'},
    const {'1': '_interaction_type'},
  ],
};

/// Descriptor for `BaseDoge`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List baseDogeDescriptor = $convert.base64Decode('CghCYXNlRG9nZRIOCgJpZBgBIAEoA1ICaWQSHQoHZG9nZXRhZxgCIAEoCUgAUgdkb2dldGFniAEBEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIiCgpmaXJzdF9uYW1lGAQgASgJSAFSCWZpcnN0TmFtZYgBARIgCglsYXN0X25hbWUYBSABKAlIAlIIbGFzdE5hbWWIAQESKwoPcHJvZmlsZV9waWNfdXJsGAYgASgJSANSDXByb2ZpbGVQaWNVcmyIAQESLgoQaW50ZXJhY3Rpb25fdHlwZRgHIAEoCUgEUg9pbnRlcmFjdGlvblR5cGWIAQFCCgoIX2RvZ2V0YWdCDQoLX2ZpcnN0X25hbWVCDAoKX2xhc3RfbmFtZUISChBfcHJvZmlsZV9waWNfdXJsQhMKEV9pbnRlcmFjdGlvbl90eXBl');
@$core.Deprecated('Use viewerResponseDescriptor instead')
const ViewerResponse$json = const {
  '1': 'ViewerResponse',
  '2': const [
    const {'1': 'doge', '3': 1, '4': 1, '5': 11, '6': '.proto.BaseDoge', '10': 'doge'},
    const {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'dob', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'dob', '17': true},
    const {'1': 'external_account_linked', '3': 4, '4': 1, '5': 8, '10': 'externalAccountLinked'},
    const {'1': 'stripe_account_created', '3': 5, '4': 1, '5': 8, '10': 'stripeAccountCreated'},
    const {'1': 'token', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'token', '17': true},
  ],
  '8': const [
    const {'1': '_dob'},
    const {'1': '_token'},
  ],
};

/// Descriptor for `ViewerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List viewerResponseDescriptor = $convert.base64Decode('Cg5WaWV3ZXJSZXNwb25zZRIjCgRkb2dlGAEgASgLMg8ucHJvdG8uQmFzZURvZ2VSBGRvZ2USOQoKY3JlYXRlZF9hdBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBIVCgNkb2IYAyABKAlIAFIDZG9iiAEBEjYKF2V4dGVybmFsX2FjY291bnRfbGlua2VkGAQgASgIUhVleHRlcm5hbEFjY291bnRMaW5rZWQSNAoWc3RyaXBlX2FjY291bnRfY3JlYXRlZBgFIAEoCFIUc3RyaXBlQWNjb3VudENyZWF0ZWQSGQoFdG9rZW4YBiABKAlIAVIFdG9rZW6IAQFCBgoEX2RvYkIICgZfdG9rZW4=');
@$core.Deprecated('Use dogetagAvailableRequestDescriptor instead')
const DogetagAvailableRequest$json = const {
  '1': 'DogetagAvailableRequest',
  '2': const [
    const {'1': 'dogetag', '3': 1, '4': 1, '5': 9, '10': 'dogetag'},
  ],
};

/// Descriptor for `DogetagAvailableRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dogetagAvailableRequestDescriptor = $convert.base64Decode('ChdEb2dldGFnQXZhaWxhYmxlUmVxdWVzdBIYCgdkb2dldGFnGAEgASgJUgdkb2dldGFn');
@$core.Deprecated('Use dogetagAvaiableResponseDescriptor instead')
const DogetagAvaiableResponse$json = const {
  '1': 'DogetagAvaiableResponse',
  '2': const [
    const {'1': 'available', '3': 1, '4': 1, '5': 8, '10': 'available'},
  ],
};

/// Descriptor for `DogetagAvaiableResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dogetagAvaiableResponseDescriptor = $convert.base64Decode('ChdEb2dldGFnQXZhaWFibGVSZXNwb25zZRIcCglhdmFpbGFibGUYASABKAhSCWF2YWlsYWJsZQ==');
@$core.Deprecated('Use updateDogetagRequestDescriptor instead')
const UpdateDogetagRequest$json = const {
  '1': 'UpdateDogetagRequest',
  '2': const [
    const {'1': 'dogetag', '3': 1, '4': 1, '5': 9, '10': 'dogetag'},
  ],
};

/// Descriptor for `UpdateDogetagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDogetagRequestDescriptor = $convert.base64Decode('ChRVcGRhdGVEb2dldGFnUmVxdWVzdBIYCgdkb2dldGFnGAEgASgJUgdkb2dldGFn');
@$core.Deprecated('Use updateStripeInfoRequestDescriptor instead')
const UpdateStripeInfoRequest$json = const {
  '1': 'UpdateStripeInfoRequest',
  '2': const [
    const {'1': 'day', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'day', '17': true},
    const {'1': 'month', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'month', '17': true},
    const {'1': 'year', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'year', '17': true},
    const {'1': 'first_name', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'firstName', '17': true},
    const {'1': 'last_name', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'lastName', '17': true},
    const {'1': 'create', '3': 6, '4': 1, '5': 8, '10': 'create'},
  ],
  '8': const [
    const {'1': '_day'},
    const {'1': '_month'},
    const {'1': '_year'},
    const {'1': '_first_name'},
    const {'1': '_last_name'},
  ],
};

/// Descriptor for `UpdateStripeInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStripeInfoRequestDescriptor = $convert.base64Decode('ChdVcGRhdGVTdHJpcGVJbmZvUmVxdWVzdBIVCgNkYXkYASABKANIAFIDZGF5iAEBEhkKBW1vbnRoGAIgASgDSAFSBW1vbnRoiAEBEhcKBHllYXIYAyABKANIAlIEeWVhcogBARIiCgpmaXJzdF9uYW1lGAQgASgJSANSCWZpcnN0TmFtZYgBARIgCglsYXN0X25hbWUYBSABKAlIBFIIbGFzdE5hbWWIAQESFgoGY3JlYXRlGAYgASgIUgZjcmVhdGVCBgoEX2RheUIICgZfbW9udGhCBwoFX3llYXJCDQoLX2ZpcnN0X25hbWVCDAoKX2xhc3RfbmFtZQ==');
@$core.Deprecated('Use updateExternalAccountRequestDescriptor instead')
const UpdateExternalAccountRequest$json = const {
  '1': 'UpdateExternalAccountRequest',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'external_account_type', '3': 2, '4': 1, '5': 14, '6': '.proto.UpdateExternalAccountRequest.ExternalAccountType', '10': 'externalAccountType'},
  ],
  '4': const [UpdateExternalAccountRequest_ExternalAccountType$json],
};

@$core.Deprecated('Use updateExternalAccountRequestDescriptor instead')
const UpdateExternalAccountRequest_ExternalAccountType$json = const {
  '1': 'ExternalAccountType',
  '2': const [
    const {'1': 'bank_account', '2': 0},
    const {'1': 'card', '2': 1},
  ],
};

/// Descriptor for `UpdateExternalAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateExternalAccountRequestDescriptor = $convert.base64Decode('ChxVcGRhdGVFeHRlcm5hbEFjY291bnRSZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbhJrChVleHRlcm5hbF9hY2NvdW50X3R5cGUYAiABKA4yNy5wcm90by5VcGRhdGVFeHRlcm5hbEFjY291bnRSZXF1ZXN0LkV4dGVybmFsQWNjb3VudFR5cGVSE2V4dGVybmFsQWNjb3VudFR5cGUiMQoTRXh0ZXJuYWxBY2NvdW50VHlwZRIQCgxiYW5rX2FjY291bnQQABIICgRjYXJkEAE=');
@$core.Deprecated('Use forgotPasswordRequestDescriptor instead')
const ForgotPasswordRequest$json = const {
  '1': 'ForgotPasswordRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `ForgotPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordRequestDescriptor = $convert.base64Decode('ChVGb3Jnb3RQYXNzd29yZFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');
@$core.Deprecated('Use verifyCodeRequestDescriptor instead')
const VerifyCodeRequest$json = const {
  '1': 'VerifyCodeRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyCodeRequestDescriptor = $convert.base64Decode('ChFWZXJpZnlDb2RlUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSEgoEY29kZRgCIAEoCVIEY29kZQ==');
@$core.Deprecated('Use resetPasswordRequestDescriptor instead')
const ResetPasswordRequest$json = const {
  '1': 'ResetPasswordRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ResetPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRequestDescriptor = $convert.base64Decode('ChRSZXNldFBhc3N3b3JkUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSEgoEY29kZRgCIAEoCVIEY29kZRIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use myDogesResponseDescriptor instead')
const MyDogesResponse$json = const {
  '1': 'MyDogesResponse',
  '2': const [
    const {'1': 'doges', '3': 1, '4': 3, '5': 11, '6': '.proto.BaseDoge', '10': 'doges'},
  ],
};

/// Descriptor for `MyDogesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List myDogesResponseDescriptor = $convert.base64Decode('Cg9NeURvZ2VzUmVzcG9uc2USJQoFZG9nZXMYASADKAsyDy5wcm90by5CYXNlRG9nZVIFZG9nZXM=');
@$core.Deprecated('Use balanceResponseDescriptor instead')
const BalanceResponse$json = const {
  '1': 'BalanceResponse',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 3, '10': 'balance'},
  ],
};

/// Descriptor for `BalanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List balanceResponseDescriptor = $convert.base64Decode('Cg9CYWxhbmNlUmVzcG9uc2USGAoHYmFsYW5jZRgBIAEoA1IHYmFsYW5jZQ==');
@$core.Deprecated('Use externalAccountDescriptor instead')
const ExternalAccount$json = const {
  '1': 'ExternalAccount',
  '2': const [
    const {'1': 'external_account_type', '3': 1, '4': 1, '5': 9, '10': 'externalAccountType'},
    const {'1': 'bank_name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'bankName', '17': true},
    const {'1': 'brand', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'brand', '17': true},
    const {'1': 'last4', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'last4', '17': true},
    const {'1': 'exp_month', '3': 5, '4': 1, '5': 3, '9': 3, '10': 'expMonth', '17': true},
    const {'1': 'exp_year', '3': 6, '4': 1, '5': 3, '9': 4, '10': 'expYear', '17': true},
    const {'1': 'eligible', '3': 7, '4': 1, '5': 8, '9': 5, '10': 'eligible', '17': true},
  ],
  '8': const [
    const {'1': '_bank_name'},
    const {'1': '_brand'},
    const {'1': '_last4'},
    const {'1': '_exp_month'},
    const {'1': '_exp_year'},
    const {'1': '_eligible'},
  ],
};

/// Descriptor for `ExternalAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalAccountDescriptor = $convert.base64Decode('Cg9FeHRlcm5hbEFjY291bnQSMgoVZXh0ZXJuYWxfYWNjb3VudF90eXBlGAEgASgJUhNleHRlcm5hbEFjY291bnRUeXBlEiAKCWJhbmtfbmFtZRgCIAEoCUgAUghiYW5rTmFtZYgBARIZCgVicmFuZBgDIAEoCUgBUgVicmFuZIgBARIZCgVsYXN0NBgEIAEoCUgCUgVsYXN0NIgBARIgCglleHBfbW9udGgYBSABKANIA1IIZXhwTW9udGiIAQESHgoIZXhwX3llYXIYBiABKANIBFIHZXhwWWVhcogBARIfCghlbGlnaWJsZRgHIAEoCEgFUghlbGlnaWJsZYgBAUIMCgpfYmFua19uYW1lQggKBl9icmFuZEIICgZfbGFzdDRCDAoKX2V4cF9tb250aEILCglfZXhwX3llYXJCCwoJX2VsaWdpYmxl');
@$core.Deprecated('Use externalAccountsResponseDescriptor instead')
const ExternalAccountsResponse$json = const {
  '1': 'ExternalAccountsResponse',
  '2': const [
    const {'1': 'external_account', '3': 1, '4': 3, '5': 11, '6': '.proto.ExternalAccount', '10': 'externalAccount'},
  ],
};

/// Descriptor for `ExternalAccountsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalAccountsResponseDescriptor = $convert.base64Decode('ChhFeHRlcm5hbEFjY291bnRzUmVzcG9uc2USQQoQZXh0ZXJuYWxfYWNjb3VudBgBIAMoCzIWLnByb3RvLkV4dGVybmFsQWNjb3VudFIPZXh0ZXJuYWxBY2NvdW50');
@$core.Deprecated('Use searchDogesResponseDescriptor instead')
const SearchDogesResponse$json = const {
  '1': 'SearchDogesResponse',
  '2': const [
    const {'1': 'doge', '3': 1, '4': 3, '5': 11, '6': '.proto.BaseDoge', '10': 'doge'},
  ],
};

/// Descriptor for `SearchDogesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchDogesResponseDescriptor = $convert.base64Decode('ChNTZWFyY2hEb2dlc1Jlc3BvbnNlEiMKBGRvZ2UYASADKAsyDy5wcm90by5CYXNlRG9nZVIEZG9nZQ==');
@$core.Deprecated('Use payRequestDescriptor instead')
const PayRequest$json = const {
  '1': 'PayRequest',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
    const {'1': 'note', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'note', '17': true},
    const {'1': 'requestId', '3': 3, '4': 1, '5': 3, '9': 1, '10': 'requestId', '17': true},
    const {'1': 'source_type', '3': 4, '4': 1, '5': 14, '6': '.proto.PayRequest.SourceType', '10': 'sourceType'},
    const {'1': 'to', '3': 5, '4': 1, '5': 3, '10': 'to'},
  ],
  '4': const [PayRequest_SourceType$json],
  '8': const [
    const {'1': '_note'},
    const {'1': '_requestId'},
  ],
};

@$core.Deprecated('Use payRequestDescriptor instead')
const PayRequest_SourceType$json = const {
  '1': 'SourceType',
  '2': const [
    const {'1': 'account', '2': 0},
    const {'1': 'bank_account', '2': 1},
    const {'1': 'card', '2': 2},
  ],
};

/// Descriptor for `PayRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payRequestDescriptor = $convert.base64Decode('CgpQYXlSZXF1ZXN0EhYKBmFtb3VudBgBIAEoA1IGYW1vdW50EhcKBG5vdGUYAiABKAlIAFIEbm90ZYgBARIhCglyZXF1ZXN0SWQYAyABKANIAVIJcmVxdWVzdElkiAEBEj0KC3NvdXJjZV90eXBlGAQgASgOMhwucHJvdG8uUGF5UmVxdWVzdC5Tb3VyY2VUeXBlUgpzb3VyY2VUeXBlEg4KAnRvGAUgASgDUgJ0byI1CgpTb3VyY2VUeXBlEgsKB2FjY291bnQQABIQCgxiYW5rX2FjY291bnQQARIICgRjYXJkEAJCBwoFX25vdGVCDAoKX3JlcXVlc3RJZA==');
@$core.Deprecated('Use sendRequestRequestDescriptor instead')
const SendRequestRequest$json = const {
  '1': 'SendRequestRequest',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
    const {'1': 'note', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'note', '17': true},
    const {'1': 'to', '3': 3, '4': 1, '5': 3, '10': 'to'},
  ],
  '8': const [
    const {'1': '_note'},
  ],
};

/// Descriptor for `SendRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendRequestRequestDescriptor = $convert.base64Decode('ChJTZW5kUmVxdWVzdFJlcXVlc3QSFgoGYW1vdW50GAEgASgDUgZhbW91bnQSFwoEbm90ZRgCIAEoCUgAUgRub3RliAEBEg4KAnRvGAMgASgDUgJ0b0IHCgVfbm90ZQ==');
@$core.Deprecated('Use addCashRequestDescriptor instead')
const AddCashRequest$json = const {
  '1': 'AddCashRequest',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
    const {'1': 'external_account_type', '3': 2, '4': 1, '5': 9, '10': 'externalAccountType'},
  ],
};

/// Descriptor for `AddCashRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCashRequestDescriptor = $convert.base64Decode('Cg5BZGRDYXNoUmVxdWVzdBIWCgZhbW91bnQYASABKANSBmFtb3VudBIyChVleHRlcm5hbF9hY2NvdW50X3R5cGUYAiABKAlSE2V4dGVybmFsQWNjb3VudFR5cGU=');
@$core.Deprecated('Use cashOutRequestDescriptor instead')
const CashOutRequest$json = const {
  '1': 'CashOutRequest',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 3, '10': 'amount'},
    const {'1': 'external_account_type', '3': 2, '4': 1, '5': 9, '10': 'externalAccountType'},
    const {'1': 'instant', '3': 3, '4': 1, '5': 8, '10': 'instant'},
  ],
};

/// Descriptor for `CashOutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cashOutRequestDescriptor = $convert.base64Decode('Cg5DYXNoT3V0UmVxdWVzdBIWCgZhbW91bnQYASABKANSBmFtb3VudBIyChVleHRlcm5hbF9hY2NvdW50X3R5cGUYAiABKAlSE2V4dGVybmFsQWNjb3VudFR5cGUSGAoHaW5zdGFudBgDIAEoCFIHaW5zdGFudA==');
@$core.Deprecated('Use searchDogesRequestDescriptor instead')
const SearchDogesRequest$json = const {
  '1': 'SearchDogesRequest',
  '2': const [
    const {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'limit', '17': true},
  ],
  '8': const [
    const {'1': '_limit'},
  ],
};

/// Descriptor for `SearchDogesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchDogesRequestDescriptor = $convert.base64Decode('ChJTZWFyY2hEb2dlc1JlcXVlc3QSFAoFcXVlcnkYASABKAlSBXF1ZXJ5EhkKBWxpbWl0GAIgASgFSABSBWxpbWl0iAEBQggKBl9saW1pdA==');
@$core.Deprecated('Use activityRequestDescriptor instead')
const ActivityRequest$json = const {
  '1': 'ActivityRequest',
  '2': const [
    const {'1': 'peer', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'peer', '17': true},
    const {'1': 'limit', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'limit', '17': true},
    const {'1': 'activityId', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'activityId', '17': true},
  ],
  '8': const [
    const {'1': '_peer'},
    const {'1': '_limit'},
    const {'1': '_activityId'},
  ],
};

/// Descriptor for `ActivityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activityRequestDescriptor = $convert.base64Decode('Cg9BY3Rpdml0eVJlcXVlc3QSFwoEcGVlchgBIAEoA0gAUgRwZWVyiAEBEhkKBWxpbWl0GAIgASgFSAFSBWxpbWl0iAEBEiMKCmFjdGl2aXR5SWQYAyABKANIAlIKYWN0aXZpdHlJZIgBAUIHCgVfcGVlckIICgZfbGltaXRCDQoLX2FjdGl2aXR5SWQ=');
@$core.Deprecated('Use activityDescriptor instead')
const Activity$json = const {
  '1': 'Activity',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'activity_type', '3': 2, '4': 1, '5': 14, '6': '.proto.Activity.ActivityType', '10': 'activityType'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
    const {'1': 'arrival_date', '3': 4, '4': 1, '5': 3, '9': 0, '10': 'arrivalDate', '17': true},
    const {'1': 'created', '3': 5, '4': 1, '5': 3, '9': 1, '10': 'created', '17': true},
    const {'1': 'external_account', '3': 6, '4': 1, '5': 11, '6': '.proto.ExternalAccount', '9': 2, '10': 'externalAccount', '17': true},
    const {'1': 'note', '3': 7, '4': 1, '5': 9, '9': 3, '10': 'note', '17': true},
    const {'1': 'refunded', '3': 8, '4': 1, '5': 8, '9': 4, '10': 'refunded', '17': true},
    const {'1': 'source_id', '3': 9, '4': 1, '5': 3, '10': 'sourceId'},
    const {'1': 'to_id', '3': 10, '4': 1, '5': 3, '9': 5, '10': 'toId', '17': true},
    const {'1': 'peer', '3': 11, '4': 1, '5': 11, '6': '.proto.BaseDoge', '9': 6, '10': 'peer', '17': true},
    const {'1': 'moneyin', '3': 12, '4': 1, '5': 8, '9': 7, '10': 'moneyin', '17': true},
  ],
  '4': const [Activity_ActivityType$json],
  '8': const [
    const {'1': '_arrival_date'},
    const {'1': '_created'},
    const {'1': '_external_account'},
    const {'1': '_note'},
    const {'1': '_refunded'},
    const {'1': '_to_id'},
    const {'1': '_peer'},
    const {'1': '_moneyin'},
  ],
};

@$core.Deprecated('Use activityDescriptor instead')
const Activity_ActivityType$json = const {
  '1': 'ActivityType',
  '2': const [
    const {'1': 'add_cash', '2': 0},
    const {'1': 'cash_out', '2': 1},
    const {'1': 'pay', '2': 2},
    const {'1': 'request', '2': 3},
  ],
};

/// Descriptor for `Activity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activityDescriptor = $convert.base64Decode('CghBY3Rpdml0eRIOCgJpZBgBIAEoA1ICaWQSQQoNYWN0aXZpdHlfdHlwZRgCIAEoDjIcLnByb3RvLkFjdGl2aXR5LkFjdGl2aXR5VHlwZVIMYWN0aXZpdHlUeXBlEhYKBmFtb3VudBgDIAEoA1IGYW1vdW50EiYKDGFycml2YWxfZGF0ZRgEIAEoA0gAUgthcnJpdmFsRGF0ZYgBARIdCgdjcmVhdGVkGAUgASgDSAFSB2NyZWF0ZWSIAQESRgoQZXh0ZXJuYWxfYWNjb3VudBgGIAEoCzIWLnByb3RvLkV4dGVybmFsQWNjb3VudEgCUg9leHRlcm5hbEFjY291bnSIAQESFwoEbm90ZRgHIAEoCUgDUgRub3RliAEBEh8KCHJlZnVuZGVkGAggASgISARSCHJlZnVuZGVkiAEBEhsKCXNvdXJjZV9pZBgJIAEoA1IIc291cmNlSWQSGAoFdG9faWQYCiABKANIBVIEdG9JZIgBARIoCgRwZWVyGAsgASgLMg8ucHJvdG8uQmFzZURvZ2VIBlIEcGVlcogBARIdCgdtb25leWluGAwgASgISAdSB21vbmV5aW6IAQEiQAoMQWN0aXZpdHlUeXBlEgwKCGFkZF9jYXNoEAASDAoIY2FzaF9vdXQQARIHCgNwYXkQAhILCgdyZXF1ZXN0EANCDwoNX2Fycml2YWxfZGF0ZUIKCghfY3JlYXRlZEITChFfZXh0ZXJuYWxfYWNjb3VudEIHCgVfbm90ZUILCglfcmVmdW5kZWRCCAoGX3RvX2lkQgcKBV9wZWVyQgoKCF9tb25leWlu');
@$core.Deprecated('Use activityRepeatedDescriptor instead')
const ActivityRepeated$json = const {
  '1': 'ActivityRepeated',
  '2': const [
    const {'1': 'activity', '3': 1, '4': 3, '5': 11, '6': '.proto.Activity', '10': 'activity'},
  ],
};

/// Descriptor for `ActivityRepeated`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activityRepeatedDescriptor = $convert.base64Decode('ChBBY3Rpdml0eVJlcGVhdGVkEisKCGFjdGl2aXR5GAEgAygLMg8ucHJvdG8uQWN0aXZpdHlSCGFjdGl2aXR5');
@$core.Deprecated('Use newCardholderRequestDescriptor instead')
const NewCardholderRequest$json = const {
  '1': 'NewCardholderRequest',
  '2': const [
    const {'1': 'line1', '3': 1, '4': 1, '5': 9, '10': 'line1'},
    const {'1': 'city', '3': 2, '4': 1, '5': 9, '10': 'city'},
    const {'1': 'zip', '3': 3, '4': 1, '5': 9, '10': 'zip'},
    const {'1': 'state', '3': 4, '4': 1, '5': 9, '10': 'state'},
    const {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `NewCardholderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newCardholderRequestDescriptor = $convert.base64Decode('ChROZXdDYXJkaG9sZGVyUmVxdWVzdBIUCgVsaW5lMRgBIAEoCVIFbGluZTESEgoEY2l0eRgCIAEoCVIEY2l0eRIQCgN6aXAYAyABKAlSA3ppcBIUCgVzdGF0ZRgEIAEoCVIFc3RhdGUSFAoFcGhvbmUYBSABKAlSBXBob25l');
@$core.Deprecated('Use dogeCardRequestDescriptor instead')
const DogeCardRequest$json = const {
  '1': 'DogeCardRequest',
  '2': const [
    const {'1': 'full', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'full', '17': true},
  ],
  '8': const [
    const {'1': '_full'},
  ],
};

/// Descriptor for `DogeCardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dogeCardRequestDescriptor = $convert.base64Decode('Cg9Eb2dlQ2FyZFJlcXVlc3QSFwoEZnVsbBgBIAEoCEgAUgRmdWxsiAEBQgcKBV9mdWxs');
@$core.Deprecated('Use dogeCardResponseDescriptor instead')
const DogeCardResponse$json = const {
  '1': 'DogeCardResponse',
  '2': const [
    const {'1': 'brand', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'brand', '17': true},
    const {'1': 'exp_month', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'expMonth', '17': true},
    const {'1': 'exp_year', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'expYear', '17': true},
    const {'1': 'last4', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'last4', '17': true},
    const {'1': 'number', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'number', '17': true},
    const {'1': 'cvc', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'cvc', '17': true},
  ],
  '8': const [
    const {'1': '_brand'},
    const {'1': '_exp_month'},
    const {'1': '_exp_year'},
    const {'1': '_last4'},
    const {'1': '_number'},
    const {'1': '_cvc'},
  ],
};

/// Descriptor for `DogeCardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dogeCardResponseDescriptor = $convert.base64Decode('ChBEb2dlQ2FyZFJlc3BvbnNlEhkKBWJyYW5kGAEgASgJSABSBWJyYW5kiAEBEiAKCWV4cF9tb250aBgCIAEoA0gBUghleHBNb250aIgBARIeCghleHBfeWVhchgDIAEoA0gCUgdleHBZZWFyiAEBEhkKBWxhc3Q0GAQgASgJSANSBWxhc3Q0iAEBEhsKBm51bWJlchgFIAEoCUgEUgZudW1iZXKIAQESFQoDY3ZjGAYgASgJSAVSA2N2Y4gBAUIICgZfYnJhbmRCDAoKX2V4cF9tb250aEILCglfZXhwX3llYXJCCAoGX2xhc3Q0QgkKB19udW1iZXJCBgoEX2N2Yw==');
@$core.Deprecated('Use predictionsRequestDescriptor instead')
const PredictionsRequest$json = const {
  '1': 'PredictionsRequest',
  '2': const [
    const {'1': 'input', '3': 1, '4': 1, '5': 9, '10': 'input'},
  ],
};

/// Descriptor for `PredictionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List predictionsRequestDescriptor = $convert.base64Decode('ChJQcmVkaWN0aW9uc1JlcXVlc3QSFAoFaW5wdXQYASABKAlSBWlucHV0');
@$core.Deprecated('Use predictionsResponseDescriptor instead')
const PredictionsResponse$json = const {
  '1': 'PredictionsResponse',
  '2': const [
    const {'1': 'description', '3': 1, '4': 3, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `PredictionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List predictionsResponseDescriptor = $convert.base64Decode('ChNQcmVkaWN0aW9uc1Jlc3BvbnNlEiAKC2Rlc2NyaXB0aW9uGAEgAygJUgtkZXNjcmlwdGlvbg==');
