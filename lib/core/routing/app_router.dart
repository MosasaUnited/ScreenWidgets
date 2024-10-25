import 'package:go_router/go_router.dart';
import 'package:screens/features/auth_with_animation/screens/auth_with_animation.dart';
import 'package:screens/features/buttons/screens/buttons_screen.dart';
import 'package:screens/features/color_loader/color_loaders_view.dart';
import 'package:screens/features/explore_collection_card/screens/explore_collection_card.dart';
import 'package:screens/features/main_screen.dart';
import 'package:screens/features/nothing/screens/nothing_example.dart';
import 'package:screens/features/signin_signup_screen/screens/signin_signup_screen.dart';

abstract class AppRouter {
  static const kAuthWithAnimation = '/authWithAnimation';
  static const kExploreCollectionCard = '/exploreCollectionCard';
  static const kNothingExample = '/nothingExample';
  static const kGoToSignInSignUp = '/goToSignInSignUp';
  static const kButtonsScreen = '/buttonsScreen';
  static const kColorLoaders = '/colorLoaders';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        path: kAuthWithAnimation,
        builder: (context, state) => const AuthWithAnimation(),
      ),
      GoRoute(
        path: kExploreCollectionCard,
        builder: (context, state) => ExploreCollectionCard(
          title: 'Explore Collection Card',
          bodyText: 'Explore Collection Card body',
          imageUrl: '',
          onTap: () {},
        ),
      ),
      GoRoute(
        path: kNothingExample,
        builder: (context, state) => const NothingExample(),
      ),
      GoRoute(
        path: kGoToSignInSignUp,
        builder: (context, state) => GoToSignInSignUpScreen(),
      ),
      GoRoute(
        path: kButtonsScreen,
        builder: (context, state) => const ButtonsScreen(),
      ),
      GoRoute(
        path: kColorLoaders,
        builder: (context, state) => const ColorLoadersView(),
      )
    ],
  );
}
