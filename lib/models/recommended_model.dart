class RecommendedModel {
  String name;
  String image;

  RecommendedModel(this.name, this.image);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(item['name'], item['image']))
    .toList();

var recommendationsData = [
  {
    "name": "Nagarkot, Kathmandu",
    "image":
        "https://subhayatra.com/wp-content/uploads/2017/12/Nagarkot-View-tower.jpg",
  },
  {
    "name": "Dhulikhel, Kavre",
    "image":
        "https://www.mountainlayerstrek.com/wp-content/uploads/2019/12/Dhulikhel-Namobuddha-Panauti-Day-Tour.jpg",
  },
  {
    "name": "Chandragiri, Kathmandu",
    "image":
        "https://www.himalayanst.com/uploads/img/chandra-giri-trekking-in-nepal.jpg",
  },
];
