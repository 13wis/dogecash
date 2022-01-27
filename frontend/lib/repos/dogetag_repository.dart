import 'dart:async';

import 'package:frontend/models/enums.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/util/grpc_client.dart';

class DogetagRepository {
  final _controller = StreamController<DogetagAvailability>();

  Stream<DogetagAvailability> get availability async* {
    yield* _controller.stream;
  }

  Future<void> getAvailability({required String dogetag}) async {
    _controller.add(DogetagAvailability.loading);
    final DogecashClient client = await getDogecashClient();
    final request = DogetagAvailableRequest(dogetag: dogetag);
    final DogetagAvaiableResponse call = await client.dogetagAvailable(request);

    call.available
        ? _controller.add(DogetagAvailability.available)
        : _controller.add(DogetagAvailability.unavailable);
  }
}
