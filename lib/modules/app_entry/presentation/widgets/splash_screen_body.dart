import 'package:bazar/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:bazar/core/utils/assets_paths.dart';
import 'package:bazar/core/widgets/custom_snackbar.dart';
import 'package:bazar/modules/app_entry/presentation/controllers/splash_cubit/splash_cubit.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          Future.delayed(const Duration(seconds: 4), () {
            GoRouter.of(context).go(RoutePaths.kOnboardingPath);
          });
        }
      },
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          switch (state) {
            case SplashLoaded():
              return Stack(
                children: [
                  FadeInUp(
                    child: Row(
                      children: [
                        const SizedBox(width: 80),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SvgPicture.asset(
                            AssetsPaths.logo2,
                            width: 90,
                            height: 45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset(
                      AssetsPaths.logo3,
                      height: 315,
                      width: 316,
                    ),
                  ),
                ],
              );
            case SplashError():
              return Center(
                child: CustomSnackbar(
                  message: state.errMessage,
                  color: Colors.red,
                ),
              );

            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
