class PUserlist {
  String ppname;
  String kurl;
  String pduration;
  String pprice;
  String pimage;

  PUserlist({this.ppname, this.kurl, this.pduration, this.pprice, this.pimage});

  PUserlist.fromJson(Map<String, dynamic> json) {
    ppname = json['Ppname'];
    kurl = json['Kurl'];
    pduration = json['Pduration'];
    pprice = json['Pprice'];
    pimage = json['Pimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ppname'] = this.ppname;
    data['Kurl'] = this.kurl;
    data['Pduration'] = this.pduration;
    data['Pprice'] = this.pprice;
    data['Pimage'] = this.pimage;
    return data;
  }
}
