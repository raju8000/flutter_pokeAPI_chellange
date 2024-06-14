import 'package:flutter/material.dart';
import 'package:pokemon_challenge/config/theme_data.dart';
import 'package:pokemon_challenge/provider/page_notifier.dart';
import 'package:pokemon_challenge/provider/pokemon_detail_notifier.dart';
import 'package:pokemon_challenge/provider/pokemon_notifier.dart';
import 'package:pokemon_challenge/route/route_info_parser.dart';
import 'package:pokemon_challenge/route/router_delegate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PageNotifier>(create: (context) => PageNotifier()),
    ChangeNotifierProvider<PokemonNotifier>(create: (context) => PokemonNotifier()),
    ChangeNotifierProvider<PokemonDetailNotifier>(create: (context) => PokemonDetailNotifier()),
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter PokéAPI',
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouteInformationParser(),
      theme: ThemeConfig.themeData,
      routerDelegate: AppRouterDelegate(notifier: Provider.of<PageNotifier>(context)),
    );
  }
}

