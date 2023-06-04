import 'dart:async';
import 'dart:convert';
import 'package:connectmywallet/network/data_providers/network_client.dart';
import 'package:connectmywallet/network/network_client/requests/protocol/request_protocol.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/error_response.dart';
import 'http_request_class.dart';
import 'network_mapper.dart';

class HTTPRequestExecutor extends NetworkClient {
  HTTPRequestExecutor({required this.client});
  Client client;

  @override
  Future<Mappable> execute(
      {required HttpRequestProtocol request,
      required Mappable responseType}) async {
    StreamedResponse response;
    Request httpRequest;
    try {
      httpRequest = HttpRequestCustom(request);
      debugPrint('\n\n-----------------------------------');
      response =
          await client.send(httpRequest).timeout(const Duration(seconds: 20));
      debugPrint(
          'url: ${httpRequest.method} ${request.baseUrl}${request.path}');
      debugPrint('headers: ${httpRequest.headers}');
      debugPrint('body: ${httpRequest.body}');
      debugPrint(' Response statusCode : ${response.statusCode}');
      debugPrint('jsonResponseObject : $response');
      debugPrint('\n\n-----------------------------------');
      return parseResponse(response, responseType);
    } on ClientException {
      final Map<String, dynamic> responseError = <String, dynamic>{
        'error_code': '1001',
        'description': 'Description Here'
      };
      final ErrorResponse errorObject =
          ErrorResponse().fromJson(responseError) as ErrorResponse;
      return errorObject;
    } on TimeoutException catch (exception) {
      debugPrint(exception.toString());
      final Map<String, dynamic> responseError = <String, dynamic>{
        'error_code': '1001',
        'description': 'Description Here'
      };
      final ErrorResponse errorObject =
          ErrorResponse().fromJson(responseError) as ErrorResponse;
      return errorObject;
    } catch (error) {
      final Map<String, dynamic> responseError = <String, dynamic>{
        'error_code': '1001',
        'description': 'Description Here'
      };
      final ErrorResponse errorObject =
          ErrorResponse().fromJson(responseError) as ErrorResponse;
      return errorObject;
    }
  }

  Future<Mappable> parseResponse(
      StreamedResponse response, Mappable responseType) async {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      print(response.statusCode);
      final String data = await response.stream.transform(utf8.decoder).join();
      if (data.isNotEmpty) {
        final Mappable jsonResponse = Mappable(responseType, data);
        return jsonResponse;
      } else {
        return responseType;
      }
    } else {
      final String data = await response.stream.transform(utf8.decoder).join();
      debugPrint('jsonResponse: $data');
      return Mappable(ErrorResponse(), data);
    }
  }
}
