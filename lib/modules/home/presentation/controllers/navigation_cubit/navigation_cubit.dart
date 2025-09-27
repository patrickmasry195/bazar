import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bazar/core/utils/enums.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.category:
        emit(NavigationState(NavbarItem.category, 1));
        break;
      case NavbarItem.cart:
        emit(NavigationState(NavbarItem.cart, 2));
        break;
      case NavbarItem.profile:
        emit(NavigationState(NavbarItem.profile, 3));
        break;
    }
  }
}
