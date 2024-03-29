class MVplayingModel {
  int code;
  MVData data;

  MVplayingModel({this.code, this.data});

  MVplayingModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new MVData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class MVData {
  int id;
  String url;
  int r;
  int size;
  String md5;
  int code;
  int expi;
  int fee;
  int mvFee;
  int st;
  String msg;

  MVData(
      {this.id,
        this.url,
        this.r,
        this.size,
        this.md5,
        this.code,
        this.expi,
        this.fee,
        this.mvFee,
        this.st,
        this.msg});

  MVData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    r = json['r'];
    size = json['size'];
    md5 = json['md5'];
    code = json['code'];
    expi = json['expi'];
    fee = json['fee'];
    mvFee = json['mvFee'];
    st = json['st'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['r'] = this.r;
    data['size'] = this.size;
    data['md5'] = this.md5;
    data['code'] = this.code;
    data['expi'] = this.expi;
    data['fee'] = this.fee;
    data['mvFee'] = this.mvFee;
    data['st'] = this.st;
    data['msg'] = this.msg;
    return data;
  }
}

