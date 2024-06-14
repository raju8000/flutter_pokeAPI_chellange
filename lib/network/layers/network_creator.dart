import 'dart:io';
import 'package:dio/dio.dart';
import '../interfaces/base_client_generator.dart';
import '../network_options/network_options.dart';

class NetworkCreator {
  static var shared = NetworkCreator();
  final Dio _client = Dio();

  Future<Response> request({required BaseClientGenerator route,NetworkOptions? options}) {
    //_client.options.contentType= Headers.formUrlEncodedContentType;
    /*if(kDebugMode) {
      _client.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: false,
      responseHeader: false,
      responseBody: true,
    ));
    }*/

      return _client.fetch(RequestOptions(
        baseUrl: route.baseURL,
        method: route.method,
        path: route.path,
        queryParameters: route.queryParameters,
        data: route.body,
        headers: route.header,
        sendTimeout:  Duration(seconds: route.sendTimeout),
        receiveTimeout: Duration(seconds: route.receiveTimeOut),
        onReceiveProgress: options?.onReceiveProgress,
        validateStatus: (statusCode) => (statusCode! >= HttpStatus.ok && statusCode <= HttpStatus.multipleChoices)
      ));
  }
}
