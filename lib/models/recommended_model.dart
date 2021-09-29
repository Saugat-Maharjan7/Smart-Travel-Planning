import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class RecommendedModel {
  String name;
  String tagLine;
  String image;
  List<String> images;
  String description;
  int price;

  RecommendedModel(this.name, this.tagLine, this.image, this.images,
      this.description, this.price);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(item['name'], item['tagLine'],
    item['image'], item['images'], item['description'], item['price']))
    .toList();

var recommendationsData = [
  {
    "name": "Nagarkot, Kathmandu",
    "tagLine": "Sunrise View Point",
    "image":
        "https://subhayatra.com/wp-content/uploads/2017/12/Nagarkot-View-tower.jpg",
    "images": [
      "https://media-cdn.tripadvisor.com/media/photo-c/2560x500/08/40/02/28/nagarkot.jpg",
      "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/73/33/76.jpg",
      "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/71/af/ed.jpg"
    ],
    "description":
    "An outstanding hilltop that offers great views of Himalayas, breathtaking mountain scenery and the most impressive views of sunrise and sunset.",
    "price": 100
  },
  {
    "name": "Dhulikhel, Kavre",
    "tagLine": "Naturally and culturally rich destination to escape the hustle and bustle.",
    "image":
        "https://www.mountainlayerstrek.com/wp-content/uploads/2019/12/Dhulikhel-Namobuddha-Panauti-Day-Tour.jpg",
    "images": [
      "https://www.holidayhimalaya.com/newsite/images/virtuemart/product/resized/dhulikhel_400x0.jpg",
      "https://omgnepal.com/wp-content/uploads/2020/07/zipflyer-in-nepal.jpg",
      "https://mediaim.expedia.com/localexpert/2266157/10d1b8f3-3a60-43dd-b255-72c35976bc0d.jpg?impolicy=resizecrop&rw=1005&rh=565"
     ],
    "description": "A small town near Kathmandu famous for observing the beautiful view of Himalayas",
  "price": 200
  },
  {
    "name": "Chandragiri, Kathmandu",
    "tagLine": "Quick getaway & an enchanting oasis right outside the city.",
    "image":
        "https://www.himalayanst.com/uploads/img/chandra-giri-trekking-in-nepal.jpg",
    "images": [
     "https://www.luxuryholidaynepal.com/uploads/img/chandragiri-hill-admire-the-whole-kathmandu-valley-under-your-neath.jpeg",
      "https://www.vivaanadventure.com/wp-content/uploads/2020/03/Chandragiri-Cable-Car.jpg",
      "https://www.gvtrek.com/uploads/daytours/chandragiri-hill-snowfall.jpg"
    ],
    "description": "Just 7 km away from Thankot, Kathmandu, Chandragiri Hills feels like a whole new world, altogether. The 2551 meter-high natural haven is surrounded by temperate wilderness with a fantastic panorama of the Himalayas as the backdrop. The closest location from Kathmandu to get a view of the majestic Mt. Everest is surely something that you shouldn’t be missing.",
    "price": 750
  },
];
