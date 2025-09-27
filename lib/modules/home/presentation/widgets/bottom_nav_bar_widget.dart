import 'package:bazar/core/theme/app_color/app_color_light.dart';
import 'package:bazar/core/theme/app_text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/modules/home/presentation/controllers/navigation_cubit/navigation_cubit.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColorLight.primaryColor,
          unselectedItemColor: AppColorLight.hintTextColor,
          showUnselectedLabels: true,
          selectedLabelStyle: AppTextStyles.bodySmallMedium,
          unselectedLabelStyle: AppTextStyles.bodySmallMedium,
          onTap: (index) {
            if (index == 0) {
              BlocProvider.of<NavigationCubit>(
                context,
              ).getNavBarItem(NavbarItem.home);
            } else if (index == 1) {
              BlocProvider.of<NavigationCubit>(
                context,
              ).getNavBarItem(NavbarItem.category);
            } else if (index == 2) {
              BlocProvider.of<NavigationCubit>(
                context,
              ).getNavBarItem(NavbarItem.cart);
            } else if (index == 3) {
              BlocProvider.of<NavigationCubit>(
                context,
              ).getNavBarItem(NavbarItem.profile);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.list),
              label: 'Category',
            ),

            BottomNavigationBarItem(
              icon: Icon(LucideIcons.shoppingCart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
