class PlacePrediction{
  String secondary_text;
  String main_text;
  String place_id;

  PlacePrediction({this.secondary_text,this.main_text, this.place_id});

  PlacePrediction.fromJson(Map<String, dynamic> json){
    secondary_text = json["structured_formatting"]["secondary_text"];
    main_text = json["structured_formatting"]["main_text"];
    place_id = json["place_id"];
  }
}