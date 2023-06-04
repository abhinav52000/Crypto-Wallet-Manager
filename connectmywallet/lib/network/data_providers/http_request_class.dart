import 'dart:convert';
import 'dart:typed_data';
import 'package:connectmywallet/network/network_client/requests/protocol/request_protocol.dart';
import 'package:http/http.dart';

class HttpRequestCustom extends Request {
  HttpRequestCustom(this.service)
      : super(
            service.method,
            Uri.parse(
                '${service.baseUrl}${service.path}${service.queryParameters}'));
  final HttpRequestProtocol service;

  @override
  Map<String, String> get headers {
    if (service.headers.isEmpty) {
      print(service.parameters);
      print(service.isAuthRequest);
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': service.isAuthRequest,
        // 'fcmToken': diInstance<FirebaseMessagingHandler>().deviceToken
      };
      return header;
    } else {
      final Map<String, String> header = service.headers;
      // header['fcmToken'] = diInstance<FirebaseMessagingHandler>().deviceToken;
      return header;
    }
  }

  @override
  String get body => json.encode(service.parameters);

  @override
  Uint8List get bodyBytes {
    if (service.parameters == null) {
      return Uint8List(0);
    }

    if (service.contentEncoding == ContentEncoding.url) {
      final Uri queryParameters = Uri(queryParameters: service.parameters);
      final List<int> bodyBytes = utf8.encode(queryParameters.query);
      return Uint8List.fromList(bodyBytes);
    } else {
      final List<int> encodedBody = const Utf8Codec().encode(body);
      return Uint8List.fromList(encodedBody);
    }
  }
}
