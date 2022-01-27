part of 'home_screen.dart';

class BalanceCard extends BlocBuilder<BalanceBloc, BalanceState> {
  static const Map<String, IconData> creditCards = {
    'visa': FontAwesomeIcons.ccVisa,
    'mastercard': FontAwesomeIcons.ccMastercard,
    'amex': FontAwesomeIcons.ccAmex,
    'discover': FontAwesomeIcons.ccDiscover,
    'jcb': FontAwesomeIcons.ccJcb
  };

  BalanceCard({Key? key})
      : super(
            builder: (context, b) {
              return BlocBuilder<CardBloc, CardState>(builder: (context, c) {
                if (b.isUnknown) {
                  context.read<BalanceBloc>().add(const GetBalance());
                }
                if (c.isUnknown) {
                  context.read<CardBloc>().add(const GetCardInfo(false));
                }
                final currency =
                    intl.NumberFormat.simpleCurrency(locale: 'en-US');
                final IconData logo =
                    creditCards[c.card?.brand.toLowerCase()] ??
                        FontAwesomeIcons.solidCreditCard;
                final int? available = b.balance;
                final String balance =
                    available != null ? currency.format(available / 100) : '';
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FaIcon(logo, size: 48.0, color: DogeColors.background),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(balance,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: DogeColors.background)),
                            Text(
                              'account balance',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: DogeColors.background),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('•••• ${c.card?.last4 ?? ''}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: DogeColors.background)),
                            Text(
                                '${c.card?.expMonth.toString()}/${c.card?.expYear.toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: DogeColors.background,
                                        fontWeight: FontWeight.bold))
                          ])
                    ]);
              });
            },
            key: key);
}
