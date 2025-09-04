import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_management_state.dart';

class OrderManagementCubit extends Cubit<OrderManagementState> {
  OrderManagementCubit() : super(OrderManagementInitial());
}
