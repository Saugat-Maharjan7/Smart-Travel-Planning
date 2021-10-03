class PUserlist {
  String pname;
  String purl;
  String pduration;
  String pprice;
  String pimage;

  PUserlist({this.pname, this.purl, this.pduration, this.pprice, this.pimage});

  PUserlist.fromJson(Map<String, dynamic> json) {
    pname = json['Pname'];
    purl = json['Purl'];
    pduration = json['Pduration'];
    pprice = json['Pprice'];
    pimage = json['Pimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ppname'] = this.pname;
    data['Purl'] = this.purl;
    data['Pduration'] = this.pduration;
    data['Pprice'] = this.pprice;
    data['Pimage'] = this.pimage;
    return data;
  }
}
