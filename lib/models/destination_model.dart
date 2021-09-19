import 'package:smart_travel_planning_appli/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imgUrl: 'assets/imgs/one.jpg',
    name: 'Scenary view',
    type: 'Sightseeing tour',
    startTimes: ['6:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imgUrl: 'assets/imgs/two.jpg',
    name: 'Walking Tour and Hiking',
    type: 'Sightseeing tour',
    startTimes: ['6:00 am', '11:00 am'],
    rating: 5,
    price: 210,
  ),
  Activity(
    imgUrl: 'assets/imgs/three.jpg',
    name: 'Visit Histrical Places',
    type: 'Sightseeing tour',
    startTimes: ['10:00 am', '5:00 pm'],
    rating: 5,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/imgs/four.jpg',
    city: "Kathmandu",
    description: "Travel around Kathmandu for exploring exciting places.",
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/imgs/five.jpg',
    city: "Pokhara",
    description: "Visit Pokhara for an amazing and unforgettable adventure",
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/imgs/six.jpg',
    city: "Chitwan",
    description: "Visit Chitwan for chilling and exploring wildlife adventure",
    activities: activities,
  ),
];
