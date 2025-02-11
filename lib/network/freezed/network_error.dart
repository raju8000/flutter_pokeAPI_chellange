import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_error.freezed.dart';

@freezed
class NetworkError with _$NetworkError implements Exception{

  const NetworkError._() : super();

  const factory NetworkError.request({required DioError error}) = _ResponseError;
  const factory NetworkError.type({String? error}) = _DecodingError;
  const factory NetworkError.connectivity({String? message}) = _Connectivity;

 /* String? get localizedErrorMessage {
    return when<String?>(
      type: (error) => error,
      connectivity: (message) => message,
      request: (DioError error) => error.message,
    );
  }*/

}