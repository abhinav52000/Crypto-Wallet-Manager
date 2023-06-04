import 'package:connectmywallet/network/data_providers/network_mapper.dart';

class SendTokenResponseModel extends BaseMappable {
  late bool isSent;

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    if (json['status'] == '0') {
      isSent = false;
    } else {
      isSent = true;
    }
    return this;
  }
}
