import 'package:bazar/modules/home/presentation/screens/home_screen_body.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bazar/core/utils/enums.dart';
import 'package:bazar/modules/home/presentation/controllers/navigation_cubit/navigation_cubit.dart';
import 'package:bazar/modules/home/presentation/screens/category_screen.dart';
import 'package:bazar/modules/home/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:bazar/modules/order_management/presentation/screens/cart_screen.dart';
import 'package:bazar/modules/profile/presentation/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return Center(child: HomeScreenBody());
          } else if (state.navbarItem == NavbarItem.category) {
            return CategoryScreen();
          } else if (state.navbarItem == NavbarItem.cart) {
            return CartScreen();
          } else if (state.navbarItem == NavbarItem.profile) {
            return ProfileScreen();
          }
          return SizedBox();
        },
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
