import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/google/protobuf/empty.pb.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/util/grpc_client.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:protobuf/protobuf.dart';

class ViewerRepository {
  Future<ViewerResponse> getCurrentViewer() async {
    final DogecashClient client = await getDogecashClient();
    final ViewerResponse viewer = await client.viewer(Empty());
    final String name = viewer.doge.firstName;
    if (name.isNotEmpty) {
      final Box doge = Hive.box('doge');
      await doge.put('name', name);
    }
    return viewer;
  }

  Future<BalanceResponse> getCurrentBalance() async {
    final DogecashClient client = await getDogecashClient();
    return await client.balance(Empty());
  }

  Future<DogeCardResponse> getCardInfo({required bool full}) async {
    final DogecashClient client = await getDogecashClient();
    final request = DogeCardRequest(full: full);
    return await client.dogeCard(request);
  }

  Future<ExternalAccountsResponse> getExternalAccounts() async {
    final DogecashClient client = await getDogecashClient();
    return await client.externalAccounts(Empty());
  }

  Future<MyDogesResponse> getMyDoges() async {
    final DogecashClient client = await getDogecashClient();
    return await client.myDoges(Empty());
  }

  Future<void> updateDogetag({required String dogetag}) async {
    final DogecashClient client = await getDogecashClient();
    final request = UpdateDogetagRequest(dogetag: dogetag);
    final ResponseFuture<Empty> call = client.updateDogetag(request);

    call.headers.then((value) {
      updateToken(value['authorization']);
    });

    await call;
  }

  dynamic _makeLongIntIfNotNull(int? n) {
    if (n != null) return makeLongInt(n);
  }

  Future<void> updateStripeInfo(
      {bool create = false,
      DateTime? dob,
      String? firstName,
      String? lastName,
      String? ssnLast4}) async {
    final DogecashClient client = await getDogecashClient();
    final request = UpdateStripeInfoRequest(
        day: _makeLongIntIfNotNull(dob?.day),
        month: _makeLongIntIfNotNull(dob?.month),
        year: _makeLongIntIfNotNull(dob?.year),
        firstName: firstName,
        lastName: lastName,
        create_6: create);
    final ResponseFuture<Empty> call = client.updateStripeInfo(request);

    call.headers.then((value) {
      updateToken(value['authorization']);
    });

    await call;
  }

  Future<void> updateExternalAccount() async {
    final TokenData data = await Stripe.instance
        .createToken(const CreateTokenParams(type: TokenType.Card));
    final DogecashClient client = await getDogecashClient();
    final request = UpdateExternalAccountRequest(token: data.id);
    await client.updateExternalAccount(request);
  }
}
