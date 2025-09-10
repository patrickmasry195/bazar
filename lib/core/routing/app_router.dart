import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/modules/app_entry/presentation/screens/onboarding_screen.dart';
import 'package:bazar/modules/app_entry/presentation/screens/splash_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/sign_in_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/sign_up_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/user_policy_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(
        path: RoutePaths.kOnboardingPath,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: RoutePaths.kSignInPath,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: RoutePaths.kSignUpPath,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: RoutePaths.kUserPolicyPath,
        builder: (context, state) => UserPolicyScreen(),
      ),
    ],
  );
}
