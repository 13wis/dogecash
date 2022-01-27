part of 'home_screen.dart';

class SearchDogeScreen extends StatelessWidget {
  final Activity_ActivityType activity;

  const SearchDogeScreen({required this.activity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: DogeColors.background,
            title:
                Text(activity == Activity_ActivityType.pay ? 'pay' : 'request'),
            elevation: 0.0),
        body: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, s) =>
                BlocBuilder<MyDogesBloc, MyDogesState>(builder: (context, m) {
                  if (m.isUnknown) {
                    context.read<MyDogesBloc>().add(const GetMyDoges());
                  }
                  final cubit = context.read<SearchCubit>();
                  final doges = m.doges?.doges ?? [];
                  final String? value = s.search.value;
                  final suggestedList = Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: doges.length,
                          itemBuilder: (context, index) => OpenContainer(
                              closedElevation: 0.0,
                              closedShape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              closedColor: DogeColors.background,
                              closedBuilder: (context, openContainer) {
                                return InkWell(
                                    onTap: openContainer,
                                    child: DogeLineItem(
                                        by: s.search.value ?? '',
                                        doge: doges[index]));
                              },
                              openColor: DogeColors.background,
                              openBuilder: (context, closeContainer) =>
                                  AmountScreen(
                                      activity: activity,
                                      doge: doges[index]))));
                  final dogeList = ListView.builder(
                      shrinkWrap: true,
                      itemCount: s.doges.length,
                      itemBuilder: (context, index) => OpenContainer(
                          closedElevation: 0.0,
                          closedShape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          closedColor: DogeColors.background,
                          closedBuilder: (context, openContainer) {
                            return InkWell(
                                onTap: openContainer,
                                child: DogeLineItem(
                                    by: s.search.value ?? '',
                                    doge: s.doges[index]));
                          },
                          openColor: DogeColors.background,
                          openBuilder: (context, closeContainer) =>
                              AmountScreen(
                                  activity: activity, doge: s.doges[index])));
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(
                          GlobalSpacingFactor.two,
                          GlobalSpacingFactor.two,
                          GlobalSpacingFactor.two,
                          0.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                                onChanged: cubit.searchChanged,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(
                                        GlobalSpacingFactor.three),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    hintText:
                                        'Search by \$dogetag, name, or email')),
                            const SizedBox(height: GlobalSpacingFactor.two),
                            if (value == null || value.isEmpty)
                              if (m.isLoading)
                                Padding(
                                    padding: const EdgeInsets.all(
                                        GlobalSpacingFactor.four),
                                    child: ModifiedProgressIndicator())
                              else if (doges.isNotEmpty) ...[
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: GlobalSpacingFactor.one),
                                    child: Text('suggested',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5)),
                                suggestedList
                              ] else
                                Container(
                                    padding: const EdgeInsets.all(
                                        GlobalSpacingFactor.four),
                                    color: const Color(0x1E767680),
                                    child: const Text('Search for a doge'))
                            else if (s.doges.isEmpty)
                              Container(
                                  padding: const EdgeInsets.all(
                                      GlobalSpacingFactor.four),
                                  color: const Color(0x1E767680),
                                  child: const Text('No doges found'))
                            else
                              Expanded(child: dogeList)
                          ]));
                })));
  }
}
