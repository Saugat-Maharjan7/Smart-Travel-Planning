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
