part of 'get_my_balnce_cubit.dart';

@immutable
abstract class GetMyBalnceState {}

class GetMyBalnceInitialState extends GetMyBalnceState {}

class GetMyBalanceLoadedState extends GetMyBalnceState {
  final GetMyBalanceModel getMyBalanceModel;

  GetMyBalanceLoadedState({required this.getMyBalanceModel});
}

class GetMyBalnceErrorState extends GetMyBalnceState {
  final String error;
  GetMyBalnceErrorState({required this.error});
}
