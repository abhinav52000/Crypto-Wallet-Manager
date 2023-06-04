import 'package:bloc/bloc.dart';
import 'package:connectmywallet/network/models/error_response.dart';
import 'package:connectmywallet/network/models/get_my_balance/get_my_balance_model.dart';
import 'package:connectmywallet/network/models/get_my_balance/get_my_balance_response.dart';
import 'package:connectmywallet/network/repository/main_flow_repository.dart';
import 'package:meta/meta.dart';
part 'get_my_balnce_state.dart';

class GetMyBalnceCubit extends Cubit<GetMyBalnceState> {
  GetMyBalnceCubit({required this.repository})
      : super(GetMyBalnceInitialState());
  final MainFlowRepository repository;

  void getMyBalance({required String address}) {
    try {
      repository.getMyBalance(address: address).then((value) {
        if (value is GetMyBalanceResponse) {
          emit(GetMyBalanceLoadedState(
              getMyBalanceModel: value.getMyBalanceModel));
        } else if (value is ErrorResponse) {
          emit(GetMyBalnceErrorState(error: value.description ?? ''));
        }
      });
    } catch (e) {
      emit(GetMyBalnceErrorState(error: 'We Have an Error'));
    }
  }
}
