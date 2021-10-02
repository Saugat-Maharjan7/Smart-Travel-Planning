import 'package:smart_travel_planning_appli/models/activity_season_model.dart';

class Season {
  String imgUrl;
  String name;
  String month;
  List<String> images;
  String info;
  String description;
  List<Activity> activities;

  Season({
    this.imgUrl,
    this.name,
    this.month,
    this.description,
    this.images,
    this.info,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imgUrl: "images/illam.jpg",
    name: 'Illam',
    info: 'Lush green tea gardens makes illam popular. It has famous tea garden, Antu pond and much to explore.'
  ),
  Activity(
    imgUrl: "images/pokhara.jpg",
    name: 'Pokhara',
    info: 'Major destination because of its panoramic views, magnificent mountains, lakes.'
  ),
  Activity(
    imgUrl: "images/mustang.jpg",
    name: 'Mustang',
    info: 'Land Beyond Himalayas: Deepest gorge that goes down three miles between Dhaulagiri and Annapurna mountains.'
  ),
  Activity(
    imgUrl: "images/lumbini.jpg",
    name: 'Lumbini',
    info: 'Archaeological site, place of pilgrimage honored as birthplace of Buddha.'
  ),
  Activity(
      imgUrl: "images/abc.jpg",
      name: 'ABC trek',
      info: 'An amazing walk through diverse landscape and rich mountains, wild variety of flora and faunas.'
  ),
  Activity(
      imgUrl: "images/bardiya.jpg",
      name: 'Bardiya National Park',
      info: 'Largest national park in lowland Terai. Wide species of animals.'
  ),
  Activity(
      imgUrl: "images/janakpur.jpg",
      name: 'Janakpur',
      info: 'Surrounded by rivers like Dudhmati, Jalad, Rato, Balan and Kamala, Janakpur is famous for its temples and ponds'
  ),
  Activity(
      imgUrl: "images/rara.jpg",
      name: 'Rara',
      info: 'The deepest lake and also one of most pristine. Surrounded by green hills on all sides, one can camp by sparkling waters of lake.'
  ),
  Activity(
      imgUrl: "images/chitwanNP.jpg",
      name: 'Chitwan National Park',
      info: 'Nestled at foot of himalayas, has particularly rich flora and fauna and is home to asian rhinos,bengal tigers.'
  ),
  Activity(
      imgUrl: "images/ebc.jpg",
      name: 'Everest Base Camp',
      info: 'Classic trek to base of Mt.Everest. Journey to base of the Everest is more than just a trek.'
  ),
  Activity(
      imgUrl: "images/phokshundo.jpg",
      name: 'Phokshundo Lake',
      info: 'Alpine fresh water oligotrophic lake, surrounded by glaciers and famous for spectacular landscapes and most scenic mountain parks.'
  ),
  Activity(
      imgUrl: "images/kalinchowk.jpg",
      name: 'Kalinchwok',
      info: 'Named after hill-top temple Kalinchwok Bhagwati. It is blend of both biological and cultural attractions.'
  ),
  Activity(
      imgUrl: "images/bandipur.jpg",
      name: 'Bandipur',
      info: 'Hilltop settlement famous for its Newari people and their culture. Also famous for its wildlife. Houses reflect style, architecture and culture.'
  ),
  Activity(
      imgUrl: "images/nagarkot.jpg",
      name: 'Nagarkot',
      info: 'Scenic hilly town in midst of snow-capped mountains. Offers great views of Himalayas, breathtaking sunrise view.'
  ),
];

final List<Season> seasons = [
  Season(
    imgUrl: 'images/summer.jpg',
    name: 'Summer',
    month: 'Mar,Apr,May',
    info:
        'Warmer weather, but frequent storms and snowfall at higher altitudes.',
    description: 'Weather is very hot.',
    images: [
    "https://media-cdn.tripadvisor.com/media/photo-c/2560x500/08/40/02/28/nagarkot.jpg",
    "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/73/33/76.jpg",
    "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/71/af/ed.jpg"
    ],
    activities: activities,
  ),
  Season(
    imgUrl: 'images/monsoon.jpg',
    name: 'Monsoon',
    month: 'Jun,Jul,Aug',
    info: 'Rain,mist and fog expected almost daily.',
    images: [
      "https://media-cdn.tripadvisor.com/media/photo-c/2560x500/08/40/02/28/nagarkot.jpg",
      "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/73/33/76.jpg",
      "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/71/af/ed.jpg"
    ],
    description: 'Weather is always rainy.',
    activities: activities,
  ),
  Season(
    imgUrl: 'images/autumn.jpg',
    name: 'Autumn',
    month: 'Sep,Oct,Nov',
    info: 'Best for hiking and trekking.\nFavourable weather condition',
    images: [
      "https://media-cdn.tripadvisor.com/media/photo-c/2560x500/08/40/02/28/nagarkot.jpg",
      "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/73/33/76.jpg",
      "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/71/af/ed.jpg"
    ],
    description: 'Weather is suitable for hiking, treks, walks',
    activities: activities,
  ),
  Season(
    imgUrl: 'images/winter.jpg',
    name: 'Winter',
    month: 'Dec,Jan,Feb',
    info: 'Cold weather occurring snowfall in mountain areas.',
    images: [
      "https://media-cdn.tripadvisor.com/media/photo-c/2560x500/08/40/02/28/nagarkot.jpg",
      "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/73/33/76.jpg",
      "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/71/af/ed.jpg"
    ],
    description: 'Weather is cold. You need to get warmer clothes',
    activities: activities,
  ),
];
