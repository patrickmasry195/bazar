import 'package:bazar/modules/auth/presentation/screens/phone_number_verification_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/success_verification_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/modules/app_entry/presentation/screens/onboarding_screen.dart';
import 'package:bazar/modules/app_entry/presentation/screens/splash_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/email_verification_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/phone_number_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/sign_in_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/sign_up_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/user_policy_screen.dart';

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
      GoRoute(
        path: RoutePaths.kEmailVerificationPath,
        builder: (context, state) => EmailVerificationScreen(),
      ),
      GoRoute(
        path: RoutePaths.kPhoneNumberScreenPath,
        builder: (context, state) => PhoneNumberScreen(),
      ),
      GoRoute(
        path: RoutePaths.kPhoneNumberVerificationScreenPath,
        builder: (context, state) => PhoneNumberVerificationScreen(),
      ),
      GoRoute(
        path: RoutePaths.kSuccessVerificationScreenPath,
        builder: (context, state) => SuccessVerificationScreen(),
      ),
    ],
  );
}
