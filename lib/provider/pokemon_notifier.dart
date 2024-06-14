import 'package:flutter/cupertino.dart';
import 'package:pokemon_challenge/models/model_pokemons.dart';
import 'package:pokemon_challenge/network/network.dart';

class PokemonNotifier extends ChangeNotifier{
  PageState state = PageState.loading;
  int offset=0,limit = 18;
  String error = "";
  List<Results> results = [];


  Future<void> fetchPokemonList({bool next = false}) async {

    if(offset!=0 && results.isNotEmpty && !next){
      return;
    }
    if(next){
      offset = offset+limit;
    }

    BaseClientGenerator clientGenerator =
    BaseClientGenerator()
      ..body = <String,dynamic>{}
      ..path = "${ApiServices.pokemon}?offset=$offset&limit=$limit"
      ..method = "GET";

    final data= await NetworkExecutor.execute<ModelPokemon>(route: clientGenerator ,responseType: ModelPokemon(),);

    data.when(success: (success){
        results.addAll(success.results??[]);
        state = PageState.success;
      },
      failure: (fail){
        error = fail!;
        state = PageState.error;
      }
    );
    notifyListeners();
  }

  reset(){
    results.clear();
    state = PageState.loading;
  }
}

enum PageState {
  loading,
  success,
  error,
}