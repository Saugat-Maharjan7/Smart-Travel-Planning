import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendedModel {
  String name;
  String tagLine;
  String image;
  List<String> images;
  String description;
  int price;
  String url;

  RecommendedModel(this.name, this.tagLine, this.image, this.images,
      this.description, this.price, this.url);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(item['name'], item['tagLine'],
    item['image'], item['images'], item['description'], item['price'], item['url']))
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
    "price": 100,
    "url": "https://www.expedia.com/things-to-do/nagarkot-sunrise-view-and-day-hiking-from-kathmandu.a1335658.activity-details?endDate=2021-10-17&location=Kathmandu%2C%20Bagmati%2C%20Nepal&rid=1938&startDate=2021-10-03&fbclid=IwAR0bNyhJP5q59o2culsYtiMne2nfOLolK0FjfNu5EwdG-5kpG7k-_0GTDgM",
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
  "price": 200,
    "url": "https://www.hikingannapurna.com/dhulikhel-zipline?fbclid=IwAR17kb_iJzjq0xOsIiJhMe820gebURzeQ3T6lP77-4xjJvuFAlt_q0CFJMw"
  },
  {
    "name": "Chandragiri, Kathmandu",
    "tagLine": "Quick getaway & an enchanting oasis right outside the city.",
    "image":
        "https://www.himalayanst.com/uploads/img/chandra-giri-trekking-in-nepal.jpg",
    "images": [

      "https://www.vivaanadventure.com/wp-content/uploads/2020/03/Chandragiri-Cable-Car.jpg",
      "https://www.gvtrek.com/uploads/daytours/chandragiri-hill-snowfall.jpg",
      "https://www.luxuryholidaynepal.com/uploads/img/chandragiri-hill-admire-the-whole-kathmandu-valley-under-your-neath.jpeg",
    ],
    "description": "Just 7 km away from Thankot, Kathmandu, Chandragiri Hills feels like a whole new world, altogether. The 2551 meter-high natural haven is surrounded by temperate wilderness with a fantastic panorama of the Himalayas as the backdrop. The closest location from Kathmandu to get a view of the majestic Mt. Everest is surely something that you shouldn’t be missing.",
    "price": 750,
    "url": "https://www.agoda.com/chandragiri-hills-resort/hotel/kathmandu-np.html?checkin=2021-10-03&checkout=2021-10-04&los=1&rooms=1&adults=1&children=0&cid=1891449&searchrequestid=34d1181f-9eef-4ea6-a51f-bdc540c1683d&tag=eb38b877-f74c-218f-da23-1a926a71c3b1&af_sub3=b413555a-73ed-46ef-8724-b53426a27577&af_sub4=ikqbqqdeaplr0jlx0jamaoq3&fbclid=IwAR0j6_lXOGxYnLpLO3Bk6LISdlx7SSu-nGH9klWtDRq7Z_WnYqpbpkUIeD0"
  },
];

