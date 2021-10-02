

class DestinationModel {
  List<String> images;


  DestinationModel( this.images);
}

List<DestinationModel> destinations = destinationsData
    .map((item) => DestinationModel(item['images'])).toList();

var destinationsData = [
  {
    "images": ["images/ktm.jpg"
        "images/boudha.jpg",
      "images/statue.jpg",
      "images/pashupatinath.jpg",
      "images/swoyambhu.jpg"
    ],
  },
  {
    "images": ["images/ktm.jpg"
        "images/boudha.jpg",
      "images/statue.jpg",
      "images/pashupatinath.jpg",
      "images/swoyambhu.jpg"
    ],
  },
  {
    "images": ["images/ktm.jpg"
        "images/boudha.jpg",
      "images/statue.jpg",
      "images/pashupatinath.jpg",
      "images/swoyambhu.jpg"
    ],
  },
];
