class AUserlist {
  String aname;
  String aurl;
  String aduration;
  String aprice;
  String aimage;

  AUserlist({this.aname, this.aurl, this.aduration, this.aprice, this.aimage});

  AUserlist.fromJson(Map<String, dynamic> json) {
    aname = json['aname'];
    aurl = json['aurl'];
    aduration = json['aduration'];
    aprice = json['aprice'];
    aimage = json['aimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aname'] = this.aname;
    data['aurl'] = this.aurl;
    data['aduration'] = this.aduration;
    data['aprice'] = this.aprice;
    data['aimage'] = this.aimage;
    return data;
  }
}

