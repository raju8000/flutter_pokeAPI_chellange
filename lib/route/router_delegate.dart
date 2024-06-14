import 'package:flutter/material.dart';
import 'package:pokemon_challenge/provider/page_notifier.dart';
import 'package:pokemon_challenge/route/app_route.dart';
import 'package:pokemon_challenge/screens/home/screen_home.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_detail.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_list.dart';
import 'package:pokemon_challenge/screens/not_found/screen_not_found.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final PageNotifier notifier;

  AppRouterDelegate({required this.notifier});

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          if (notifier.isUnknown) const MaterialPage(child: PageNotFound()),
          //if (!notifier.isUnknown) const MaterialPage(child: ScreenPokemon()),
          if (notifier.pageName == ScreenHome.routeName)
            const MaterialPage(child: ScreenHome()),
          if (notifier.pageName == ScreenPokemon.routeName)
            const MaterialPage(child: ScreenPokemon()),
          if (notifier.pageName == ScreenPokemonDetail.routeName)
            const MaterialPage(child: ScreenPokemonDetail()),
        ],
        onPopPage: (route, result) => route.didPop(result)
    );
  }

  @override
  AppRoute? get currentConfiguration {

    if (notifier.pageName == ScreenHome.routeName) {
      return AppRoute.home();
    }
    if (notifier.pageName == ScreenPokemon.routeName) {
      return AppRoute.pokemon();
    }
    if (notifier.pageName == ScreenPokemonDetail.routeName) {
      return AppRoute.pokemonDetail();
    }

    if (notifier.isUnknown) {
      return AppRoute.unknown();
    }

    return AppRoute.unknown();
  }

//This is called whenever the system detects a new route is passed
  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {

    if (configuration.isHome) {
      _updateRoute(page: ScreenHome.routeName);
    }
    if (configuration.isPokemon) {
      _updateRoute(page: ScreenPokemon.routeName);
    }
    if (configuration.isPokemonDetail) {
      _updateRoute(page: ScreenPokemonDetail.routeName);
    }
    if (configuration.isUnknown) {
      _updateRoute(page: null, isUnknown: true);
    }
    ///Here
  }

  _updateRoute({String? page, bool isUnknown = false}) {
    notifier.changePage(page: page, unknown: isUnknown);
  }
}