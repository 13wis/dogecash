part of 'home_screen.dart';

class ActivityListScreen extends BlocBuilder<ActivityBloc, ActivityState> {
  ActivityListScreen({Key? key})
      : super(
            builder: (context, state) {
              if (state.isUnknown) {
                context.read<ActivityBloc>().add(const GetActivity(null));
              }
              final repeated = state.repeated?.activity ?? [];
              return Scaffold(
                  appBar: AppBar(
                      backgroundColor: DogeColors.background,
                      title: Text('activity',
                          style: Theme.of(context).textTheme.headline5)),
                  body: Padding(
                      padding: const EdgeInsets.all(GlobalSpacingFactor.two),
                      child: state.loading
                          ? Center(
                              child: ModifiedProgressIndicator(
                                  color: Colors.green))
                          : ListView(children: [
                              if (repeated.isEmpty)
                                Container(
                                    padding: const EdgeInsets.all(
                                        GlobalSpacingFactor.four * 2),
                                    child: const Text(
                                        'nothing to see here, yet...'))
                              else
                                for (var activity in repeated)
                                  ActivityLine(activity: activity)
                            ])));
            },
            key: key);
}
