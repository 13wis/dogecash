part of 'home_screen.dart';

class AmountScreen extends StatefulWidget {
  final Activity_ActivityType activity;
  final BaseDoge doge;

  const AmountScreen({required this.activity, required this.doge, Key? key})
      : super(key: key);

  @override
  _AmountScreenState createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen>
    with SingleTickerProviderStateMixin {
  final String decimal = "Decimal already used";
  final String minimumInput = "Please enter a number";
  final String maxAmount = "Maximum amount is \$9,999.99";
  final Tween<Offset> offsetTween =
      Tween<Offset>(begin: const Offset(-1 / 12, 0), end: Offset.zero);
  final currency =
      intl.NumberFormat.simpleCurrency(locale: "en-US", decimalDigits: 0);
  final List<String> numPadKeys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0'
  ];

  late double amount = 0.0;
  late double screenWidth = MediaQuery.of(context).size.width;
  late bool amountHasDecimal = false;
  late bool confirmation = false;
  late String decimalInput = "";
  late String warn = "";
  late PayRequest_SourceType source = PayRequest_SourceType.account;
  late bool open = false;
  late bool selected = false;

  Size getTextSize(String text) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: text,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.bold)),
        maxLines: 1,
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        textDirection: TextDirection.ltr)
      ..layout();

    return textPainter.size;
  }

  double sum(Iterable<double> elements) {
    return elements.fold(
        0.0, (previousValue, element) => previousValue + element);
  }

  Widget buildAmount() {
    // The animation is jarring when including a comma. For now, removing it
    // and revisiting the implementation later
    final List<String> formattedAmount = [
      ...currency.format(amount).replaceFirst(r',', '').characters,
      if (amountHasDecimal) '.',
      ...decimalInput.characters
    ];
    final List<double> characterSizes =
        List<double>.generate(formattedAmount.length, (index) {
      return getTextSize(formattedAmount[index]).width;
    });
    final double wordWidth = sum(characterSizes);

    return Stack(clipBehavior: Clip.none, children: [
      // Stack needs at least 1 static widget
      // https://stackoverflow.com/questions/54621743/
      Container(),
      ...List<Widget>.generate(formattedAmount.length + 1, (index) {
        final double previousCharactersTotalWidth =
            sum(characterSizes.take(index));
        final double screenCenter = screenWidth / 2 - GlobalSpacingFactor.two;
        final double wordCenter = wordWidth / 2;
        final double offsetLeft =
            screenCenter - wordCenter + previousCharactersTotalWidth;

        return AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
            bottom: GlobalSpacingFactor.four,
            left: offsetLeft,
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return FadeScaleTransition(
                      animation: animation, child: child);
                },
                child: index == formattedAmount.length
                    ? Container()
                    : Text(formattedAmount[index],
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold))));
      })
    ]);
  }

  String getAmountWithoutDecimal() {
    final String amountStr = amount.toStringAsFixed(2);
    final int decimalIndex = amountStr.indexOf('.');

    return amountStr.substring(0, decimalIndex);
  }

  void onTap(int index) {
    if (warn.isNotEmpty) warn = "";
    setState(() {
      try {
        switch (index) {
          case 9:
            if (amountHasDecimal) {
              throw 'Decimal already used';
            }
            amountHasDecimal = true;
            break;
          case 11:
            if (amountHasDecimal) {
              if (decimalInput.isEmpty) {
                amountHasDecimal = false;
              } else {
                decimalInput =
                    decimalInput.substring(0, decimalInput.length - 1);
              }
              break;
            }

            if (amount == 0) {
              throw 'Please enter a number';
            }

            amount = (amount - amount % 10) * 1e-1; // Exponents are more fun :D
            break;
          default:
            if (amountHasDecimal) {
              if (decimalInput.length >= 2) {
                throw 'Maximum precision is 2';
              }

              decimalInput += numPadKeys[index];
              break;
            }

            if (getAmountWithoutDecimal().length >= 4) {
              throw 'Maximum amount is \$9,999.99';
            }

            if (index == 10) {
              amount *= 1e1;
              break;
            }
            amount = (amount / 1e-1) + index + 1;
        }
      } catch (error) {
        warn = error.toString();
      }
    });
  }

  Widget buildNumPad() {
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 4 / 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        children: List<Widget>.generate(12, (index) {
          return ScaleOnTap(
              onTap: () => onTap(index),
              child: Center(
                  child: index == 11
                      ? const FaIcon(FontAwesomeIcons.chevronLeft)
                      : Text(numPadKeys[index],
                          style: Theme.of(context).textTheme.headline5)));
        }));
  }

  Widget selection() {
    return BlocBuilder<ExternalBloc, ExternalState>(
        builder: (context, e) =>
            BlocBuilder<BalanceBloc, BalanceState>(builder: (context, b) {
              if (e.isUnknown) {
                context.read<ExternalBloc>().add(const GetExternalInfo());
              }
              if (b.isUnknown) {
                context.read<BalanceBloc>().add(const GetBalance());
              }
              final cubit = context.watch<ConfirmationCubit>();
              final int? balance = b.balance;
              final ExternalAccount? externalAccount =
                  e.external?.externalAccount.first;
              final int amountInt = amount.toInt() * 100;
              final bool threshold = balance != null &&
                  balance >=
                      amountInt +
                          (decimalInput.isNotEmpty
                              ? decimalInput.length == 1
                                  ? int.parse(decimalInput) * 10
                                  : int.parse(decimalInput)
                              : 0);
              if (selected == false) {
                cubit.updateSource(threshold
                    ? PayRequest_SourceType.account
                    : PayRequest_SourceType.card);
              }
              return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() => open = true);
                    if (balance != null && externalAccount != null) {
                      final IconData logo = BalanceCard.creditCards[
                              externalAccount.brand.toLowerCase()] ??
                          FontAwesomeIcons.university;
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(GlobalSpacingFactor.four),
                                  topRight: Radius.circular(
                                      GlobalSpacingFactor.four))),
                          backgroundColor: Colors.black,
                          barrierColor: Colors.white.withAlpha(23),
                          context: context,
                          builder: (context) => Container(
                              height: 280.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      GlobalSpacingFactor.four)),
                              padding: const EdgeInsets.all(
                                  GlobalSpacingFactor.four),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  runSpacing: GlobalSpacingFactor.four,
                                  children: [
                                    Text('Select a payment option',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                    InkWell(
                                        onTap: threshold
                                            ? () {
                                                cubit.updateSource(
                                                    PayRequest_SourceType
                                                        .account);
                                                setState(() => selected = true);
                                                AutoRouter.of(context).pop();
                                              }
                                            : null,
                                        child: Row(children: [
                                          Container(
                                              alignment: Alignment.center,
                                              height: 50.0,
                                              width: 50.0,
                                              margin: const EdgeInsets.only(
                                                  right:
                                                      GlobalSpacingFactor.two),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          GlobalSpacingFactor
                                                              .one),
                                                  color: Colors.green),
                                              child: const FaIcon(
                                                  FontAwesomeIcons
                                                      .googleWallet)),
                                          Expanded(
                                              child: Text('Account balance',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6!
                                                      .copyWith(
                                                          color: threshold
                                                              ? null
                                                              : Colors
                                                                  .white24))),
                                          Text(currency.format(balance / 100),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: threshold
                                                          ? Colors.green
                                                          : Colors.white24))
                                        ])),
                                    InkWell(
                                        onTap: () {
                                          cubit.updateSource(
                                              PayRequest_SourceType.card);
                                          setState(() => selected = true);
                                          AutoRouter.of(context).pop();
                                        },
                                        child: Row(children: [
                                          Container(
                                              alignment: Alignment.center,
                                              height: 50.0,
                                              width: 50.0,
                                              margin: const EdgeInsets.only(
                                                  right:
                                                      GlobalSpacingFactor.two),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          GlobalSpacingFactor
                                                              .one),
                                                  color: Colors.green),
                                              child: FaIcon(logo)),
                                          Text(
                                              externalAccount.brand.isNotEmpty
                                                  ? '${externalAccount.brand} ending in ${externalAccount.last4}'
                                                  : externalAccount.bankName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6)
                                        ]))
                                  ]))).whenComplete(
                          () => setState(() => open = false));
                    }
                  },
                  child: FadeSlideSwitcher(balance != null &&
                          externalAccount != null
                      ? Align(
                          key: ValueKey<PayRequest_SourceType?>(
                              cubit.state.source),
                          alignment: Alignment.center,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: cubit.state.source ==
                                        PayRequest_SourceType.account
                                    ? 'Account Balance'
                                    : externalAccount.brand.isNotEmpty
                                        ? '${externalAccount.brand} ending in ${externalAccount.last4}'
                                        : externalAccount.bankName,
                                style: const TextStyle(
                                    fontFamily: 'Avenir', fontSize: 14.0)),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: GlobalSpacingFactor.one),
                                    child: AnimatedRotation(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.easeOut,
                                        turns: open ? -0.5 : 0.0,
                                        child: const FaIcon(
                                            FontAwesomeIcons.chevronDown,
                                            size: 14.0,
                                            color: Colors.green))))
                          ])))
                      : Container()));
            }));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmationCubit, ConfirmationCubitState>(
        listener: (context, state) {
          if (state.errorMessage?.isNotEmpty == true) {
            final TextStyle style = Theme.of(context).textTheme.bodyText1!;
            final Widget content =
                Wrap(runSpacing: GlobalSpacingFactor.one, children: [
              RichText(
                  text: TextSpan(children: [
                const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: FaIcon(FontAwesomeIcons.exclamationTriangle,
                        color: Colors.white, size: 14.0)),
                TextSpan(
                    text: ' Error',
                    style: style.copyWith(fontWeight: FontWeight.bold))
              ])),
              const SizedBox(width: double.infinity),
              Text(state.errorMessage!, textAlign: TextAlign.left, style: style)
            ]);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  content: Container(child: content)));
          }
          if (state.success && state.activity != null) {
            AutoRouter.of(context)
                .replace(ConfirmationScreenRoute(activity: state.activity!));
          }
        },
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: DogeColors.background,
                actions: [
                  Padding(
                      padding:
                          const EdgeInsets.only(right: GlobalSpacingFactor.two),
                      child: BlocBuilder<ConfirmationCubit,
                          ConfirmationCubitState>(builder: (context, state) {
                        final cubit = context.read<ConfirmationCubit>();
                        return OutlinedButton(
                            onPressed: () {
                              final int amountInt = amount.toInt() * 100;
                              final int decimalInt = decimalInput.isNotEmpty
                                  ? int.parse(decimalInput.substring(
                                      0, decimalInput.length))
                                  : 0;
                              final int total = amountInt + decimalInt;
                              if (total < 50) {
                                return setState(() => warn =
                                    'Amount must be greater than \$0.50');
                              }
                              widget.activity == Activity_ActivityType.pay
                                  ? cubit.submitPayment(
                                      amount: total,
                                      source: state.source,
                                      to: widget.doge.id.toInt())
                                  : cubit.submitRequest(
                                      amount: total,
                                      to: widget.doge.id.toInt());
                            },
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.green),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        GlobalSpacingFactor.one))),
                            child: state.loading
                                ? ModifiedProgressIndicator(color: Colors.white)
                                : Text(
                                    widget.activity == Activity_ActivityType.pay
                                        ? 'pay'
                                        : 'request',
                                    style:
                                        const TextStyle(color: Colors.white)));
                      }))
                ],
                title: widget.activity == Activity_ActivityType.pay
                    ? selection()
                    : const Text('confirm'),
                elevation: 0.0),
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                  padding: const EdgeInsets.all(GlobalSpacingFactor.four),
                  child: DogeLineItem(by: '', doge: widget.doge, dark: false)),
              FadeSlideSwitcher(Text(warn, key: ValueKey<String>(warn)),
                  curve: Curves.bounceOut,
                  offsetTween: Tween<Offset>(
                      begin: const Offset(-1 / 12, 0), end: Offset.zero)),
              const SizedBox(height: GlobalSpacingFactor.two * 8),
              buildAmount(),
              buildNumPad()
            ])));
  }
}
