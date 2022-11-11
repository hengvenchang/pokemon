class PokemonModel {
  String? id;
  String? name;
  String? imageurl;
  String? xdescription;
  String? ydescription;
  String? height;
  String? weight;
  String? error;
  List? types;
  int? attack;
  int? defense;
  int? hp;
  int? speed;

  PokemonModel({
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.types,
    this.attack,
    this.defense,
    this.hp,
    this.speed,
  });

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageurl = json['imageurl'];
    name = json['name'];
    xdescription = json['xdescription'];
    xdescription = json['ydescription'];
    height = json['height'];
    weight = json['weight'];
    types = json['typeofpokemon'];
    attack = json['attack'];
    defense = json['defense'];
    hp = json['hp'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['imageurl'] = imageurl;
    data['name'] = name;
    data['xdescription'] = xdescription;
    data['xdescription'] = ydescription;
    data['height'] = height;
    data['weight'] = weight;
    data['typeofpokemon'] = types;
    data['defense'] = defense;
    data['attack'] = attack;
    data['hp'] = hp;
    data['speed'] = speed;
    return data;
  }
}
