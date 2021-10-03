class KUserlist {
  String kname;
  String kurl;
  String kduration;
  String kprice;
  String kimage;

  KUserlist({this.kname, this.kurl, this.kduration, this.kprice, this.kimage});

  KUserlist.fromJson(Map<String, dynamic> json) {
    kname = json['Kname'];
    kurl = json['kurl'];
    kduration = json['Kduration'];
    kprice = json['Kprice'];
    kimage = json['Kimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kname'] = this.kname;
    data['kurl'] = this.kurl;
    data['Kduration'] = this.kduration;
    data['Kprice'] = this.kprice;
    data['Kimage'] = this.kimage;
    return data;
  }
}