import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/util/grpc_client.dart';
import 'package:protobuf/protobuf.dart';

class ActivityRepository {
  Future<ActivityRepeated> getActivity({int? peer, int? activity}) async {
    final DogecashClient client = await getDogecashClient();
    final peerId = peer != null ? makeLongInt(peer) : null;
    final activityId = activity != null ? makeLongInt(activity) : null;
    final request = ActivityRequest(peer: peerId, activityId: activityId);
    return await client.activities(request);
  }
}
