///
//  Generated code. Do not modify.
//  source: proto/dogecash.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import '../google/protobuf/empty.pb.dart' as $0;
import 'dogecash.pb.dart' as $1;
export 'dogecash.pb.dart';

class DogecashClient extends $grpc.Client {
  static final _$viewer = $grpc.ClientMethod<$0.Empty, $1.ViewerResponse>(
      '/proto.Dogecash/Viewer',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ViewerResponse.fromBuffer(value));
  static final _$signIn =
      $grpc.ClientMethod<$1.AuthenticationRequest, $0.Empty>(
          '/proto.Dogecash/SignIn',
          ($1.AuthenticationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$register =
      $grpc.ClientMethod<$1.AuthenticationRequest, $0.Empty>(
          '/proto.Dogecash/Register',
          ($1.AuthenticationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$dogetagAvailable = $grpc.ClientMethod<
          $1.DogetagAvailableRequest, $1.DogetagAvaiableResponse>(
      '/proto.Dogecash/DogetagAvailable',
      ($1.DogetagAvailableRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.DogetagAvaiableResponse.fromBuffer(value));
  static final _$updateDogetag =
      $grpc.ClientMethod<$1.UpdateDogetagRequest, $0.Empty>(
          '/proto.Dogecash/UpdateDogetag',
          ($1.UpdateDogetagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$updateStripeInfo =
      $grpc.ClientMethod<$1.UpdateStripeInfoRequest, $0.Empty>(
          '/proto.Dogecash/UpdateStripeInfo',
          ($1.UpdateStripeInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$updateExternalAccount =
      $grpc.ClientMethod<$1.UpdateExternalAccountRequest, $0.Empty>(
          '/proto.Dogecash/UpdateExternalAccount',
          ($1.UpdateExternalAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/proto.Dogecash/Logout',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$forgotPassword =
      $grpc.ClientMethod<$1.ForgotPasswordRequest, $0.Empty>(
          '/proto.Dogecash/ForgotPassword',
          ($1.ForgotPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$verifyCode =
      $grpc.ClientMethod<$1.VerifyCodeRequest, $0.Empty>(
          '/proto.Dogecash/VerifyCode',
          ($1.VerifyCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$1.ResetPasswordRequest, $0.Empty>(
          '/proto.Dogecash/ResetPassword',
          ($1.ResetPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$myDoges = $grpc.ClientMethod<$0.Empty, $1.MyDogesResponse>(
      '/proto.Dogecash/MyDoges',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.MyDogesResponse.fromBuffer(value));
  static final _$balance = $grpc.ClientMethod<$0.Empty, $1.BalanceResponse>(
      '/proto.Dogecash/Balance',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.BalanceResponse.fromBuffer(value));
  static final _$externalAccounts =
      $grpc.ClientMethod<$0.Empty, $1.ExternalAccountsResponse>(
          '/proto.Dogecash/ExternalAccounts',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ExternalAccountsResponse.fromBuffer(value));
  static final _$searchDoges =
      $grpc.ClientMethod<$1.SearchDogesRequest, $1.SearchDogesResponse>(
          '/proto.Dogecash/SearchDoges',
          ($1.SearchDogesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.SearchDogesResponse.fromBuffer(value));
  static final _$pay = $grpc.ClientMethod<$1.PayRequest, $1.Activity>(
      '/proto.Dogecash/Pay',
      ($1.PayRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Activity.fromBuffer(value));
  static final _$sendRequest =
      $grpc.ClientMethod<$1.SendRequestRequest, $1.Activity>(
          '/proto.Dogecash/SendRequest',
          ($1.SendRequestRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Activity.fromBuffer(value));
  static final _$addCash = $grpc.ClientMethod<$1.AddCashRequest, $0.Empty>(
      '/proto.Dogecash/AddCash',
      ($1.AddCashRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$cashOut = $grpc.ClientMethod<$1.CashOutRequest, $1.Activity>(
      '/proto.Dogecash/CashOut',
      ($1.CashOutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Activity.fromBuffer(value));
  static final _$activities =
      $grpc.ClientMethod<$1.ActivityRequest, $1.ActivityRepeated>(
          '/proto.Dogecash/Activities',
          ($1.ActivityRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ActivityRepeated.fromBuffer(value));
  static final _$newCardholder =
      $grpc.ClientMethod<$1.NewCardholderRequest, $0.Empty>(
          '/proto.Dogecash/NewCardholder',
          ($1.NewCardholderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$dogeCard =
      $grpc.ClientMethod<$1.DogeCardRequest, $1.DogeCardResponse>(
          '/proto.Dogecash/DogeCard',
          ($1.DogeCardRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.DogeCardResponse.fromBuffer(value));
  static final _$predictions =
      $grpc.ClientMethod<$1.PredictionsRequest, $1.PredictionsResponse>(
          '/proto.Dogecash/Predictions',
          ($1.PredictionsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.PredictionsResponse.fromBuffer(value));

  DogecashClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.ViewerResponse> viewer($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$viewer, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> signIn($1.AuthenticationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> register($1.AuthenticationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$1.DogetagAvaiableResponse> dogetagAvailable(
      $1.DogetagAvailableRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dogetagAvailable, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateDogetag($1.UpdateDogetagRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDogetag, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateStripeInfo(
      $1.UpdateStripeInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateStripeInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateExternalAccount(
      $1.UpdateExternalAccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateExternalAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> logout($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> forgotPassword(
      $1.ForgotPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$forgotPassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> verifyCode($1.VerifyCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> resetPassword($1.ResetPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.MyDogesResponse> myDoges($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$myDoges, request, options: options);
  }

  $grpc.ResponseFuture<$1.BalanceResponse> balance($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$balance, request, options: options);
  }

  $grpc.ResponseFuture<$1.ExternalAccountsResponse> externalAccounts(
      $0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$externalAccounts, request, options: options);
  }

  $grpc.ResponseStream<$1.SearchDogesResponse> searchDoges(
      $async.Stream<$1.SearchDogesRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$searchDoges, request, options: options);
  }

  $grpc.ResponseFuture<$1.Activity> pay($1.PayRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pay, request, options: options);
  }

  $grpc.ResponseFuture<$1.Activity> sendRequest($1.SendRequestRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addCash($1.AddCashRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addCash, request, options: options);
  }

  $grpc.ResponseFuture<$1.Activity> cashOut($1.CashOutRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cashOut, request, options: options);
  }

  $grpc.ResponseFuture<$1.ActivityRepeated> activities(
      $1.ActivityRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$activities, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> newCardholder($1.NewCardholderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$newCardholder, request, options: options);
  }

  $grpc.ResponseFuture<$1.DogeCardResponse> dogeCard($1.DogeCardRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$dogeCard, request, options: options);
  }

  $grpc.ResponseStream<$1.PredictionsResponse> predictions(
      $async.Stream<$1.PredictionsRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$predictions, request, options: options);
  }
}

abstract class DogecashServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.Dogecash';

  DogecashServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ViewerResponse>(
        'Viewer',
        viewer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ViewerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AuthenticationRequest, $0.Empty>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.AuthenticationRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AuthenticationRequest, $0.Empty>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.AuthenticationRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DogetagAvailableRequest,
            $1.DogetagAvaiableResponse>(
        'DogetagAvailable',
        dogetagAvailable_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.DogetagAvailableRequest.fromBuffer(value),
        ($1.DogetagAvaiableResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateDogetagRequest, $0.Empty>(
        'UpdateDogetag',
        updateDogetag_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdateDogetagRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateStripeInfoRequest, $0.Empty>(
        'UpdateStripeInfo',
        updateStripeInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdateStripeInfoRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateExternalAccountRequest, $0.Empty>(
        'UpdateExternalAccount',
        updateExternalAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdateExternalAccountRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ForgotPasswordRequest, $0.Empty>(
        'ForgotPassword',
        forgotPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ForgotPasswordRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.VerifyCodeRequest, $0.Empty>(
        'VerifyCode',
        verifyCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.VerifyCodeRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ResetPasswordRequest, $0.Empty>(
        'ResetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ResetPasswordRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.MyDogesResponse>(
        'MyDoges',
        myDoges_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.MyDogesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.BalanceResponse>(
        'Balance',
        balance_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.BalanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ExternalAccountsResponse>(
        'ExternalAccounts',
        externalAccounts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ExternalAccountsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.SearchDogesRequest, $1.SearchDogesResponse>(
            'SearchDoges',
            searchDoges,
            true,
            true,
            ($core.List<$core.int> value) =>
                $1.SearchDogesRequest.fromBuffer(value),
            ($1.SearchDogesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.PayRequest, $1.Activity>(
        'Pay',
        pay_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.PayRequest.fromBuffer(value),
        ($1.Activity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SendRequestRequest, $1.Activity>(
        'SendRequest',
        sendRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.SendRequestRequest.fromBuffer(value),
        ($1.Activity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AddCashRequest, $0.Empty>(
        'AddCash',
        addCash_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.AddCashRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CashOutRequest, $1.Activity>(
        'CashOut',
        cashOut_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CashOutRequest.fromBuffer(value),
        ($1.Activity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ActivityRequest, $1.ActivityRepeated>(
        'Activities',
        activities_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ActivityRequest.fromBuffer(value),
        ($1.ActivityRepeated value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.NewCardholderRequest, $0.Empty>(
        'NewCardholder',
        newCardholder_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.NewCardholderRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DogeCardRequest, $1.DogeCardResponse>(
        'DogeCard',
        dogeCard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DogeCardRequest.fromBuffer(value),
        ($1.DogeCardResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.PredictionsRequest, $1.PredictionsResponse>(
            'Predictions',
            predictions,
            true,
            true,
            ($core.List<$core.int> value) =>
                $1.PredictionsRequest.fromBuffer(value),
            ($1.PredictionsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.ViewerResponse> viewer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return viewer(call, await request);
  }

  $async.Future<$0.Empty> signIn_Pre($grpc.ServiceCall call,
      $async.Future<$1.AuthenticationRequest> request) async {
    return signIn(call, await request);
  }

  $async.Future<$0.Empty> register_Pre($grpc.ServiceCall call,
      $async.Future<$1.AuthenticationRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$1.DogetagAvaiableResponse> dogetagAvailable_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.DogetagAvailableRequest> request) async {
    return dogetagAvailable(call, await request);
  }

  $async.Future<$0.Empty> updateDogetag_Pre($grpc.ServiceCall call,
      $async.Future<$1.UpdateDogetagRequest> request) async {
    return updateDogetag(call, await request);
  }

  $async.Future<$0.Empty> updateStripeInfo_Pre($grpc.ServiceCall call,
      $async.Future<$1.UpdateStripeInfoRequest> request) async {
    return updateStripeInfo(call, await request);
  }

  $async.Future<$0.Empty> updateExternalAccount_Pre($grpc.ServiceCall call,
      $async.Future<$1.UpdateExternalAccountRequest> request) async {
    return updateExternalAccount(call, await request);
  }

  $async.Future<$0.Empty> logout_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return logout(call, await request);
  }

  $async.Future<$0.Empty> forgotPassword_Pre($grpc.ServiceCall call,
      $async.Future<$1.ForgotPasswordRequest> request) async {
    return forgotPassword(call, await request);
  }

  $async.Future<$0.Empty> verifyCode_Pre($grpc.ServiceCall call,
      $async.Future<$1.VerifyCodeRequest> request) async {
    return verifyCode(call, await request);
  }

  $async.Future<$0.Empty> resetPassword_Pre($grpc.ServiceCall call,
      $async.Future<$1.ResetPasswordRequest> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$1.MyDogesResponse> myDoges_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return myDoges(call, await request);
  }

  $async.Future<$1.BalanceResponse> balance_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return balance(call, await request);
  }

  $async.Future<$1.ExternalAccountsResponse> externalAccounts_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return externalAccounts(call, await request);
  }

  $async.Future<$1.Activity> pay_Pre(
      $grpc.ServiceCall call, $async.Future<$1.PayRequest> request) async {
    return pay(call, await request);
  }

  $async.Future<$1.Activity> sendRequest_Pre($grpc.ServiceCall call,
      $async.Future<$1.SendRequestRequest> request) async {
    return sendRequest(call, await request);
  }

  $async.Future<$0.Empty> addCash_Pre(
      $grpc.ServiceCall call, $async.Future<$1.AddCashRequest> request) async {
    return addCash(call, await request);
  }

  $async.Future<$1.Activity> cashOut_Pre(
      $grpc.ServiceCall call, $async.Future<$1.CashOutRequest> request) async {
    return cashOut(call, await request);
  }

  $async.Future<$1.ActivityRepeated> activities_Pre(
      $grpc.ServiceCall call, $async.Future<$1.ActivityRequest> request) async {
    return activities(call, await request);
  }

  $async.Future<$0.Empty> newCardholder_Pre($grpc.ServiceCall call,
      $async.Future<$1.NewCardholderRequest> request) async {
    return newCardholder(call, await request);
  }

  $async.Future<$1.DogeCardResponse> dogeCard_Pre(
      $grpc.ServiceCall call, $async.Future<$1.DogeCardRequest> request) async {
    return dogeCard(call, await request);
  }

  $async.Future<$1.ViewerResponse> viewer(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> signIn(
      $grpc.ServiceCall call, $1.AuthenticationRequest request);
  $async.Future<$0.Empty> register(
      $grpc.ServiceCall call, $1.AuthenticationRequest request);
  $async.Future<$1.DogetagAvaiableResponse> dogetagAvailable(
      $grpc.ServiceCall call, $1.DogetagAvailableRequest request);
  $async.Future<$0.Empty> updateDogetag(
      $grpc.ServiceCall call, $1.UpdateDogetagRequest request);
  $async.Future<$0.Empty> updateStripeInfo(
      $grpc.ServiceCall call, $1.UpdateStripeInfoRequest request);
  $async.Future<$0.Empty> updateExternalAccount(
      $grpc.ServiceCall call, $1.UpdateExternalAccountRequest request);
  $async.Future<$0.Empty> logout($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> forgotPassword(
      $grpc.ServiceCall call, $1.ForgotPasswordRequest request);
  $async.Future<$0.Empty> verifyCode(
      $grpc.ServiceCall call, $1.VerifyCodeRequest request);
  $async.Future<$0.Empty> resetPassword(
      $grpc.ServiceCall call, $1.ResetPasswordRequest request);
  $async.Future<$1.MyDogesResponse> myDoges(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.BalanceResponse> balance(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.ExternalAccountsResponse> externalAccounts(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$1.SearchDogesResponse> searchDoges(
      $grpc.ServiceCall call, $async.Stream<$1.SearchDogesRequest> request);
  $async.Future<$1.Activity> pay($grpc.ServiceCall call, $1.PayRequest request);
  $async.Future<$1.Activity> sendRequest(
      $grpc.ServiceCall call, $1.SendRequestRequest request);
  $async.Future<$0.Empty> addCash(
      $grpc.ServiceCall call, $1.AddCashRequest request);
  $async.Future<$1.Activity> cashOut(
      $grpc.ServiceCall call, $1.CashOutRequest request);
  $async.Future<$1.ActivityRepeated> activities(
      $grpc.ServiceCall call, $1.ActivityRequest request);
  $async.Future<$0.Empty> newCardholder(
      $grpc.ServiceCall call, $1.NewCardholderRequest request);
  $async.Future<$1.DogeCardResponse> dogeCard(
      $grpc.ServiceCall call, $1.DogeCardRequest request);
  $async.Stream<$1.PredictionsResponse> predictions(
      $grpc.ServiceCall call, $async.Stream<$1.PredictionsRequest> request);
}
