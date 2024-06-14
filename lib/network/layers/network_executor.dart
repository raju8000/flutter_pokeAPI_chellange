
import 'package:pokemon_challenge/config/string_constant.dart';
import 'package:pokemon_challenge/extensions/logs.dart';
import '../freezed/network_error.dart';
import '../freezed/result.dart';
import '../network_options/network_options.dart';
import 'network_decoder.dart';
import 'package:dio/dio.dart';
import 'network_connectivity.dart';
import 'network_creator.dart';
import '../interfaces/base_client_generator.dart';
import '../interfaces/base_network_model.dart';

class NetworkExecutor{

  //static bool debugMode = Get.isLogEnable;

  static Future<Result<T,String>> execute<T extends BaseNetworkModel>({required BaseClientGenerator route,required T responseType,NetworkOptions? options,Function(T)? callBack}) async {
     ("API: ${route.baseURL}${route.path}").log();
     ("Body: ${route.body}").log();
     try {
    // Check Network Connectivity
     ///Check Internet
     if (! await NetworkConnectivity.isConnected) {
       ("No Internet Connection").log();
       return const Result.failure(Strings.noInternetConnection);
     }

     var response = await NetworkCreator.shared.request(route: route,options: options);
     ('Response: ${response.data}').log();
     var data = NetworkDecoder.shared.decode<T>(response: response, responseType: responseType);

     return Result.success(data);


    // NETWORK ERROR
      } on DioException catch (diorError) {
        return Result.failure(onDioError<String>(diorError));

        // TYPE ERROR
      } on TypeError catch (e) {
        ("${route.path} Type error=> ${NetworkError.type(error: e.toString())}").log();
        ("${route.path} => ${NetworkError.type(error: e.stackTrace.toString())}").log();
        return const Result.failure(Strings.someThingWentWrong);
      }

      // No Internet Connection
    /*} else {
      ("No Internet Connection").log();
      if(route.shouldDisplayPopUp) {
        Get.defaultDialog(
            title: "",
            content: UiComponent.getInfoDialog(Strings.noInternetConnection.tr)
        );
      }
    }*/
    //return const Result.failure(null);
  }

  static T onDioError<T>(DioException diorError,){
    ("${diorError.requestOptions.path} ERROR=> ${diorError.response?.data?.toString()}").log();
    ("${diorError.requestOptions.path} ERROR=> ${diorError.toString()}").log();

    ///Some thing went wrong
    return (diorError.response!.statusMessage ?? Strings.someThingWentWrong) as T;
  }
}
