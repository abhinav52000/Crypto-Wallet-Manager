import 'package:connectmywallet/network/data_providers/network_mapper.dart';
import 'package:connectmywallet/network/network_client/requests/protocol/request_protocol.dart';

abstract class NetworkClient {
  Future<Mappable> execute(
      {required HttpRequestProtocol request, required Mappable responseType});
}
