import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<DogecashClient> getDogecashClient() async {
  final String host = dotenv.get('GRPC_HOST');
  final ChannelOptions options =
      ChannelOptions(credentials: ChannelCredentials.secure(authority: host));
  final ClientChannel channel =
      ClientChannel(host, options: options, port: 443);

  final Box doge = Hive.box('doge');
  final String? token = doge.get('token');
  final Map<String, String> metadata = {};

  if (token != null) {
    metadata['authorization'] = token;
  }

  return DogecashClient(channel, options: CallOptions(metadata: metadata));
}

Future<void> updateToken(String? value) async {
  final Box doge = Hive.box('doge');
  await doge.put('token', value);
}
