part of 'home_screen.dart';

class ProfileScreen
    extends BlocBuilder<AuthenticationBloc, AuthenticationState> {
  ProfileScreen({required VoidCallback onTap, Key? key})
      : super(
            builder: (context, state) {
              final BaseDoge? doge = state.viewer?.doge;
              final style = Theme.of(context).textTheme.headline4;
              return Scaffold(
                  appBar: AppBar(
                      leading: GestureDetector(
                          onTap: onTap,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('×',
                                  style: style!.copyWith(
                                      fontWeight: FontWeight.normal)))),
                      elevation: 0.0,
                      backgroundColor: DogeColors.background),
                  body: Padding(
                      padding: const EdgeInsets.all(GlobalSpacingFactor.two),
                      child: doge != null
                          ? Column(children: [
                              if (doge.profilePicUrl.isNotEmpty)
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        GlobalSpacingFactor.one),
                                    child: Image.network(doge.profilePicUrl,
                                        height: 75.0,
                                        width: 75.0, frameBuilder: (context,
                                            child,
                                            frame,
                                            wasSynchronouslyLoaded) {
                                      if (wasSynchronouslyLoaded) {
                                        return child;
                                      }
                                      return Shimmer.fromColors(
                                          child: const SizedBox.expand(),
                                          baseColor: Colors.green,
                                          highlightColor: Colors.green.shade50);
                                    }))
                              else if (doge.firstName.isNotEmpty)
                                Container(
                                    width: 75.0,
                                    height: 75.0,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(
                                            GlobalSpacingFactor.one)),
                                    alignment: Alignment.center,
                                    child: Text(doge.firstName.characters.first,
                                        style: const TextStyle(
                                            fontSize: 36.0,
                                            fontWeight: FontWeight.bold))),
                              const SizedBox(height: GlobalSpacingFactor.two),
                              Text('${doge.firstName} ${doge.lastName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              Text(doge.dogetag,
                                  style: Theme.of(context).textTheme.headline6),
                              const SizedBox(height: GlobalSpacingFactor.four),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: GlobalSpacingFactor.two),
                                  child: Row(children: [
                                    Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                GlobalSpacingFactor.one)),
                                        alignment: Alignment.center,
                                        child: const FaIcon(
                                            FontAwesomeIcons.userAstronaut)),
                                    const SizedBox(
                                        width: GlobalSpacingFactor.two),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Personal info',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          const Text(
                                              'Update your stripe information')
                                        ])
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: GlobalSpacingFactor.two),
                                  child: Row(children: [
                                    Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                GlobalSpacingFactor.one)),
                                        alignment: Alignment.center,
                                        child: const FaIcon(
                                            FontAwesomeIcons.creditCard)),
                                    const SizedBox(
                                        width: GlobalSpacingFactor.two),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Linked account',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          const Text('Change your linked card')
                                        ])
                                  ])),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: GlobalSpacingFactor.two),
                                  child: Row(children: [
                                    Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                GlobalSpacingFactor.one)),
                                        alignment: Alignment.center,
                                        child: const FaIcon(
                                            FontAwesomeIcons.userAstronaut)),
                                    const SizedBox(
                                        width: GlobalSpacingFactor.two),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Dogetag',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          const Text('Change your \$dogetag')
                                        ])
                                  ])),
                              const SizedBox(height: GlobalSpacingFactor.four),
                              DogeButton('logout', onPressed: () {
                                context
                                    .read<AuthenticationBloc>()
                                    .add(const AuthenticationLogoutRequested());
                                AutoRouter.of(context)
                                    .replaceAll([AuthScreenRoute(page: 1)]);
                              })
                            ])
                          : const Center(child: Text('unexpected no viewer'))));
            },
            key: key);
}
