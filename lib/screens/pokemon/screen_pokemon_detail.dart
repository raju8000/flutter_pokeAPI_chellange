import 'package:flutter/material.dart';
import 'package:pokemon_challenge/config/string_constant.dart';
import 'package:pokemon_challenge/provider/page_notifier.dart';
import 'package:pokemon_challenge/provider/pokemon_detail_notifier.dart';
import 'package:pokemon_challenge/provider/pokemon_notifier.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_list.dart';
import 'package:pokemon_challenge/widgets/pokemon.dart';
import 'package:provider/provider.dart';

class ScreenPokemonDetail extends StatelessWidget {
  const ScreenPokemonDetail({super.key});
  static const routeName = "pokemonDetail";

  @override
  Widget build(BuildContext context) {
    final pokemonDetailNotifier = Provider.of<PokemonDetailNotifier>(context);
    voidGoBack(){
      pokemonDetailNotifier.clearData();
      Provider.of<PageNotifier>(context,listen: false).changePage(page: ScreenPokemon.routeName, unknown: false);
    }
    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(onPressed:()=> voidGoBack(), icon: const Icon(Icons.arrow_back,color: Colors.black,),),
        title: const Text(Strings.pokemonDetail,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),

      body: Column(
        children: [

          if(pokemonDetailNotifier.state == PageState.loading)
            const Expanded(child: Center(child: CircularProgressIndicator())),

          if(pokemonDetailNotifier.state == PageState.success)
            Pokemon(pokemon: pokemonDetailNotifier.pokemonDetail!,),

          if(pokemonDetailNotifier.state == PageState.error)
            const SizedBox.shrink()
        ],
      ),
    );
  }
}
