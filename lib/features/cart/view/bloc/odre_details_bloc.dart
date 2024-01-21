import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';

part 'odre_details_event.dart';
part 'odre_details_state.dart';
/// to manage  order Items 
/// 
class OrderDetailsBloc extends Bloc<OrderDetailsRequest, OrderDetailsState> {
  OrderDetailsBloc() : super(OdreDetailsLoading()) {
    
  }
  
}
