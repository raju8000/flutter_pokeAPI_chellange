import 'package:flutter/material.dart';
import 'package:pokemon_challenge/config/string_constant.dart';
import 'package:pokemon_challenge/extensions/string_extension.dart';
import 'package:pokemon_challenge/provider/page_notifier.dart';
import 'package:pokemon_challenge/provider/pokemon_detail_notifier.dart';
import 'package:pokemon_challenge/provider/pokemon_notifier.dart';
import 'package:pokemon_challenge/screens/home/screen_home.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_detail.dart';
import 'package:provider/provider.dart';

class ScreenPokemon extends StatefulWidget {
  const ScreenPokemon({super.key});
  static const routeName = "pokemonList";

  @override
  State<ScreenPokemon> createState() => _ScreenPokemonState();
}

class _ScreenPokemonState extends State<ScreenPokemon> {
  var scrollController = ScrollController();
  var preventCall = false;

  @override
  void initState() {
    scrollController.addListener(onScroll);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonNotifier>(context, listen: false).fetchPokemonList(context);
    });

    super.initState();
  }
  void onScroll() {
    var position = scrollController.position.pixels;
    if (position >= scrollController.position.maxScrollExtent - 25) {
      if (!preventCall) {
        Provider.of<PokemonNotifier>(context, listen: false).fetchPokemonList(context,next: true).then((value) => preventCall=false);
        preventCall = true;
      }
    }
  }
  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonData = Provider.of<PokemonNotifier>(context);
    voidGoBack(){
      pokemonData.reset();
      Provider.of<PageNotifier>(context,listen: false).changePage(page: ScreenHome.routeName, unknown: false);
    }

    final size = MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(onPressed:()=> voidGoBack(), icon: const Icon(Icons.arrow_back,color: Colors.black,),),
        title: const Text(Strings.pokemon,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),

      body: Column(
        children: [
          if(pokemonData.state == PageState.loading)
          const Expanded(child: Center(child: CircularProgressIndicator())),

          if(pokemonData.state == PageState.success)
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                itemCount: pokemonData.results.length+1,
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.02),
                  itemBuilder: (context, index){
                    return index ==pokemonData.results.length?
                    const Center(child: CircularProgressIndicator()):
                      Column(
                      children: [
                        InkWell(
                          onTap: (){
                            String url = pokemonData.results[index].url!;
                            List<String> parts = url.split('/');
                            String id = parts[parts.length - 2];
                            Provider.of<PokemonDetailNotifier>(context,listen: false).getPokemonDetail(id,context);
                            Provider.of<PageNotifier>(context,listen: false).changePage(page: ScreenPokemonDetail.routeName, unknown: false);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text((pokemonData.results[index].name??"").capitalizeFirst(),style: const TextStyle(fontSize: 30),),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                        SizedBox(height: size.height*0.015,),
                        const Divider(),
                        SizedBox(height: size.height*0.015,)
                      ],
                    );
                  }
              ),
            ),

          if(pokemonData.state == PageState.error)
            const SizedBox.shrink()
        ],
      ),
    );
  }
}
