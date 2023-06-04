import 'package:connectmywallet/network/data_providers/main_flow_data_provider.dart';
import 'package:connectmywallet/network/data_providers/network_mapper.dart';

class MainFlowRepository {
  MainFlowRepository({required this.dataProvider});

  final MainFlowDataProvider dataProvider;

  Future<Mappable> getMyBalance({required String address}) {
    return dataProvider.getMyBalance(address: address);
  }

  Future<Mappable> sendToken(
      {required String recieverAddress, required String amount}) {
    return dataProvider.sendToken(
        recieverAddress: recieverAddress, amount: amount);
  }
}
