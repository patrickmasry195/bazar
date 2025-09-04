import 'package:bazar/modules/app_entry/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [GoRoute(path: '/', builder: (context, state) => SplashScreen())],
  );
}
