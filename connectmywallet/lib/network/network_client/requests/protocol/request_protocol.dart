import 'package:connectmywallet/network/network_constant/networ_environment_manager.dart';

class HttpMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

/// The request's encoding type.
enum ContentEncoding { url, json }

abstract class HttpRequestProtocol {
  String get baseUrl => NetworkEnvironmentManager().baseUrl;

  String get isAuthRequest;
  String get path;
  String get method;

  Map<String, String> get headers => {};
  Map<String, String> get git => {};

  Map<String, dynamic>? get parameters;

  ContentEncoding get contentEncoding;

  String get queryParameters {
    if (method == HttpMethod.get && parameters != null) {
      final Uri jsonString = Uri(queryParameters: parameters);
      return '?${jsonString.query}';
    } else {
      return '';
    }
  }
}
