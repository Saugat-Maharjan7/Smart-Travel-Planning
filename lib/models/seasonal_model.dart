import 'package:smart_travel_planning_appli/models/season_activity_model.dart';

class Season {
  String imgUrl;
  String name;
  String month;
  String info;

  Season({
    this.imgUrl,
    this.name,
    this.month,
    this.info,
  });
}

List<Activity> activities = [
  Activity(
    imgUrl: "images/summer.jpg",
    name: 'Hot',
    season: ['Mar','Apr','May'],
    price: 300,
  ),
  Activity(
    imgUrl: "images/autumn.jpg",
    name: 'Chilled',
    season: ['Jun','Jul','Aug'],
    price: 210,
  ),
  Activity(
    imgUrl: "images/monsoon.jpg",
    name: 'Mostly Rainy',
    season: ['Sep','Oct','Nov'],
    price: 125,
  ),
  Activity(
    imgUrl: "images/winter.jpg",
    name: 'Cold',
    season: ['Dec','Jan','Feb'],
    price: 250,
  ),
];

final List<Season> seasons = [
  Season(
    imgUrl: 'images/summer.jpg',
    name: 'Summer',
    month: 'Mar,Apr,May',
    info:
        'Warmer weather, but frequent storms and snowfall at higher altitudes.',
  ),
  Season(
    imgUrl: 'images/monsoon.jpg',
    name: 'Monsoon',
    month: 'Jun,Jul,Aug',
    info: 'Rain,mist and fog expected almost daily.',
  ),
  Season(
    imgUrl: 'images/autumn.jpg',
    name: 'Autumn',
    month: 'Sep,Oct,Nov',
    info: 'Best for hiking and trekking.\nFavourable weather condition',
  ),
  Season(
    imgUrl: 'images/winter.jpg',
    name: 'Winter',
    month: 'Dec,Jan,Feb',
    info: 'Cold weather occuring snowfall in mountain areas.',
  ),
];
