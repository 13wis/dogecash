part of 'home_screen.dart';

class BottomSheet extends BlocBuilder<ActivityBloc, ActivityState> {
  BottomSheet({Key? key})
      : super(
            builder: (context, a) =>
                BlocBuilder<MyDogesBloc, MyDogesState>(builder: (context, m) {
                  if (a.isUnknown) {
                    context.read<ActivityBloc>().add(const GetActivity(null));
                  }
                  if (m.isUnknown) {
                    context.read<MyDogesBloc>().add(const GetMyDoges());
                  }
                  final repeated = a.repeated?.activity ?? [];
                  final doges = m.doges?.doges ?? [];

                  List<Widget> _buildActivityLines() {
                    if (repeated.isEmpty) {
                      return [
                        Container(
                            padding: const EdgeInsets.all(
                                GlobalSpacingFactor.four * 2),
                            child: const Text('nothing to see here, yet...'))
                      ];
                    }
                    final int max = repeated.length <= 5 ? repeated.length : 5;
                    return [
                      for (var i = 0; i < max; i++)
                        ActivityLine(activity: repeated[i])
                    ];
                  }

                  List<Widget> _buildDogeCards() {
                    if (doges.isEmpty) {
                      return [
                        Container(
                            padding:
                                const EdgeInsets.all(GlobalSpacingFactor.four),
                            child: const Text(
                                'This is where firends would show up, if you had any',
                                textAlign: TextAlign.center))
                      ];
                    }
                    final int max = doges.length <= 5 ? doges.length : 5;
                    return [
                      for (var i = 0; i < max; i++)
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    GlobalSpacingFactor.one)),
                            padding:
                                const EdgeInsets.all(GlobalSpacingFactor.two),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              if (doges[i].profilePicUrl.isNotEmpty)
                                SizedBox(
                                    height: 20.0,
                                    width: 20.0,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            GlobalSpacingFactor.one),
                                        child: Image.network(
                                            doges[i].profilePicUrl,
                                            frameBuilder: (context, child,
                                                frame, wasSynchronouslyLoaded) {
                                          if (wasSynchronouslyLoaded) {
                                            return child;
                                          }
                                          return Shimmer.fromColors(
                                              child: const SizedBox.expand(),
                                              baseColor: Colors.green,
                                              highlightColor:
                                                  Colors.green.shade50);
                                        }))),
                              Text(doges[i].firstName,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ]))
                    ];
                  }

                  final children = <Widget>[
                    const Actions(),
                    GradientMask(
                        gradient: LinearGradient(colors: [
                          Colors.white,
                          Colors.white.withAlpha(123)
                        ]),
                        child: Text('my doges.',
                            style: Theme.of(context).textTheme.headline5)),
                    if (doges.isNotEmpty)
                      Padding(
                          padding:
                              const EdgeInsets.all(GlobalSpacingFactor.two),
                          child: Wrap(
                              spacing: GlobalSpacingFactor.one,
                              runSpacing: GlobalSpacingFactor.one,
                              children: _buildDogeCards()))
                    else
                      const Text(
                          'this is where friends would show up...if you had any'),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GradientMask(
                              gradient: LinearGradient(colors: [
                                Colors.white.withAlpha(123),
                                Colors.white
                              ]),
                              child: Text('recent activity.',
                                  style:
                                      Theme.of(context).textTheme.headline5)),
                          GestureDetector(
                              onTap: () => AutoRouter.of(context)
                                  .push(ActivityListScreenRoute()),
                              child: const Text('view all',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))
                        ]),
                    ..._buildActivityLines()
                  ];

                  return NotificationListener<DraggableScrollableNotification>(
                      // onNotification: (notification) {
                      //   Use to shrink the outer layout when extending the sheet
                      //   print("${notification.extent == notification.maxExtent}");
                      //   return false;
                      // },
                      child: DraggableScrollableSheet(
                          initialChildSize: 0.6,
                          minChildSize: 0.6,
                          maxChildSize: 0.9,
                          builder: (context, scrollController) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 5.0, sigmaY: 5.0),
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            top: GlobalSpacingFactor.three,
                                            left: GlobalSpacingFactor.two,
                                            right: GlobalSpacingFactor.two),
                                        color: Colors.black.withAlpha(123),
                                        child: ListView(
                                            controller: scrollController,
                                            children: children))));
                          }));
                }),
            key: key);
}
