class PCKUserlist {
  String pCKname;
  String pCKurl;
  String pCKduration;
  String pCKprice;
  String pCKimage;

  PCKUserlist(
      {this.pCKname,
        this.pCKurl,
        this.pCKduration,
        this.pCKprice,
        this.pCKimage});

  PCKUserlist.fromJson(Map<String, dynamic> json) {
    pCKname = json['PCKname'];
    pCKurl = json['PCKurl'];
    pCKduration = json['PCKduration'];
    pCKprice = json['PCKprice'];
    pCKimage = json['PCKimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PCKname'] = this.pCKname;
    data['PCKurl'] = this.pCKurl;
    data['PCKduration'] = this.pCKduration;
    data['PCKprice'] = this.pCKprice;
    data['PCKimage'] = this.pCKimage;
    return data;
  }
}
