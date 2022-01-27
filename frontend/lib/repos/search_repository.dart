import 'dart:async';

import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/util/grpc_client.dart';

class SearchRepository {
  final _request = StreamController<SearchDogesRequest>();
  final _response = StreamController<SearchDogesResponse>();

  Stream<SearchDogesResponse> get response async* {
    yield* _response.stream;
  }

  Future<void> listenForDoges() async {
    final DogecashClient client = await getDogecashClient();
    final stream = client.searchDoges(_request.stream);
    await for (var result in stream) {
      _response.add(result);
    }
  }

  void addDogesRequest(String? query) =>
      _request.add(SearchDogesRequest(query: query));
}
