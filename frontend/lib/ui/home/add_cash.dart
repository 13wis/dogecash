part of 'home_screen.dart';

class AddCashScreen extends StatefulWidget {
  @override
  _AddCashScreenState createState() => _AddCashScreenState();
}

class _AddCashScreenState extends State<AddCashScreen>
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
          if (state.success) {
            final int amountInt = amount.toInt() * 100;
            final int decimalInt = decimalInput.isNotEmpty
                ? int.parse(decimalInput.substring(0, decimalInput.length))
                : 0;
            final int total = amountInt + decimalInt;
            AutoRouter.of(context).replace(ConfirmationScreenRoute(
                activity: Activity(
                    activityType: Activity_ActivityType.add_cash,
                    amount: makeLongInt(total))));
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
                              cubit.submitAddCash(amount: total);
                            },
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.green),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        GlobalSpacingFactor.one))),
                            child: state.loading
                                ? ModifiedProgressIndicator(color: Colors.white)
                                : const Text('add cash',
                                    style: TextStyle(color: Colors.white)));
                      }))
                ],
                title: const Text('confirm'),
                elevation: 0.0),
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
