import 'package:bloc/bloc.dart';
import 'package:connectmywallet/network/models/error_response.dart';
import 'package:connectmywallet/network/models/send_token/send_token_reponse_model.dart';
import 'package:connectmywallet/network/repository/main_flow_repository.dart';
import 'package:meta/meta.dart';

part 'send_token_state.dart';

class SendTokenCubit extends Cubit<SendTokenState> {
  SendTokenCubit({required this.repository}) : super(SendTokenInitialState());
  final MainFlowRepository repository;

  void sendToken({required String recieverAddress, required String amount}) {
    emit(SendTokenSendingState());
    try {
      repository
          .sendToken(recieverAddress: recieverAddress, amount: amount)
          .then((value) {
        if (value is SendTokenResponseModel) {
          emit(SendTokenSentState(success: value.isSent));
        } else if (value is ErrorResponse) {
          emit(SendTokenErrorState(error: value.description ?? ''));
        }
      });
    } catch (e) {
      emit(SendTokenErrorState(error: 'We Have an Error'));
    }
  }
}
