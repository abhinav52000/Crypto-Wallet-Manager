import 'package:connectmywallet/network/data_providers/network_client.dart';

class AuthFlowDataProvider {
  AuthFlowDataProvider({required this.networkClient});
  NetworkClient networkClient;

  // Future<Mappable> login({required String emailId, required String password}) async {
  //   LoginRequest request = LoginRequest(email: emailId, password: password);
  //   return networkClient.execute(request: request, responseType: DefaultSuccessResponse());
  // }
}
