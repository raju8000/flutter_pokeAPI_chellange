import 'package:flutter/foundation.dart';

class ApiServices{

  static const String baseLocalUrl ="https://pokeapi.co/api/v2/pokemon/";
  static const String liveUrl ="https://pokeapi.co/api/v2/pokemon/";
  static const String baseUrl = kDebugMode ? baseLocalUrl: liveUrl;

  static const String pokemon = "";
  static const String detail = "";

}