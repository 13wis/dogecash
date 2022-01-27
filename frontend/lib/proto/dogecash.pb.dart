///
//  Generated code. Do not modify.
//  source: proto/dogecash.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $2;

import 'dogecash.pbenum.dart';

export 'dogecash.pbenum.dart';

class AuthenticationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthenticationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  AuthenticationRequest._() : super();
  factory AuthenticationRequest({
    $core.String? email,
    $core.String? password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory AuthenticationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthenticationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthenticationRequest clone() => AuthenticationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthenticationRequest copyWith(void Function(AuthenticationRequest) updates) => super.copyWith((message) => updates(message as AuthenticationRequest)) as AuthenticationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthenticationRequest create() => AuthenticationRequest._();
  AuthenticationRequest createEmptyInstance() => create();
  static $pb.PbList<AuthenticationRequest> createRepeated() => $pb.PbList<AuthenticationRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthenticationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthenticationRequest>(create);
  static AuthenticationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class BaseDoge extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BaseDoge', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dogetag')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profilePicUrl')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'interactionType')
    ..hasRequiredFields = false
  ;

  BaseDoge._() : super();
  factory BaseDoge({
    $fixnum.Int64? id,
    $core.String? dogetag,
    $core.String? email,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? profilePicUrl,
    $core.String? interactionType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (dogetag != null) {
      _result.dogetag = dogetag;
    }
    if (email != null) {
      _result.email = email;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (profilePicUrl != null) {
      _result.profilePicUrl = profilePicUrl;
    }
    if (interactionType != null) {
      _result.interactionType = interactionType;
    }
    return _result;
  }
  factory BaseDoge.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BaseDoge.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BaseDoge clone() => BaseDoge()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BaseDoge copyWith(void Function(BaseDoge) updates) => super.copyWith((message) => updates(message as BaseDoge)) as BaseDoge; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BaseDoge create() => BaseDoge._();
  BaseDoge createEmptyInstance() => create();
  static $pb.PbList<BaseDoge> createRepeated() => $pb.PbList<BaseDoge>();
  @$core.pragma('dart2js:noInline')
  static BaseDoge getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseDoge>(create);
  static BaseDoge? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get dogetag => $_getSZ(1);
  @$pb.TagNumber(2)
  set dogetag($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDogetag() => $_has(1);
  @$pb.TagNumber(2)
  void clearDogetag() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get profilePicUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set profilePicUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasProfilePicUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearProfilePicUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get interactionType => $_getSZ(6);
  @$pb.TagNumber(7)
  set interactionType($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInteractionType() => $_has(6);
  @$pb.TagNumber(7)
  void clearInteractionType() => clearField(7);
}

class ViewerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ViewerResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<BaseDoge>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'doge', subBuilder: BaseDoge.create)
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dob')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalAccountLinked')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stripeAccountCreated')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  ViewerResponse._() : super();
  factory ViewerResponse({
    BaseDoge? doge,
    $2.Timestamp? createdAt,
    $core.String? dob,
    $core.bool? externalAccountLinked,
    $core.bool? stripeAccountCreated,
    $core.String? token,
  }) {
    final _result = create();
    if (doge != null) {
      _result.doge = doge;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (dob != null) {
      _result.dob = dob;
    }
    if (externalAccountLinked != null) {
      _result.externalAccountLinked = externalAccountLinked;
    }
    if (stripeAccountCreated != null) {
      _result.stripeAccountCreated = stripeAccountCreated;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory ViewerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ViewerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ViewerResponse clone() => ViewerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ViewerResponse copyWith(void Function(ViewerResponse) updates) => super.copyWith((message) => updates(message as ViewerResponse)) as ViewerResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ViewerResponse create() => ViewerResponse._();
  ViewerResponse createEmptyInstance() => create();
  static $pb.PbList<ViewerResponse> createRepeated() => $pb.PbList<ViewerResponse>();
  @$core.pragma('dart2js:noInline')
  static ViewerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ViewerResponse>(create);
  static ViewerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  BaseDoge get doge => $_getN(0);
  @$pb.TagNumber(1)
  set doge(BaseDoge v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDoge() => $_has(0);
  @$pb.TagNumber(1)
  void clearDoge() => clearField(1);
  @$pb.TagNumber(1)
  BaseDoge ensureDoge() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureCreatedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get dob => $_getSZ(2);
  @$pb.TagNumber(3)
  set dob($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDob() => $_has(2);
  @$pb.TagNumber(3)
  void clearDob() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get externalAccountLinked => $_getBF(3);
  @$pb.TagNumber(4)
  set externalAccountLinked($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExternalAccountLinked() => $_has(3);
  @$pb.TagNumber(4)
  void clearExternalAccountLinked() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get stripeAccountCreated => $_getBF(4);
  @$pb.TagNumber(5)
  set stripeAccountCreated($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStripeAccountCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearStripeAccountCreated() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get token => $_getSZ(5);
  @$pb.TagNumber(6)
  set token($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasToken() => $_has(5);
  @$pb.TagNumber(6)
  void clearToken() => clearField(6);
}

class DogetagAvailableRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DogetagAvailableRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dogetag')
    ..hasRequiredFields = false
  ;

  DogetagAvailableRequest._() : super();
  factory DogetagAvailableRequest({
    $core.String? dogetag,
  }) {
    final _result = create();
    if (dogetag != null) {
      _result.dogetag = dogetag;
    }
    return _result;
  }
  factory DogetagAvailableRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DogetagAvailableRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DogetagAvailableRequest clone() => DogetagAvailableRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DogetagAvailableRequest copyWith(void Function(DogetagAvailableRequest) updates) => super.copyWith((message) => updates(message as DogetagAvailableRequest)) as DogetagAvailableRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DogetagAvailableRequest create() => DogetagAvailableRequest._();
  DogetagAvailableRequest createEmptyInstance() => create();
  static $pb.PbList<DogetagAvailableRequest> createRepeated() => $pb.PbList<DogetagAvailableRequest>();
  @$core.pragma('dart2js:noInline')
  static DogetagAvailableRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DogetagAvailableRequest>(create);
  static DogetagAvailableRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dogetag => $_getSZ(0);
  @$pb.TagNumber(1)
  set dogetag($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDogetag() => $_has(0);
  @$pb.TagNumber(1)
  void clearDogetag() => clearField(1);
}

class DogetagAvaiableResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DogetagAvaiableResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'available')
    ..hasRequiredFields = false
  ;

  DogetagAvaiableResponse._() : super();
  factory DogetagAvaiableResponse({
    $core.bool? available,
  }) {
    final _result = create();
    if (available != null) {
      _result.available = available;
    }
    return _result;
  }
  factory DogetagAvaiableResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DogetagAvaiableResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DogetagAvaiableResponse clone() => DogetagAvaiableResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DogetagAvaiableResponse copyWith(void Function(DogetagAvaiableResponse) updates) => super.copyWith((message) => updates(message as DogetagAvaiableResponse)) as DogetagAvaiableResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DogetagAvaiableResponse create() => DogetagAvaiableResponse._();
  DogetagAvaiableResponse createEmptyInstance() => create();
  static $pb.PbList<DogetagAvaiableResponse> createRepeated() => $pb.PbList<DogetagAvaiableResponse>();
  @$core.pragma('dart2js:noInline')
  static DogetagAvaiableResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DogetagAvaiableResponse>(create);
  static DogetagAvaiableResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get available => $_getBF(0);
  @$pb.TagNumber(1)
  set available($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAvailable() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvailable() => clearField(1);
}

class UpdateDogetagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateDogetagRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dogetag')
    ..hasRequiredFields = false
  ;

  UpdateDogetagRequest._() : super();
  factory UpdateDogetagRequest({
    $core.String? dogetag,
  }) {
    final _result = create();
    if (dogetag != null) {
      _result.dogetag = dogetag;
    }
    return _result;
  }
  factory UpdateDogetagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDogetagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDogetagRequest clone() => UpdateDogetagRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDogetagRequest copyWith(void Function(UpdateDogetagRequest) updates) => super.copyWith((message) => updates(message as UpdateDogetagRequest)) as UpdateDogetagRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateDogetagRequest create() => UpdateDogetagRequest._();
  UpdateDogetagRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDogetagRequest> createRepeated() => $pb.PbList<UpdateDogetagRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDogetagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDogetagRequest>(create);
  static UpdateDogetagRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dogetag => $_getSZ(0);
  @$pb.TagNumber(1)
  set dogetag($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDogetag() => $_has(0);
  @$pb.TagNumber(1)
  void clearDogetag() => clearField(1);
}

class UpdateStripeInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateStripeInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'day')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'month')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'year')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'create')
    ..hasRequiredFields = false
  ;

  UpdateStripeInfoRequest._() : super();
  factory UpdateStripeInfoRequest({
    $fixnum.Int64? day,
    $fixnum.Int64? month,
    $fixnum.Int64? year,
    $core.String? firstName,
    $core.String? lastName,
    $core.bool? create_6,
  }) {
    final _result = create();
    if (day != null) {
      _result.day = day;
    }
    if (month != null) {
      _result.month = month;
    }
    if (year != null) {
      _result.year = year;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (create_6 != null) {
      _result.create_6 = create_6;
    }
    return _result;
  }
  factory UpdateStripeInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateStripeInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateStripeInfoRequest clone() => UpdateStripeInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateStripeInfoRequest copyWith(void Function(UpdateStripeInfoRequest) updates) => super.copyWith((message) => updates(message as UpdateStripeInfoRequest)) as UpdateStripeInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateStripeInfoRequest create() => UpdateStripeInfoRequest._();
  UpdateStripeInfoRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStripeInfoRequest> createRepeated() => $pb.PbList<UpdateStripeInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStripeInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateStripeInfoRequest>(create);
  static UpdateStripeInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get day => $_getI64(0);
  @$pb.TagNumber(1)
  set day($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDay() => $_has(0);
  @$pb.TagNumber(1)
  void clearDay() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get month => $_getI64(1);
  @$pb.TagNumber(2)
  set month($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonth() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get year => $_getI64(2);
  @$pb.TagNumber(3)
  set year($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasYear() => $_has(2);
  @$pb.TagNumber(3)
  void clearYear() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastName() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get create_6 => $_getBF(5);
  @$pb.TagNumber(6)
  set create_6($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreate_6() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreate_6() => clearField(6);
}

class UpdateExternalAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateExternalAccountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..e<UpdateExternalAccountRequest_ExternalAccountType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalAccountType', $pb.PbFieldType.OE, defaultOrMaker: UpdateExternalAccountRequest_ExternalAccountType.bank_account, valueOf: UpdateExternalAccountRequest_ExternalAccountType.valueOf, enumValues: UpdateExternalAccountRequest_ExternalAccountType.values)
    ..hasRequiredFields = false
  ;

  UpdateExternalAccountRequest._() : super();
  factory UpdateExternalAccountRequest({
    $core.String? token,
    UpdateExternalAccountRequest_ExternalAccountType? externalAccountType,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    if (externalAccountType != null) {
      _result.externalAccountType = externalAccountType;
    }
    return _result;
  }
  factory UpdateExternalAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateExternalAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateExternalAccountRequest clone() => UpdateExternalAccountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateExternalAccountRequest copyWith(void Function(UpdateExternalAccountRequest) updates) => super.copyWith((message) => updates(message as UpdateExternalAccountRequest)) as UpdateExternalAccountRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateExternalAccountRequest create() => UpdateExternalAccountRequest._();
  UpdateExternalAccountRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateExternalAccountRequest> createRepeated() => $pb.PbList<UpdateExternalAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateExternalAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateExternalAccountRequest>(create);
  static UpdateExternalAccountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  UpdateExternalAccountRequest_ExternalAccountType get externalAccountType => $_getN(1);
  @$pb.TagNumber(2)
  set externalAccountType(UpdateExternalAccountRequest_ExternalAccountType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExternalAccountType() => $_has(1);
  @$pb.TagNumber(2)
  void clearExternalAccountType() => clearField(2);
}

class ForgotPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForgotPasswordRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  ForgotPasswordRequest._() : super();
  factory ForgotPasswordRequest({
    $core.String? email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory ForgotPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForgotPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForgotPasswordRequest clone() => ForgotPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForgotPasswordRequest copyWith(void Function(ForgotPasswordRequest) updates) => super.copyWith((message) => updates(message as ForgotPasswordRequest)) as ForgotPasswordRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordRequest create() => ForgotPasswordRequest._();
  ForgotPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ForgotPasswordRequest> createRepeated() => $pb.PbList<ForgotPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForgotPasswordRequest>(create);
  static ForgotPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class VerifyCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyCodeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..hasRequiredFields = false
  ;

  VerifyCodeRequest._() : super();
  factory VerifyCodeRequest({
    $core.String? email,
    $core.String? code,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory VerifyCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyCodeRequest clone() => VerifyCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyCodeRequest copyWith(void Function(VerifyCodeRequest) updates) => super.copyWith((message) => updates(message as VerifyCodeRequest)) as VerifyCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyCodeRequest create() => VerifyCodeRequest._();
  VerifyCodeRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyCodeRequest> createRepeated() => $pb.PbList<VerifyCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyCodeRequest>(create);
  static VerifyCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class ResetPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResetPasswordRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  ResetPasswordRequest._() : super();
  factory ResetPasswordRequest({
    $core.String? email,
    $core.String? code,
    $core.String? password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (code != null) {
      _result.code = code;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory ResetPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest clone() => ResetPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest copyWith(void Function(ResetPasswordRequest) updates) => super.copyWith((message) => updates(message as ResetPasswordRequest)) as ResetPasswordRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest create() => ResetPasswordRequest._();
  ResetPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordRequest> createRepeated() => $pb.PbList<ResetPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordRequest>(create);
  static ResetPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class MyDogesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MyDogesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..pc<BaseDoge>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'doges', $pb.PbFieldType.PM, subBuilder: BaseDoge.create)
    ..hasRequiredFields = false
  ;

  MyDogesResponse._() : super();
  factory MyDogesResponse({
    $core.Iterable<BaseDoge>? doges,
  }) {
    final _result = create();
    if (doges != null) {
      _result.doges.addAll(doges);
    }
    return _result;
  }
  factory MyDogesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MyDogesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MyDogesResponse clone() => MyDogesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MyDogesResponse copyWith(void Function(MyDogesResponse) updates) => super.copyWith((message) => updates(message as MyDogesResponse)) as MyDogesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyDogesResponse create() => MyDogesResponse._();
  MyDogesResponse createEmptyInstance() => create();
  static $pb.PbList<MyDogesResponse> createRepeated() => $pb.PbList<MyDogesResponse>();
  @$core.pragma('dart2js:noInline')
  static MyDogesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MyDogesResponse>(create);
  static MyDogesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BaseDoge> get doges => $_getList(0);
}

class BalanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BalanceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'balance')
    ..hasRequiredFields = false
  ;

  BalanceResponse._() : super();
  factory BalanceResponse({
    $fixnum.Int64? balance,
  }) {
    final _result = create();
    if (balance != null) {
      _result.balance = balance;
    }
    return _result;
  }
  factory BalanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BalanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BalanceResponse clone() => BalanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BalanceResponse copyWith(void Function(BalanceResponse) updates) => super.copyWith((message) => updates(message as BalanceResponse)) as BalanceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BalanceResponse create() => BalanceResponse._();
  BalanceResponse createEmptyInstance() => create();
  static $pb.PbList<BalanceResponse> createRepeated() => $pb.PbList<BalanceResponse>();
  @$core.pragma('dart2js:noInline')
  static BalanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BalanceResponse>(create);
  static BalanceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => clearField(1);
}

class ExternalAccount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExternalAccount', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalAccountType')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bankName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brand')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'last4')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expMonth')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expYear')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'eligible')
    ..hasRequiredFields = false
  ;

  ExternalAccount._() : super();
  factory ExternalAccount({
    $core.String? externalAccountType,
    $core.String? bankName,
    $core.String? brand,
    $core.String? last4,
    $fixnum.Int64? expMonth,
    $fixnum.Int64? expYear,
    $core.bool? eligible,
  }) {
    final _result = create();
    if (externalAccountType != null) {
      _result.externalAccountType = externalAccountType;
    }
    if (bankName != null) {
      _result.bankName = bankName;
    }
    if (brand != null) {
      _result.brand = brand;
    }
    if (last4 != null) {
      _result.last4 = last4;
    }
    if (expMonth != null) {
      _result.expMonth = expMonth;
    }
    if (expYear != null) {
      _result.expYear = expYear;
    }
    if (eligible != null) {
      _result.eligible = eligible;
    }
    return _result;
  }
  factory ExternalAccount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExternalAccount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExternalAccount clone() => ExternalAccount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExternalAccount copyWith(void Function(ExternalAccount) updates) => super.copyWith((message) => updates(message as ExternalAccount)) as ExternalAccount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExternalAccount create() => ExternalAccount._();
  ExternalAccount createEmptyInstance() => create();
  static $pb.PbList<ExternalAccount> createRepeated() => $pb.PbList<ExternalAccount>();
  @$core.pragma('dart2js:noInline')
  static ExternalAccount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExternalAccount>(create);
  static ExternalAccount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get externalAccountType => $_getSZ(0);
  @$pb.TagNumber(1)
  set externalAccountType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExternalAccountType() => $_has(0);
  @$pb.TagNumber(1)
  void clearExternalAccountType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bankName => $_getSZ(1);
  @$pb.TagNumber(2)
  set bankName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBankName() => $_has(1);
  @$pb.TagNumber(2)
  void clearBankName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get brand => $_getSZ(2);
  @$pb.TagNumber(3)
  set brand($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBrand() => $_has(2);
  @$pb.TagNumber(3)
  void clearBrand() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get last4 => $_getSZ(3);
  @$pb.TagNumber(4)
  set last4($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLast4() => $_has(3);
  @$pb.TagNumber(4)
  void clearLast4() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expMonth => $_getI64(4);
  @$pb.TagNumber(5)
  set expMonth($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpMonth() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpMonth() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get expYear => $_getI64(5);
  @$pb.TagNumber(6)
  set expYear($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpYear() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpYear() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get eligible => $_getBF(6);
  @$pb.TagNumber(7)
  set eligible($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEligible() => $_has(6);
  @$pb.TagNumber(7)
  void clearEligible() => clearField(7);
}

class ExternalAccountsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExternalAccountsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..pc<ExternalAccount>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalAccount', $pb.PbFieldType.PM, subBuilder: ExternalAccount.create)
    ..hasRequiredFields = false
  ;

  ExternalAccountsResponse._() : super();
  factory ExternalAccountsResponse({
    $core.Iterable<ExternalAccount>? externalAccount,
  }) {
    final _result = create();
    if (externalAccount != null) {
      _result.externalAccount.addAll(externalAccount);
    }
    return _result;
  }
  factory ExternalAccountsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExternalAccountsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExternalAccountsResponse clone() => ExternalAccountsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExternalAccountsResponse copyWith(void Function(ExternalAccountsResponse) updates) => super.copyWith((message) => updates(message as ExternalAccountsResponse)) as ExternalAccountsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExternalAccountsResponse create() => ExternalAccountsResponse._();
  ExternalAccountsResponse createEmptyInstance() => create();
  static $pb.PbList<ExternalAccountsResponse> createRepeated() => $pb.PbList<ExternalAccountsResponse>();
  @$core.pragma('dart2js:noInline')
  static ExternalAccountsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExternalAccountsResponse>(create);
  static ExternalAccountsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ExternalAccount> get externalAccount => $_getList(0);
}

class SearchDogesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchDogesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..pc<BaseDoge>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'doge', $pb.PbFieldType.PM, subBuilder: BaseDoge.create)
    ..hasRequiredFields = false
  ;

  SearchDogesResponse._() : super();
  factory SearchDogesResponse({
    $core.Iterable<BaseDoge>? doge,
  }) {
    final _result = create();
    if (doge != null) {
      _result.doge.addAll(doge);
    }
    return _result;
  }
  factory SearchDogesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchDogesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchDogesResponse clone() => SearchDogesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchDogesResponse copyWith(void Function(SearchDogesResponse) updates) => super.copyWith((message) => updates(message as SearchDogesResponse)) as SearchDogesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchDogesResponse create() => SearchDogesResponse._();
  SearchDogesResponse createEmptyInstance() => create();
  static $pb.PbList<SearchDogesResponse> createRepeated() => $pb.PbList<SearchDogesResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchDogesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchDogesResponse>(create);
  static SearchDogesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BaseDoge> get doge => $_getList(0);
}

class PayRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PayRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestId', protoName: 'requestId')
    ..e<PayRequest_SourceType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sourceType', $pb.PbFieldType.OE, defaultOrMaker: PayRequest_SourceType.account, valueOf: PayRequest_SourceType.valueOf, enumValues: PayRequest_SourceType.values)
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..hasRequiredFields = false
  ;

  PayRequest._() : super();
  factory PayRequest({
    $fixnum.Int64? amount,
    $core.String? note,
    $fixnum.Int64? requestId,
    PayRequest_SourceType? sourceType,
    $fixnum.Int64? to,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    if (note != null) {
      _result.note = note;
    }
    if (requestId != null) {
      _result.requestId = requestId;
    }
    if (sourceType != null) {
      _result.sourceType = sourceType;
    }
    if (to != null) {
      _result.to = to;
    }
    return _result;
  }
  factory PayRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayRequest clone() => PayRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayRequest copyWith(void Function(PayRequest) updates) => super.copyWith((message) => updates(message as PayRequest)) as PayRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayRequest create() => PayRequest._();
  PayRequest createEmptyInstance() => create();
  static $pb.PbList<PayRequest> createRepeated() => $pb.PbList<PayRequest>();
  @$core.pragma('dart2js:noInline')
  static PayRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayRequest>(create);
  static PayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get note => $_getSZ(1);
  @$pb.TagNumber(2)
  set note($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearNote() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get requestId => $_getI64(2);
  @$pb.TagNumber(3)
  set requestId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRequestId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestId() => clearField(3);

  @$pb.TagNumber(4)
  PayRequest_SourceType get sourceType => $_getN(3);
  @$pb.TagNumber(4)
  set sourceType(PayRequest_SourceType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSourceType() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get to => $_getI64(4);
  @$pb.TagNumber(5)
  set to($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => clearField(5);
}

class SendRequestRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendRequestRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..hasRequiredFields = false
  ;

  SendRequestRequest._() : super();
  factory SendRequestRequest({
    $fixnum.Int64? amount,
    $core.String? note,
    $fixnum.Int64? to,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    if (note != null) {
      _result.note = note;
    }
    if (to != null) {
      _result.to = to;
    }
    return _result;
  }
  factory SendRequestRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendRequestRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendRequestRequest clone() => SendRequestRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendRequestRequest copyWith(void Function(SendRequestRequest) updates) => super.copyWith((message) => updates(message as SendRequestRequest)) as SendRequestRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendRequestRequest create() => SendRequestRequest._();
  SendRequestRequest createEmptyInstance() => create();
  static $pb.PbList<SendRequestRequest> createRepeated() => $pb.PbList<SendRequestRequest>();
  @$core.pragma('dart2js:noInline')
  static SendRequestRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendRequestRequest>(create);
  static SendRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get note => $_getSZ(1);
  @$pb.TagNumber(2)
  set note($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearNote() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get to => $_getI64(2);
  @$pb.TagNumber(3)
  set to($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);
}

class AddCashRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddCashRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalAccountType')
    ..hasRequiredFields = false
  ;

  AddCashRequest._() : super();
  factory AddCashRequest({
    $fixnum.Int64? amount,
    $core.String? externalAccountType,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    if (externalAccountType != null) {
      _result.externalAccountType = externalAccountType;
    }
    return _result;
  }
  factory AddCashRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCashRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCashRequest clone() => AddCashRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCashRequest copyWith(void Function(AddCashRequest) updates) => super.copyWith((message) => updates(message as AddCashRequest)) as AddCashRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddCashRequest create() => AddCashRequest._();
  AddCashRequest createEmptyInstance() => create();
  static $pb.PbList<AddCashRequest> createRepeated() => $pb.PbList<AddCashRequest>();
  @$core.pragma('dart2js:noInline')
  static AddCashRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCashRequest>(create);
  static AddCashRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get externalAccountType => $_getSZ(1);
  @$pb.TagNumber(2)
  set externalAccountType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExternalAccountType() => $_has(1);
  @$pb.TagNumber(2)
  void clearExternalAccountType() => clearField(2);
}

class CashOutRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CashOutRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalAccountType')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'instant')
    ..hasRequiredFields = false
  ;

  CashOutRequest._() : super();
  factory CashOutRequest({
    $fixnum.Int64? amount,
    $core.String? externalAccountType,
    $core.bool? instant,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    if (externalAccountType != null) {
      _result.externalAccountType = externalAccountType;
    }
    if (instant != null) {
      _result.instant = instant;
    }
    return _result;
  }
  factory CashOutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CashOutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CashOutRequest clone() => CashOutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CashOutRequest copyWith(void Function(CashOutRequest) updates) => super.copyWith((message) => updates(message as CashOutRequest)) as CashOutRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CashOutRequest create() => CashOutRequest._();
  CashOutRequest createEmptyInstance() => create();
  static $pb.PbList<CashOutRequest> createRepeated() => $pb.PbList<CashOutRequest>();
  @$core.pragma('dart2js:noInline')
  static CashOutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CashOutRequest>(create);
  static CashOutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get externalAccountType => $_getSZ(1);
  @$pb.TagNumber(2)
  set externalAccountType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExternalAccountType() => $_has(1);
  @$pb.TagNumber(2)
  void clearExternalAccountType() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get instant => $_getBF(2);
  @$pb.TagNumber(3)
  set instant($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInstant() => $_has(2);
  @$pb.TagNumber(3)
  void clearInstant() => clearField(3);
}

class SearchDogesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SearchDogesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  SearchDogesRequest._() : super();
  factory SearchDogesRequest({
    $core.String? query,
    $core.int? limit,
  }) {
    final _result = create();
    if (query != null) {
      _result.query = query;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    return _result;
  }
  factory SearchDogesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchDogesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchDogesRequest clone() => SearchDogesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchDogesRequest copyWith(void Function(SearchDogesRequest) updates) => super.copyWith((message) => updates(message as SearchDogesRequest)) as SearchDogesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SearchDogesRequest create() => SearchDogesRequest._();
  SearchDogesRequest createEmptyInstance() => create();
  static $pb.PbList<SearchDogesRequest> createRepeated() => $pb.PbList<SearchDogesRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchDogesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchDogesRequest>(create);
  static SearchDogesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class ActivityRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ActivityRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'peer')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activityId', protoName: 'activityId')
    ..hasRequiredFields = false
  ;

  ActivityRequest._() : super();
  factory ActivityRequest({
    $fixnum.Int64? peer,
    $core.int? limit,
    $fixnum.Int64? activityId,
  }) {
    final _result = create();
    if (peer != null) {
      _result.peer = peer;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (activityId != null) {
      _result.activityId = activityId;
    }
    return _result;
  }
  factory ActivityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActivityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActivityRequest clone() => ActivityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActivityRequest copyWith(void Function(ActivityRequest) updates) => super.copyWith((message) => updates(message as ActivityRequest)) as ActivityRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActivityRequest create() => ActivityRequest._();
  ActivityRequest createEmptyInstance() => create();
  static $pb.PbList<ActivityRequest> createRepeated() => $pb.PbList<ActivityRequest>();
  @$core.pragma('dart2js:noInline')
  static ActivityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActivityRequest>(create);
  static ActivityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get peer => $_getI64(0);
  @$pb.TagNumber(1)
  set peer($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeer() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeer() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get activityId => $_getI64(2);
  @$pb.TagNumber(3)
  set activityId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasActivityId() => $_has(2);
  @$pb.TagNumber(3)
  void clearActivityId() => clearField(3);
}

class Activity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Activity', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Activity_ActivityType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activityType', $pb.PbFieldType.OE, defaultOrMaker: Activity_ActivityType.add_cash, valueOf: Activity_ActivityType.valueOf, enumValues: Activity_ActivityType.values)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'arrivalDate')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'created')
    ..aOM<ExternalAccount>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'externalAccount', subBuilder: ExternalAccount.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refunded')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sourceId')
    ..aInt64(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toId')
    ..aOM<BaseDoge>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'peer', subBuilder: BaseDoge.create)
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'moneyin')
    ..hasRequiredFields = false
  ;

  Activity._() : super();
  factory Activity({
    $fixnum.Int64? id,
    Activity_ActivityType? activityType,
    $fixnum.Int64? amount,
    $fixnum.Int64? arrivalDate,
    $fixnum.Int64? created,
    ExternalAccount? externalAccount,
    $core.String? note,
    $core.bool? refunded,
    $fixnum.Int64? sourceId,
    $fixnum.Int64? toId,
    BaseDoge? peer,
    $core.bool? moneyin,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (activityType != null) {
      _result.activityType = activityType;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (arrivalDate != null) {
      _result.arrivalDate = arrivalDate;
    }
    if (created != null) {
      _result.created = created;
    }
    if (externalAccount != null) {
      _result.externalAccount = externalAccount;
    }
    if (note != null) {
      _result.note = note;
    }
    if (refunded != null) {
      _result.refunded = refunded;
    }
    if (sourceId != null) {
      _result.sourceId = sourceId;
    }
    if (toId != null) {
      _result.toId = toId;
    }
    if (peer != null) {
      _result.peer = peer;
    }
    if (moneyin != null) {
      _result.moneyin = moneyin;
    }
    return _result;
  }
  factory Activity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Activity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Activity clone() => Activity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Activity copyWith(void Function(Activity) updates) => super.copyWith((message) => updates(message as Activity)) as Activity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Activity create() => Activity._();
  Activity createEmptyInstance() => create();
  static $pb.PbList<Activity> createRepeated() => $pb.PbList<Activity>();
  @$core.pragma('dart2js:noInline')
  static Activity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Activity>(create);
  static Activity? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Activity_ActivityType get activityType => $_getN(1);
  @$pb.TagNumber(2)
  set activityType(Activity_ActivityType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasActivityType() => $_has(1);
  @$pb.TagNumber(2)
  void clearActivityType() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get arrivalDate => $_getI64(3);
  @$pb.TagNumber(4)
  set arrivalDate($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasArrivalDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearArrivalDate() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get created => $_getI64(4);
  @$pb.TagNumber(5)
  set created($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreated() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreated() => clearField(5);

  @$pb.TagNumber(6)
  ExternalAccount get externalAccount => $_getN(5);
  @$pb.TagNumber(6)
  set externalAccount(ExternalAccount v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasExternalAccount() => $_has(5);
  @$pb.TagNumber(6)
  void clearExternalAccount() => clearField(6);
  @$pb.TagNumber(6)
  ExternalAccount ensureExternalAccount() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get note => $_getSZ(6);
  @$pb.TagNumber(7)
  set note($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNote() => $_has(6);
  @$pb.TagNumber(7)
  void clearNote() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get refunded => $_getBF(7);
  @$pb.TagNumber(8)
  set refunded($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRefunded() => $_has(7);
  @$pb.TagNumber(8)
  void clearRefunded() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get sourceId => $_getI64(8);
  @$pb.TagNumber(9)
  set sourceId($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSourceId() => $_has(8);
  @$pb.TagNumber(9)
  void clearSourceId() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get toId => $_getI64(9);
  @$pb.TagNumber(10)
  set toId($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasToId() => $_has(9);
  @$pb.TagNumber(10)
  void clearToId() => clearField(10);

  @$pb.TagNumber(11)
  BaseDoge get peer => $_getN(10);
  @$pb.TagNumber(11)
  set peer(BaseDoge v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasPeer() => $_has(10);
  @$pb.TagNumber(11)
  void clearPeer() => clearField(11);
  @$pb.TagNumber(11)
  BaseDoge ensurePeer() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.bool get moneyin => $_getBF(11);
  @$pb.TagNumber(12)
  set moneyin($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasMoneyin() => $_has(11);
  @$pb.TagNumber(12)
  void clearMoneyin() => clearField(12);
}

class ActivityRepeated extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ActivityRepeated', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..pc<Activity>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activity', $pb.PbFieldType.PM, subBuilder: Activity.create)
    ..hasRequiredFields = false
  ;

  ActivityRepeated._() : super();
  factory ActivityRepeated({
    $core.Iterable<Activity>? activity,
  }) {
    final _result = create();
    if (activity != null) {
      _result.activity.addAll(activity);
    }
    return _result;
  }
  factory ActivityRepeated.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActivityRepeated.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActivityRepeated clone() => ActivityRepeated()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActivityRepeated copyWith(void Function(ActivityRepeated) updates) => super.copyWith((message) => updates(message as ActivityRepeated)) as ActivityRepeated; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActivityRepeated create() => ActivityRepeated._();
  ActivityRepeated createEmptyInstance() => create();
  static $pb.PbList<ActivityRepeated> createRepeated() => $pb.PbList<ActivityRepeated>();
  @$core.pragma('dart2js:noInline')
  static ActivityRepeated getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActivityRepeated>(create);
  static ActivityRepeated? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Activity> get activity => $_getList(0);
}

class NewCardholderRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewCardholderRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'line1')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'city')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'zip')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phone')
    ..hasRequiredFields = false
  ;

  NewCardholderRequest._() : super();
  factory NewCardholderRequest({
    $core.String? line1,
    $core.String? city,
    $core.String? zip,
    $core.String? state,
    $core.String? phone,
  }) {
    final _result = create();
    if (line1 != null) {
      _result.line1 = line1;
    }
    if (city != null) {
      _result.city = city;
    }
    if (zip != null) {
      _result.zip = zip;
    }
    if (state != null) {
      _result.state = state;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    return _result;
  }
  factory NewCardholderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewCardholderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewCardholderRequest clone() => NewCardholderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewCardholderRequest copyWith(void Function(NewCardholderRequest) updates) => super.copyWith((message) => updates(message as NewCardholderRequest)) as NewCardholderRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewCardholderRequest create() => NewCardholderRequest._();
  NewCardholderRequest createEmptyInstance() => create();
  static $pb.PbList<NewCardholderRequest> createRepeated() => $pb.PbList<NewCardholderRequest>();
  @$core.pragma('dart2js:noInline')
  static NewCardholderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewCardholderRequest>(create);
  static NewCardholderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get line1 => $_getSZ(0);
  @$pb.TagNumber(1)
  set line1($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLine1() => $_has(0);
  @$pb.TagNumber(1)
  void clearLine1() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get city => $_getSZ(1);
  @$pb.TagNumber(2)
  set city($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCity() => $_has(1);
  @$pb.TagNumber(2)
  void clearCity() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get zip => $_getSZ(2);
  @$pb.TagNumber(3)
  set zip($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZip() => $_has(2);
  @$pb.TagNumber(3)
  void clearZip() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phone => $_getSZ(4);
  @$pb.TagNumber(5)
  set phone($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => clearField(5);
}

class DogeCardRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DogeCardRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'full')
    ..hasRequiredFields = false
  ;

  DogeCardRequest._() : super();
  factory DogeCardRequest({
    $core.bool? full,
  }) {
    final _result = create();
    if (full != null) {
      _result.full = full;
    }
    return _result;
  }
  factory DogeCardRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DogeCardRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DogeCardRequest clone() => DogeCardRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DogeCardRequest copyWith(void Function(DogeCardRequest) updates) => super.copyWith((message) => updates(message as DogeCardRequest)) as DogeCardRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DogeCardRequest create() => DogeCardRequest._();
  DogeCardRequest createEmptyInstance() => create();
  static $pb.PbList<DogeCardRequest> createRepeated() => $pb.PbList<DogeCardRequest>();
  @$core.pragma('dart2js:noInline')
  static DogeCardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DogeCardRequest>(create);
  static DogeCardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get full => $_getBF(0);
  @$pb.TagNumber(1)
  set full($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFull() => $_has(0);
  @$pb.TagNumber(1)
  void clearFull() => clearField(1);
}

class DogeCardResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DogeCardResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brand')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expMonth')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expYear')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'last4')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cvc')
    ..hasRequiredFields = false
  ;

  DogeCardResponse._() : super();
  factory DogeCardResponse({
    $core.String? brand,
    $fixnum.Int64? expMonth,
    $fixnum.Int64? expYear,
    $core.String? last4,
    $core.String? number,
    $core.String? cvc,
  }) {
    final _result = create();
    if (brand != null) {
      _result.brand = brand;
    }
    if (expMonth != null) {
      _result.expMonth = expMonth;
    }
    if (expYear != null) {
      _result.expYear = expYear;
    }
    if (last4 != null) {
      _result.last4 = last4;
    }
    if (number != null) {
      _result.number = number;
    }
    if (cvc != null) {
      _result.cvc = cvc;
    }
    return _result;
  }
  factory DogeCardResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DogeCardResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DogeCardResponse clone() => DogeCardResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DogeCardResponse copyWith(void Function(DogeCardResponse) updates) => super.copyWith((message) => updates(message as DogeCardResponse)) as DogeCardResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DogeCardResponse create() => DogeCardResponse._();
  DogeCardResponse createEmptyInstance() => create();
  static $pb.PbList<DogeCardResponse> createRepeated() => $pb.PbList<DogeCardResponse>();
  @$core.pragma('dart2js:noInline')
  static DogeCardResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DogeCardResponse>(create);
  static DogeCardResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get brand => $_getSZ(0);
  @$pb.TagNumber(1)
  set brand($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBrand() => $_has(0);
  @$pb.TagNumber(1)
  void clearBrand() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get expMonth => $_getI64(1);
  @$pb.TagNumber(2)
  set expMonth($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpMonth() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expYear => $_getI64(2);
  @$pb.TagNumber(3)
  set expYear($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpYear() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpYear() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get last4 => $_getSZ(3);
  @$pb.TagNumber(4)
  set last4($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLast4() => $_has(3);
  @$pb.TagNumber(4)
  void clearLast4() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get number => $_getSZ(4);
  @$pb.TagNumber(5)
  set number($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get cvc => $_getSZ(5);
  @$pb.TagNumber(6)
  set cvc($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCvc() => $_has(5);
  @$pb.TagNumber(6)
  void clearCvc() => clearField(6);
}

class PredictionsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PredictionsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'input')
    ..hasRequiredFields = false
  ;

  PredictionsRequest._() : super();
  factory PredictionsRequest({
    $core.String? input,
  }) {
    final _result = create();
    if (input != null) {
      _result.input = input;
    }
    return _result;
  }
  factory PredictionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PredictionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PredictionsRequest clone() => PredictionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PredictionsRequest copyWith(void Function(PredictionsRequest) updates) => super.copyWith((message) => updates(message as PredictionsRequest)) as PredictionsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PredictionsRequest create() => PredictionsRequest._();
  PredictionsRequest createEmptyInstance() => create();
  static $pb.PbList<PredictionsRequest> createRepeated() => $pb.PbList<PredictionsRequest>();
  @$core.pragma('dart2js:noInline')
  static PredictionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PredictionsRequest>(create);
  static PredictionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get input => $_getSZ(0);
  @$pb.TagNumber(1)
  set input($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInput() => $_has(0);
  @$pb.TagNumber(1)
  void clearInput() => clearField(1);
}

class PredictionsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PredictionsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'proto'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  PredictionsResponse._() : super();
  factory PredictionsResponse({
    $core.Iterable<$core.String>? description,
  }) {
    final _result = create();
    if (description != null) {
      _result.description.addAll(description);
    }
    return _result;
  }
  factory PredictionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PredictionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PredictionsResponse clone() => PredictionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PredictionsResponse copyWith(void Function(PredictionsResponse) updates) => super.copyWith((message) => updates(message as PredictionsResponse)) as PredictionsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PredictionsResponse create() => PredictionsResponse._();
  PredictionsResponse createEmptyInstance() => create();
  static $pb.PbList<PredictionsResponse> createRepeated() => $pb.PbList<PredictionsResponse>();
  @$core.pragma('dart2js:noInline')
  static PredictionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PredictionsResponse>(create);
  static PredictionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get description => $_getList(0);
}

