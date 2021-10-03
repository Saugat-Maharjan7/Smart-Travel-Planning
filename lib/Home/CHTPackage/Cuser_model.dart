class CUserlist {
  String cname;
  String curl;
  String cduration;
  String cprice;
  String cimage;

  CUserlist({this.cname, this.curl, this.cduration, this.cprice, this.cimage});

  CUserlist.fromJson(Map<String, dynamic> json) {
    cname = json['Cname'];
    curl = json['Curl'];
    cduration = json['Cduration'];
    cprice = json['Cprice'];
    cimage = json['Cimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Cname'] = this.cname;
    data['Curl'] = this.curl;
    data['Cduration'] = this.cduration;
    data['Cprice'] = this.cprice;
    data['Cimage'] = this.cimage;
    return data;
  }
}
