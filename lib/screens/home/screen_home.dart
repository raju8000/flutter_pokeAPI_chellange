import 'package:flutter/material.dart';
import 'package:pokemon_challenge/config/string_constant.dart';
import 'package:pokemon_challenge/provider/page_notifier.dart';
import 'package:pokemon_challenge/screens/pokemon/screen_pokemon_list.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  static const routeName = "home";

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<PageNotifier>(context);
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          notifier.changePage(page: ScreenPokemon.routeName, unknown: false);
        }, child: const Text(Strings.allPokemon,style: TextStyle(fontSize: 20),),),
      ),
    );
  }
}
