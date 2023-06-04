import 'package:connectmywallet/network/data_providers/network_client.dart';
import 'package:connectmywallet/network/data_providers/server_data_provider.dart';
import 'auth_data_provider.dart';
import 'main_flow_data_provider.dart';

class APIClient implements ServerDataProvider {
  APIClient({required this.networkClient});
  NetworkClient networkClient;

  @override
  AuthFlowDataProvider get authAPIDataProvider {
    return AuthFlowDataProvider(networkClient: networkClient);
  }

  @override
  MainFlowDataProvider get mainAPIDataProvider {
    return MainFlowDataProvider(networkClient: networkClient);
  }
}
