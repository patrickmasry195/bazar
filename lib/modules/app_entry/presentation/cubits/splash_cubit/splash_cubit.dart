import 'package:flutter/services.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> initializeApp() async {
    try {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

      await Future.delayed(Duration(seconds: 4));

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      emit(SplashLoaded());
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}
