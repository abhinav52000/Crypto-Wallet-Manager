import '../data_providers/network_mapper.dart';

class ErrorResponse implements ErrorMappable, BaseMappable {
  @override
  Mappable fromJson(Map<String, dynamic> json) {
    description = json['description'] ?? '';
    errorCode = '${json['code']}';
    message = json['message'];
    return this;
  }

  @override
  String? description;

  @override
  String? localizedDescription;

  @override
  String? errorCode;

  String? message;
}
