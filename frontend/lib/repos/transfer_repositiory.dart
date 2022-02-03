import 'package:frontend/google/protobuf/empty.pb.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/util/grpc_client.dart';
import 'package:protobuf/protobuf.dart';

class TransferRepository {
  Future<Activity> pay(int amount, String? note, PayRequest_SourceType source,
      int to, int? requestId) async {
    final DogecashClient client = await getDogecashClient();
    final request = PayRequest(
        amount: makeLongInt(amount),
        note: note,
        sourceType: source,
        to: makeLongInt(to),
        requestId: requestId != null ? makeLongInt(requestId) : null);
    return await client.pay(request);
  }

  Future<Activity> request(int amount, String? note, int to) async {
    final DogecashClient client = await getDogecashClient();
    final request = SendRequestRequest(
        amount: makeLongInt(amount), note: note, to: makeLongInt(to));
    return await client.sendRequest(request);
  }

  Future<Empty> addCash(int amount) async {
    final DogecashClient client = await getDogecashClient();
    final request = AddCashRequest(
        amount: makeLongInt(amount), externalAccountType: "card");
    return await client.addCash(request);
  }

  Future<Activity> cashOut(int amount, bool method) async {
    final DogecashClient client = await getDogecashClient();
    final request = CashOutRequest(
        amount: makeLongInt(amount),
        instant: method,
        externalAccountType: "card");
    return await client.cashOut(request);
  }
}
