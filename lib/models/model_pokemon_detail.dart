import 'package:pokemon_challenge/network/interfaces/base_network_model.dart';

class PokemonDetail extends BaseNetworkModel {
  String? id;
  String? name;
  String? imageUrl;
  /*double? hp;
  double? attack;
  double? defense;
  double? speed;
  double? spAttack;
  double? spDefense;*/
  String? description;
  int? height;
  int? weight;
  int? baseExperience;
  //var species;
  List<String> abilities;
  List<String> types;
  List<String> moves = [];
  List<Stats> stats = [];

  PokemonDetail({
    this.id,
    this.name,
    this.imageUrl,
    /*this.hp,
    this.attack,
    this.defense,
    this.speed,
    this.spAttack,
    this.spDefense,*/
    this.description,
    this.height,
    this.weight,
    this.baseExperience,
    //this.species,
    this.abilities = const [],
    this.types = const [],
    this.moves = const [],
    this.stats = const [],
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {

    int max(int num){
      if(num>5) {
        return 5;
      }
      return num;
    }
    String pokeId = json['id'].toString();
    int hp = json['stats'][0]['base_stat'];
    int attack = json['stats'][1]['base_stat'];
    int defense = json['stats'][2]['base_stat'];
    int spAttack = json['stats'][3]['base_stat'];
    int spDefense = json['stats'][4]['base_stat'];
    int speed = json['stats'][5]['base_stat'];

    List<Stats> stats= [];
    stats.add(Stats(title: "Hp", stat: hp));
    stats.add(Stats(title: "Attack", stat: attack));
    stats.add(Stats(title: "Defence", stat: defense));
    stats.add(Stats(title: "Special Att.", stat: spAttack));
    stats.add(Stats(title: "Special Def.", stat: spDefense));
    stats.add(Stats(title: "Speed", stat: speed));
    List abilities = json['abilities'];
    List movesList = json['moves'];
    List types = json['types'];
    List<String> tempMovesList = [];

    List<String> abilityTemp = [];
    String ability = json['abilities'][0]['ability']['name'];
    abilityTemp.add(ability);
    ability = abilities.length >= 2 ? json['abilities'][1]['ability']['name'] : '';
    abilityTemp.add(ability);
    ability = abilities.length >= 3 ? json['abilities'][2]['ability']['name'] : '';
    abilityTemp.add(ability);

    List<String> typesTemp = [];
    for (int i = 0; i < max(types.length); i++) {
      String type = json['types'][i]['type']['name'];
      typesTemp.add(type);
    }

    for (int i = 0; i < max(movesList.length); i++) {
      String moves = json['moves'][i]['move']['name'];
      tempMovesList.add(moves);
    }

    return PokemonDetail(
      id: pokeId,
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      stats: stats,
      height: json['height'],
      weight: json['weight'],
      baseExperience: json['base_experience'],
      abilities: abilityTemp,
      types: typesTemp,
      moves: tempMovesList,
    );
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return PokemonDetail.fromJson(json);
  }


}
class Stats {
  final String title;
  final int stat;

  Stats({
    required this.title,
    required this.stat,
  });
}