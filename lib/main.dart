import 'package:flutter/material.dart';

import 'package:bazar/core/routing/app_router.dart';
import 'package:bazar/core/theme/theme_data/theme_data_light.dart';

void main() {
  runApp(const Bazar());
}

class Bazar extends StatelessWidget {
  const Bazar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: getLightTheme(),
      routerConfig: AppRouter.router,
    );
  }
}
