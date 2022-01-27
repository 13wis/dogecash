import 'dart:async';

import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/util/grpc_client.dart';

class AddressRepository {
  final _request = StreamController<PredictionsRequest>();
  final _response = StreamController<PredictionsResponse>();

  Stream<PredictionsResponse> get response async* {
    yield* _response.stream;
  }

  Future<void> listenForPredictions() async {
    final DogecashClient client = await getDogecashClient();
    final stream = client.predictions(_request.stream);
    await for (var prediction in stream) {
      _response.add(prediction);
    }
  }

  void addPredictionRequest(String? input) {
    _request.add(PredictionsRequest(input: input));
  }
}
