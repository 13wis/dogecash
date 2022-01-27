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
}
