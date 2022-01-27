import 'dart:async';

import 'package:frontend/google/protobuf/empty.pb.dart';
import 'package:frontend/models/enums.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/util/grpc_client.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  Future<void> attemptAuthentication(
      {required String email,
      required String password,
      required FormType formType}) async {
    final DogecashClient client = await getDogecashClient();
    final AuthenticationRequest request =
        AuthenticationRequest(email: email, password: password);
    final ResponseFuture<Empty> call = formType == FormType.signIn
        ? client.signIn(request)
        : client.register(request);

    call.headers.then((value) async {
      await updateToken(value['authorization']);
    });

    await call;

    _controller.add(AuthenticationStatus.authenticated);
  }

  void signOut() async {
    await updateToken(null);
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> dispose() async => await _controller.close();
}
