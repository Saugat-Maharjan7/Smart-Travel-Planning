class UUserlist {
  String uname;
  String uurl;
  String uduration;
  String uprice;
  String uimage;

  UUserlist({this.uname, this.uurl, this.uduration, this.uprice, this.uimage});

  UUserlist.fromJson(Map<String, dynamic> json) {
    uname = json['uname'];
    uurl = json['uurl'];
    uduration = json['uduration'];
    uprice = json['uprice'];
    uimage = json['uimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uname'] = this.uname;
    data['uurl'] = this.uurl;
    data['uduration'] = this.uduration;
    data['uprice'] = this.uprice;
    data['uimage'] = this.uimage;
    return data;
  }
}
