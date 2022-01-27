import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/activity_detail/activity_detail_cubit.dart';
import 'package:frontend/proto/dogecash.pb.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/router/app_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:shimmer/shimmer.dart';

class ActivityLine extends StatelessWidget {
  final currency = NumberFormat.simpleCurrency(locale: 'en-US');
  final date = DateFormat.MMMd('en_US');
  final Activity _activity;

  ActivityLine({required Activity activity, Key? key})
      : _activity = activity,
        super(key: key);

  List<Widget> _buildTextLines() {
    final String source = _activity.externalAccount.brand.isNotEmpty
        ? '${_activity.externalAccount.brand} card'
        : _activity.externalAccount.bankName.isNotEmpty
            ? _activity.externalAccount.bankName
            : 'unkown';
    final String peer = _activity.peer.firstName.isNotEmpty &&
            _activity.peer.lastName.isNotEmpty
        ? '${_activity.peer.firstName} ${_activity.peer.lastName}'
        : _activity.peer.email.isNotEmpty
            ? _activity.peer.email
            : 'unknown';
    final created = date.format(
        DateTime.fromMillisecondsSinceEpoch(_activity.created.toInt() * 1000));
    switch (_activity.activityType) {
      case Activity_ActivityType.add_cash:
        return [
          const Text('add cash', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('from $source', overflow: TextOverflow.ellipsis)
        ];
      case Activity_ActivityType.cash_out:
        return [
          const Text('cash out', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('to $source', overflow: TextOverflow.ellipsis)
        ];
      case Activity_ActivityType.pay:
        return [
          Text(peer, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('on $created', overflow: TextOverflow.ellipsis)
        ];
      case Activity_ActivityType.request:
        return [
          const Text('request', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('to $peer', overflow: TextOverflow.ellipsis)
        ];
      default:
        return const [Text('unknwon'), Text('unknwon')];
    }
  }

  @override
  Widget build(BuildContext context) {
    final String amount = currency.format(_activity.amount.toInt() / 100);
    final String sign = _activity.moneyin ? '+' : '';
    return InkWell(
        onTap: () {
          final activityId = _activity.id.toInt();
          context.read<ActivityDetailCubit>().getByActivityId(id: activityId);
          AutoRouter.of(context)
              .push(ActivityDetailScreenRoute(activityId: activityId));
        },
        child: Container(
            padding: const EdgeInsets.all(GlobalSpacingFactor.two),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(GlobalSpacingFactor.one),
                          child: _activity.activityType ==
                                      Activity_ActivityType.add_cash ||
                                  _activity.activityType ==
                                      Activity_ActivityType.cash_out
                              ? Container(
                                  color: Colors.green,
                                  alignment: Alignment.center,
                                  child:
                                      const FaIcon(FontAwesomeIcons.dollarSign))
                              : _activity.peer.profilePicUrl.isNotEmpty
                                  ? Image.network(_activity.peer.profilePicUrl,
                                      frameBuilder: (context, child, frame,
                                          wasSynchronouslyLoaded) {
                                      if (wasSynchronouslyLoaded) {
                                        return child;
                                      }
                                      return Shimmer.fromColors(
                                          child: const SizedBox.expand(),
                                          baseColor: Colors.green,
                                          highlightColor: Colors.green.shade50);
                                    })
                                  : Container(
                                      color: Colors.green,
                                      alignment: Alignment.center,
                                      child: Text(_activity.peer.firstName.characters.first,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold))))),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: GlobalSpacingFactor.two),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _buildTextLines()))),
                  Text('$sign$amount',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.bold))
                ])));
  }
}
