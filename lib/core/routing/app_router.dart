import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'package:bazar/core/routing/route_paths.dart';
import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/modules/app_entry/presentation/screens/onboarding_screen.dart';
import 'package:bazar/modules/app_entry/presentation/screens/splash_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/email_verification_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/forgot_password_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/phone_number_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/phone_number_verification_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/reset_password_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/set_new_password_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/sign_in_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/sign_up_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/success_screen.dart';
import 'package:bazar/modules/auth/presentation/screens/user_policy_screen.dart';
import 'package:bazar/modules/home/presentation/screens/home_screen.dart';

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
        builder: (context, state) {
          final sourceString = state.uri.queryParameters['source'];
          final VerificationSource source = VerificationSource.values
              .firstWhere(
                (e) => e.name == sourceString,
                orElse: () => VerificationSource.signUp,
              );

          final email = state.uri.queryParameters['email'] ?? '';

          return EmailVerificationScreen(source: source, email: email);
        },
      ),
      GoRoute(
        path: RoutePaths.kPhoneNumberScreenPath,
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';
          final sourceString = state.uri.queryParameters['source'];
          final VerificationSource source = VerificationSource.values
              .firstWhere(
                (e) => e.name == sourceString,
                orElse: () => VerificationSource.signUp,
              );
          return PhoneNumberScreen(email: email, source: source);
        },
      ),
      GoRoute(
        path: RoutePaths.kPhoneNumberVerificationScreenPath,
        builder: (context, state) {
          final sourceString = state.uri.queryParameters['source'];
          final VerificationSource source = VerificationSource.values
              .firstWhere(
                (e) => e.name == sourceString,
                orElse: () => VerificationSource.signUp,
              );

          final phoneString =
              state.uri.queryParameters['phone'] ??
              state.uri.queryParameters['phone_number'] ??
              '';
          final email = state.uri.queryParameters['email'] ?? '';

          PhoneNumber phoneNumber;
          try {
            phoneNumber = PhoneNumber.fromCompleteNumber(
              completeNumber: phoneString,
            );
          } catch (_) {
            final match = RegExp(r'^(\\+\\d+)?(.*)').firstMatch(phoneString);
            final countryCode = match?.group(1) ?? '';
            final number = match?.group(2)?.trim() ?? phoneString;
            phoneNumber = PhoneNumber(
              countryCode: countryCode,
              number: number,
              countryISOCode: '',
            );
          }

          return PhoneNumberVerificationScreen(
            phoneNumber: phoneNumber,
            source: source,
            email: email,
          );
        },
      ),
      GoRoute(
        path: RoutePaths.kForgotPasswordPath,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: RoutePaths.kResetPasswordPath,
        builder: (context, state) {
          final methodParam = state.pathParameters['method'];
          final resetMethod = ResetMethod.fromString(methodParam);

          return ResetPasswordScreen(resetMethod: resetMethod);
        },
      ),
      GoRoute(
        path: RoutePaths.kSetNewPasswordPath,
        builder: (context, state) => SetNewPasswordScreen(),
      ),
      GoRoute(
        path: RoutePaths.kSuccessScreenPath,
        builder: (context, state) {
          final source =
              state.extra as VerificationSource? ?? VerificationSource.signUp;
          return SuccessScreen(source: source);
        },
      ),
      GoRoute(
        path: RoutePaths.kHomeScreenPath,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
