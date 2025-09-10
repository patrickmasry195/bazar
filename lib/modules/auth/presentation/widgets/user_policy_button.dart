import 'package:bazar/core/routing/route_paths.dart';
import 'package:flutter/material.dart';

import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class UserPolicyButton extends StatelessWidget {
  const UserPolicyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "By clicking Register, you agree to our",
            style: AppTextStyles.bodyMediumSemiBold.copyWith(
              color: AppColorLight.hintTextColor,
            ),
          ),
          TextButton(
            onPressed: () =>
                GoRouter.of(context).push(RoutePaths.kUserPolicyPath),
            child: Text(
              "Terms and Data Policy.",
              style: AppTextStyles.bodyMediumSemiBold.copyWith(
                color: AppColorLight.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
