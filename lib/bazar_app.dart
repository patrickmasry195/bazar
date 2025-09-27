import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bazar/core/routing/app_router.dart';
import 'package:bazar/core/theme/theme_data/theme_data_light.dart';
import 'package:bazar/modules/home/presentation/controllers/navigation_cubit/navigation_cubit.dart';

class BazarApp extends StatelessWidget {
  const BazarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NavigationCubit())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: getLightTheme(),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
