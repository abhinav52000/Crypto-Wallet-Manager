part of 'send_token_cubit.dart';

@immutable
abstract class SendTokenState {}

class SendTokenInitialState extends SendTokenState {}

class SendTokenSendingState extends SendTokenState {}

class SendTokenSentState extends SendTokenState {
  final bool success;

  SendTokenSentState({required this.success});
}

class SendTokenErrorState extends SendTokenState {
  final String error;

  SendTokenErrorState({required this.error});
}
