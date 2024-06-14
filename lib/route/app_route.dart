import 'package:pokemon_challenge/screens/home/screen_home.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_detail.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_list.dart';


class AppRoute {
  final String? pageName;
  final bool _isUnknown;

  AppRoute.home(): pageName =  ScreenHome.routeName,
        _isUnknown = false;

  AppRoute.pokemon(): pageName =  ScreenPokemon.routeName,
        _isUnknown = false;

  AppRoute.pokemonDetail(): pageName =  ScreenPokemonDetail.routeName,
        _isUnknown = false;
  ///Here
  AppRoute.unknown()
      : pageName = null,
        _isUnknown = true;

//Used to get the current path
  bool get isHome => pageName == ScreenHome.routeName;
  bool get isPokemon => pageName == ScreenPokemon.routeName;
  bool get isPokemonDetail => pageName == ScreenPokemonDetail.routeName;
  ///Here
  bool get isUnknown => _isUnknown;
}