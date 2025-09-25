import 'package:flutter/material.dart';

import 'package:bazar/core/routing/app_router.dart';
import 'package:bazar/core/theme/theme_data/theme_data_light.dart';

class BazarApp extends StatelessWidget {
  const BazarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      routerConfig: AppRouter.router,
    );
  }
}
