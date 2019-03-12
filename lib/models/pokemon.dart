class Pokemon {
  final int id;
  final String number;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final List<String> weaknesses;

  Pokemon(
    {this.id,
    this.number,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.weaknesses}
  );

  factory Pokemon.fromJson(Map <String, dynamic> json){
    //Convert dynamic Lists into String Lists 
    var types =  new List<String>.from(json['type']);
    var weakness = new List<String>.from(json['weaknesses']);

    return Pokemon(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      img: json['img'],
      type: types,
      height: json['height'],
      weight: json['weight'],
      weaknesses: weakness,
    );
  }
}

