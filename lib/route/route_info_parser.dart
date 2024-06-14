import 'package:flutter/material.dart';
import 'package:pokemon_challenge/route/app_route.dart';
import 'package:pokemon_challenge/screens/home/screen_home.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_detail.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_list.dart';


class AppRouteInformationParser extends RouteInformationParser<AppRoute> {

  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isEmpty) {
      return AppRoute.home();
    }

    if (uri.pathSegments.length > 1) {
      return AppRoute.unknown();
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments.first == ScreenHome.routeName) {
        return AppRoute.home();

      }if (uri.pathSegments.first == ScreenPokemon.routeName) {
        return AppRoute.pokemon();
      }
      if (uri.pathSegments.first == ScreenPokemonDetail.routeName) {
        return AppRoute.pokemonDetail();
      }
      ///New screen to add here
    }

    //_unknownPath = uri.path;
    return AppRoute.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoute configuration) {

    if (configuration.isHome) {
      return _getRouteInformation(configuration.pageName!);
    }
    if (configuration.isPokemon || configuration.isPokemonDetail) {
      return _getRouteInformation(configuration.pageName!);
    }

    ///Here

    return const RouteInformation(location: "/");
  }

//Get Route Information depending on the PageName passed
  RouteInformation _getRouteInformation(String page) {
    return RouteInformation(location: "/$page");
  }
}