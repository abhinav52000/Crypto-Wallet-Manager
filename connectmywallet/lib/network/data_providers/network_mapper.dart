import 'dart:convert';

// Handler for the network's request.
abstract class RequestMappable {
  Map<String, dynamic> toJson();
}

// Handler for the network's response.
abstract class Mappable {
  factory Mappable(Mappable type, String data) {
    if (type is BaseMappable) {
      final Map<String, dynamic> mappingData = json.decode(data);
      return type.fromJson(mappingData);
    } else if (type is ListMappable) {
      final Iterable<dynamic> iterableData = json.decode(data);
      return type.fromJsonList(iterableData);
    } else if (type is ErrorMappable) {
      final Map<String, dynamic> mappingData = json.decode(data);
      return type.fromJson(mappingData);
    }
    return Mappable(type, data);
  }
}

//Mappable for Dictionary type models
abstract class BaseMappable<T> implements Mappable {
  Mappable fromJson(Map<String, dynamic> json);
}

//Mappable for List type models
abstract class ListMappable<T> implements Mappable {
  Mappable fromJsonList(Iterable json);
}

// Handler for the network's error response.
abstract class ErrorMappable implements BaseMappable<dynamic> {
  String? errorCode;
  String? description;
  String? localizedDescription;

  @override
  Mappable fromJson(Map<String, dynamic> json);
}
