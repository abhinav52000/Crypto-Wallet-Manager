import 'package:connectmywallet/network/network_client/requests/protocol/request_protocol.dart';
import 'package:connectmywallet/network/network_constant/networ_environment_manager.dart';
import 'package:connectmywallet/network/network_constant/network_constants.dart';

class GetBalanceRequest extends HttpRequestProtocol {
  GetBalanceRequest({required this.address});
  final String address;

  @override
  String get method => HttpMethod.get;

  @override
  String get isAuthRequest => '';

  @override
  ContentEncoding get contentEncoding => ContentEncoding.json;

  @override
  String get path => NetworkConstants.getBalanceEndpoint;

  @override
  Map<String, dynamic>? get parameters => {
        "module": 'account',
        "action": 'balance',
        "address": address,
        'apiKey': NetworkEnvironmentManager().apiKey
      };
}
