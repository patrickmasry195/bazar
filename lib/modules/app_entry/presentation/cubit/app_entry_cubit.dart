import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_entry_state.dart';

class AppEntryCubit extends Cubit<AppEntryState> {
  AppEntryCubit() : super(AppEntryInitial());
}
