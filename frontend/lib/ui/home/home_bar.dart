part of 'home_screen.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({required VoidCallback onTap, Key? key})
      : super(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            title: const Text('dogecash.'),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Avenir',
                fontSize: 24.0),
            actions: [
              Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.only(right: GlobalSpacingFactor.two),
                  child: const FaIcon(FontAwesomeIcons.search, size: 24.0)),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: GlobalSpacingFactor.two),
                  child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                    final ViewerResponse? viewer = state.viewer;
                    return viewer != null &&
                            viewer.doge.profilePicUrl.isNotEmpty
                        ? SizedBox(
                            height: 30.0,
                            width: 30.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(viewer.doge.profilePicUrl,
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                  if (wasSynchronouslyLoaded) {
                                    return child;
                                  }
                                  return Shimmer.fromColors(
                                      child: const SizedBox.expand(),
                                      baseColor: Colors.green,
                                      highlightColor: Colors.green.shade50);
                                })))
                        : GestureDetector(
                            onTap: onTap,
                            child: Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0)),
                                child: Text('profile',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))));
                  }))
            ],
            centerTitle: false,
            key: key);
}
