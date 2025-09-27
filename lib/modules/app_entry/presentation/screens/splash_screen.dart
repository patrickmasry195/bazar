import 'package:bazar/modules/app_entry/presentation/controllers/splash_cubit/splash_cubit.dart';
import 'package:bazar/modules/app_entry/presentation/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..initializeApp(),
      child: Scaffold(
        backgroundColor: AppColorLight.primaryColor,
        body: SplashScreenBody(),
      ),
    );
  }
}
