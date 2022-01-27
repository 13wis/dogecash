part of 'home_screen.dart';

class External extends BlocBuilder<ExternalBloc, ExternalState> {
  External({Key? key})
      : super(
            builder: (context, state) {
              if (state.isUnknown) {
                context.read<ExternalBloc>().add(const GetExternalInfo());
              }
              final ExternalAccount? account =
                  state.external?.externalAccount.first;
              final IconData logo =
                  BalanceCard.creditCards[account?.brand.toLowerCase()] ??
                      FontAwesomeIcons.university;
              final List<Widget> children = account != null
                  ? [
                      FaIcon(logo, size: 48.0, color: DogeColors.background),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('linked account',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: DogeColors.background)),
                            if (account.eligible)
                              RichText(
                                  text: TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: 'instant payouts ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: DogeColors.background)),
                                  const WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: FaIcon(FontAwesomeIcons.bolt,
                                          size: 14.0,
                                          color: DogeColors.background))
                                ],
                              ))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('•••• ${account.last4}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: DogeColors.background)),
                            Text('${account.expMonth}/${account.expYear}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: DogeColors.background,
                                        fontWeight: FontWeight.bold))
                          ])
                    ]
                  : [Container()];
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: children);
            },
            key: key);
}
