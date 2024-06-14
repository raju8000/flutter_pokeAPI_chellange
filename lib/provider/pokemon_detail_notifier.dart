import 'package:flutter/cupertino.dart';
import 'package:pokemon_challenge/models/model_pokemon_detail.dart';
import 'package:pokemon_challenge/network/network.dart';
import 'package:pokemon_challenge/provider/pokemon_notifier.dart';
import 'package:pokemon_challenge/widgets/dialog.dart';

class PokemonDetailNotifier extends ChangeNotifier{
  int pokemonId = -1;
  PageState state = PageState.loading;
  PokemonDetail? pokemonDetail;
  String error = "";

  Future<void> getPokemonDetail(String  id, BuildContext context) async {
    BaseClientGenerator clientGenerator =
    BaseClientGenerator()
      ..body = <String,dynamic>{}
      ..path = ApiServices.detail+id
      ..method = "GET";

    final data= await NetworkExecutor.execute<PokemonDetail>(route: clientGenerator ,responseType: PokemonDetail(),);

    data.when(success: (success){
      pokemonDetail = success;
      state = PageState.success;
    },
        failure: (fail){
          error = fail!;
          state = PageState.error;
          showDialog(context);
        }
    );
    notifyListeners();
  }

  showDialog(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    DialogHelper.showWarningDialog(context, error);
  }

  clearData(){
    state = PageState.loading;
    pokemonDetail = null;
  }
}