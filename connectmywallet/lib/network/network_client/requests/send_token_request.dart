import 'package:connectmywallet/network/network_client/requests/protocol/request_protocol.dart';
import 'package:connectmywallet/network/network_constant/networ_environment_manager.dart';
import 'package:connectmywallet/network/network_constant/network_constants.dart';

class SendTokenRequest extends HttpRequestProtocol {
  SendTokenRequest({required this.recieverAddress, required this.amount});
  final String recieverAddress, amount;

  @override
  String get method => HttpMethod.post;

  @override
  String get isAuthRequest => '';

  @override
  ContentEncoding get contentEncoding => ContentEncoding.json;

  @override
  String get path => NetworkConstants.getBalanceEndpoint;

  @override
  Map<String, dynamic>? get parameters => {
        "module": 'account',
        "action": 'sendToken',
        "address": recieverAddress,
        'apiKey': NetworkEnvironmentManager().apiKey
      };
}
