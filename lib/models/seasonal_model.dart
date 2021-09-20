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
