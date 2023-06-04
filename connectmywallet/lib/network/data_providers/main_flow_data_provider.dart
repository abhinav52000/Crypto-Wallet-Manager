import 'package:connectmywallet/network/data_providers/network_client.dart';
import 'package:connectmywallet/network/data_providers/network_mapper.dart';
import 'package:connectmywallet/network/models/get_my_balance/get_my_balance_response.dart';
import 'package:connectmywallet/network/models/send_token/send_token_reponse_model.dart';
import 'package:connectmywallet/network/network_client/requests/get_balance_request.dart';
import 'package:connectmywallet/network/network_client/requests/send_token_request.dart';

class MainFlowDataProvider {
  MainFlowDataProvider({required this.networkClient});
  NetworkClient networkClient;

  Future<Mappable> getMyBalance({required String address}) async {
    GetBalanceRequest request = GetBalanceRequest(address: address);
    return networkClient.execute(
        request: request, responseType: GetMyBalanceResponse());
  }

  Future<Mappable> sendToken(
      {required String recieverAddress, required String amount}) async {
    SendTokenRequest request =
        SendTokenRequest(recieverAddress: recieverAddress, amount: amount);
    return networkClient.execute(
        request: request, responseType: SendTokenResponseModel());
  }
}
