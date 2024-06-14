import 'package:flutter/material.dart';
import 'package:pokemon_challenge/config/string_constant.dart';
import 'package:pokemon_challenge/extensions/string_extension.dart';
import 'package:pokemon_challenge/models/model_pokemon_detail.dart';
import 'package:pokemon_challenge/widgets/base_information_widget.dart';
import 'package:pokemon_challenge/widgets/base_stats_widget.dart';
import 'package:pokemon_challenge/widgets/info_tags.dart';
import 'package:pokemon_challenge/widgets/network_image_container.dart';

class Pokemon extends StatelessWidget {
  const Pokemon({super.key, required this.pokemon});
  final PokemonDetail pokemon;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NetworkImageContainer(key: UniqueKey(), imageUrl: pokemon.imageUrl!),
      
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      (pokemon.name ??"").capitalizeFirst(),
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                    ),
                
                
                    BaseInformationWidget(height: pokemon.height??0, weight: pokemon.weight??0, baseExperience: pokemon.baseExperience??0),
                
                    BaseStatsWidget(
                      title: Strings.baseStats,
                      stats: pokemon.stats,
                    ),
                
                    InfoTagsWidget(title: Strings.abilities, tags: pokemon.abilities),
                    InfoTagsWidget(title: Strings.types, tags: pokemon.types),
                    InfoTagsWidget(title: Strings.moves, tags: pokemon.moves),
                  ],
                ),
              ),
            ),
          ),
      
      
        ],
      ),
    );
  }
}
