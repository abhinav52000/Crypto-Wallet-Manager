import '../data_providers/network_mapper.dart';

class DefaultSuccessResponse extends BaseMappable {
  late String status;

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    print(json);
    //TODO: Handle Session

    return this;
  }
}
