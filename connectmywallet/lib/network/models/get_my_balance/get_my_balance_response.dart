import 'package:connectmywallet/network/data_providers/network_mapper.dart';
import 'package:connectmywallet/network/models/get_my_balance/get_my_balance_model.dart';

class GetMyBalanceResponse extends BaseMappable {
  late GetMyBalanceModel getMyBalanceModel;

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    getMyBalanceModel = GetMyBalanceModel.fromJson(json);
    return this;
  }
}
