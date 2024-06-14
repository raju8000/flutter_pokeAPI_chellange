import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../interfaces/base_network_model.dart';

class NetworkDecoder {

  static var shared = NetworkDecoder();

  T decode<T extends BaseNetworkModel>({required Response<dynamic> response, required T responseType}) {
    try {
      if (response.data is List) {
        var list = response.data as List;
        var dataList = List<T>.from(list.map((item) => responseType.fromJson(item)).toList()) as T;
        return dataList;
      } else {
        var data = responseType.fromJson(response.data) as T;
        return data;
      }
    } on TypeError catch (e) {
      debugPrint(e.stackTrace.toString());
      throw e;
    }
  }
  
}
