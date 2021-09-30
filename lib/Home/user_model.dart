class Userlist {
  String name;
  String url;
  String duration;
  String price;
  String image;

  Userlist({this.name, this.url, this.duration, this.price, this.image});

  Userlist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    duration = json['duration'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}