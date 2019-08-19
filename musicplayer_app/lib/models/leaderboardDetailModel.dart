class LeaderboardDeatilModel {
  int code;
  Null relatedVideos;
  Playlist playlist;
  Null urls;
  List<Privileges> privileges;

  LeaderboardDeatilModel(
      {this.code,
        this.relatedVideos,
        this.playlist,
        this.urls,
        this.privileges});

  LeaderboardDeatilModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    relatedVideos = json['relatedVideos'];
    playlist = json['playlist'] != null
        ? new Playlist.fromJson(json['playlist'])
        : null;
    urls = json['urls'];
    if (json['privileges'] != null) {
      privileges = new List<Privileges>();
      json['privileges'].forEach((v) {
        privileges.add(new Privileges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['relatedVideos'] = this.relatedVideos;
    if (this.playlist != null) {
      data['playlist'] = this.playlist.toJson();
    }
    data['urls'] = this.urls;
    if (this.privileges != null) {
      data['privileges'] = this.privileges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playlist {
  List subscribers;
  bool subscribed;
  Creator creator;
  List<DeatilTracks> tracks;
  List<TrackIds> trackIds;
  String updateFrequency;
  int backgroundCoverId;
  String backgroundCoverUrl;
  int subscribedCount;
  int cloudTrackCount;
  int createTime;
  bool highQuality;
  int privacy;
  int trackUpdateTime;
  int userId;
  int updateTime;
  int coverImgId;
  bool newImported;
  String coverImgUrl;
  int specialType;
  int trackCount;
  String commentThreadId;
  int playCount;
  int trackNumberUpdateTime;
  int adType;
  bool ordered;
  List<String> tags;
  String description;
  int status;
  String name;
  int id;
  int shareCount;
  String coverImgIdStr;
  String toplistType;
  int commentCount;

  Playlist(
      {this.subscribers,
        this.subscribed,
        this.creator,
        this.tracks,
        this.trackIds,
        this.updateFrequency,
        this.backgroundCoverId,
        this.backgroundCoverUrl,
        this.subscribedCount,
        this.cloudTrackCount,
        this.createTime,
        this.highQuality,
        this.privacy,
        this.trackUpdateTime,
        this.userId,
        this.updateTime,
        this.coverImgId,
        this.newImported,
        this.coverImgUrl,
        this.specialType,
        this.trackCount,
        this.commentThreadId,
        this.playCount,
        this.trackNumberUpdateTime,
        this.adType,
        this.ordered,
        this.tags,
        this.description,
        this.status,
        this.name,
        this.id,
        this.shareCount,
        this.coverImgIdStr,
        this.toplistType,
        this.commentCount});

  Playlist.fromJson(Map<String, dynamic> json) {
    if (json['subscribers'] != null) {
      subscribers = new List();
    }
    subscribed = json['subscribed'];
    creator =
    json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    if (json['tracks'] != null) {
      tracks = new List<DeatilTracks>();
      json['tracks'].forEach((v) {
        tracks.add(new DeatilTracks.fromJson(v));
      });
    }
    if (json['trackIds'] != null) {
      trackIds = new List<TrackIds>();
      json['trackIds'].forEach((v) {
        trackIds.add(new TrackIds.fromJson(v));
      });
    }
    updateFrequency = json['updateFrequency'];
    backgroundCoverId = json['backgroundCoverId'];
    backgroundCoverUrl = json['backgroundCoverUrl'];
    subscribedCount = json['subscribedCount'];
    cloudTrackCount = json['cloudTrackCount'];
    createTime = json['createTime'];
    highQuality = json['highQuality'];
    privacy = json['privacy'];
    trackUpdateTime = json['trackUpdateTime'];
    userId = json['userId'];
    updateTime = json['updateTime'];
    coverImgId = json['coverImgId'];
    newImported = json['newImported'];
    coverImgUrl = json['coverImgUrl'];
    specialType = json['specialType'];
    trackCount = json['trackCount'];
    commentThreadId = json['commentThreadId'];
    playCount = json['playCount'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    adType = json['adType'];
    ordered = json['ordered'];
    tags = json['tags'].cast<String>();
    description = json['description'];
    status = json['status'];
    name = json['name'];
    id = json['id'];
    shareCount = json['shareCount'];
    coverImgIdStr = json['coverImgId_str'];
    toplistType = json['ToplistType'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subscribers != null) {
      data['subscribers'] = this.subscribers.map((v) => v.toJson()).toList();
    }
    data['subscribed'] = this.subscribed;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    if (this.trackIds != null) {
      data['trackIds'] = this.trackIds.map((v) => v.toJson()).toList();
    }
    data['updateFrequency'] = this.updateFrequency;
    data['backgroundCoverId'] = this.backgroundCoverId;
    data['backgroundCoverUrl'] = this.backgroundCoverUrl;
    data['subscribedCount'] = this.subscribedCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['createTime'] = this.createTime;
    data['highQuality'] = this.highQuality;
    data['privacy'] = this.privacy;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['userId'] = this.userId;
    data['updateTime'] = this.updateTime;
    data['coverImgId'] = this.coverImgId;
    data['newImported'] = this.newImported;
    data['coverImgUrl'] = this.coverImgUrl;
    data['specialType'] = this.specialType;
    data['trackCount'] = this.trackCount;
    data['commentThreadId'] = this.commentThreadId;
    data['playCount'] = this.playCount;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['adType'] = this.adType;
    data['ordered'] = this.ordered;
    data['tags'] = this.tags;
    data['description'] = this.description;
    data['status'] = this.status;
    data['name'] = this.name;
    data['id'] = this.id;
    data['shareCount'] = this.shareCount;
    data['coverImgId_str'] = this.coverImgIdStr;
    data['ToplistType'] = this.toplistType;
    data['commentCount'] = this.commentCount;
    return data;
  }
}

class Creator {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  Null expertTags;
  Null experts;
  int djStatus;
  int vipType;
  Null remarkName;
  String backgroundImgIdStr;
  String avatarImgIdStr;

  Creator(
      {this.defaultAvatar,
        this.province,
        this.authStatus,
        this.followed,
        this.avatarUrl,
        this.accountStatus,
        this.gender,
        this.city,
        this.birthday,
        this.userId,
        this.userType,
        this.nickname,
        this.signature,
        this.description,
        this.detailDescription,
        this.avatarImgId,
        this.backgroundImgId,
        this.backgroundUrl,
        this.authority,
        this.mutual,
        this.expertTags,
        this.experts,
        this.djStatus,
        this.vipType,
        this.remarkName,
        this.backgroundImgIdStr,
        this.avatarImgIdStr});

  Creator.fromJson(Map<String, dynamic> json) {
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    authStatus = json['authStatus'];
    followed = json['followed'];
    avatarUrl = json['avatarUrl'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    city = json['city'];
    birthday = json['birthday'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    signature = json['signature'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    authority = json['authority'];
    mutual = json['mutual'];
    expertTags = json['expertTags'];
    experts = json['experts'];
    djStatus = json['djStatus'];
    vipType = json['vipType'];
    remarkName = json['remarkName'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    avatarImgIdStr = json['avatarImgIdStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this.defaultAvatar;
    data['province'] = this.province;
    data['authStatus'] = this.authStatus;
    data['followed'] = this.followed;
    data['avatarUrl'] = this.avatarUrl;
    data['accountStatus'] = this.accountStatus;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['birthday'] = this.birthday;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['signature'] = this.signature;
    data['description'] = this.description;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['authority'] = this.authority;
    data['mutual'] = this.mutual;
    data['expertTags'] = this.expertTags;
    data['experts'] = this.experts;
    data['djStatus'] = this.djStatus;
    data['vipType'] = this.vipType;
    data['remarkName'] = this.remarkName;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    return data;
  }
}

class DeatilTracks {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List alia;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  String crbt;
  String cf;
  Al al;
  int dt;
  H h;
  H m;
  H l;
  Null a;
  String cd;
  int no;
  String rtUrl;
  int ftype;
  List rtUrls;
  int djId;
  int copyright;
  int sId;
  int mark;
  int mst;
  int cp;
  int mv;
  int rtype;
  String rurl;
  int publishTime;

  DeatilTracks(
      {this.name,
        this.id,
        this.pst,
        this.t,
        this.ar,
        this.alia,
        this.pop,
        this.st,
        this.rt,
        this.fee,
        this.v,
        this.crbt,
        this.cf,
        this.al,
        this.dt,
        this.h,
        this.m,
        this.l,
        this.a,
        this.cd,
        this.no,
        this.rtUrl,
        this.ftype,
        this.rtUrls,
        this.djId,
        this.copyright,
        this.sId,
        this.mark,
        this.mst,
        this.cp,
        this.mv,
        this.rtype,
        this.rurl,
        this.publishTime});

  DeatilTracks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    pst = json['pst'];
    t = json['t'];
    if (json['ar'] != null) {
      ar = new List<Ar>();
      json['ar'].forEach((v) {
        ar.add(new Ar.fromJson(v));
      });
    }
    if (json['alia'] != null) {
      alia = new List();
    }
    pop = json['pop'];
    st = json['st'];
    rt = json['rt'];
    fee = json['fee'];
    v = json['v'];
    crbt = json['crbt'];
    cf = json['cf'];
    al = json['al'] != null ? new Al.fromJson(json['al']) : null;
    dt = json['dt'];
    h = json['h'] != null ? new H.fromJson(json['h']) : null;
    m = json['m'] != null ? new H.fromJson(json['m']) : null;
    l = json['l'] != null ? new H.fromJson(json['l']) : null;
    a = json['a'];
    cd = json['cd'];
    no = json['no'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
    if (json['rtUrls'] != null) {
      rtUrls = new List();
    }
    djId = json['djId'];
    copyright = json['copyright'];
    sId = json['s_id'];
    mark = json['mark'];
    mst = json['mst'];
    cp = json['cp'];
    mv = json['mv'];
    rtype = json['rtype'];
    rurl = json['rurl'];
    publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['pst'] = this.pst;
    data['t'] = this.t;
    if (this.ar != null) {
      data['ar'] = this.ar.map((v) => v.toJson()).toList();
    }
    if (this.alia != null) {
      data['alia'] = this.alia.map((v) => v.toJson()).toList();
    }
    data['pop'] = this.pop;
    data['st'] = this.st;
    data['rt'] = this.rt;
    data['fee'] = this.fee;
    data['v'] = this.v;
    data['crbt'] = this.crbt;
    data['cf'] = this.cf;
    if (this.al != null) {
      data['al'] = this.al.toJson();
    }
    data['dt'] = this.dt;
    if (this.h != null) {
      data['h'] = this.h.toJson();
    }
    if (this.m != null) {
      data['m'] = this.m.toJson();
    }
    if (this.l != null) {
      data['l'] = this.l.toJson();
    }
    data['a'] = this.a;
    data['cd'] = this.cd;
    data['no'] = this.no;
    data['rtUrl'] = this.rtUrl;
    data['ftype'] = this.ftype;
    if (this.rtUrls != null) {
      data['rtUrls'] = this.rtUrls.map((v) => v.toJson()).toList();
    }
    data['djId'] = this.djId;
    data['copyright'] = this.copyright;
    data['s_id'] = this.sId;
    data['mark'] = this.mark;
    data['mst'] = this.mst;
    data['cp'] = this.cp;
    data['mv'] = this.mv;
    data['rtype'] = this.rtype;
    data['rurl'] = this.rurl;
    data['publishTime'] = this.publishTime;
    return data;
  }
}

class Ar {
  int id;
  String name;
  List tns;
  List alias;

  Ar({this.id, this.name, this.tns, this.alias});

  Ar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['tns'] != null) {
      tns = new List();
    }
    if (json['alias'] != null) {
      alias = new List();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.tns != null) {
      data['tns'] = this.tns.map((v) => v.toJson()).toList();
    }
    if (this.alias != null) {
      data['alias'] = this.alias.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Al {
  int id;
  String name;
  String picUrl;
  List tns;
  int pic;

  Al({this.id, this.name, this.picUrl, this.tns, this.pic});

  Al.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    if (json['tns'] != null) {
      tns = new List();
    }
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    if (this.tns != null) {
      data['tns'] = this.tns.map((v) => v.toJson()).toList();
    }
    data['pic'] = this.pic;
    return data;
  }
}

class H {
  int br;
  int fid;
  int size;
  double vd;

  H({this.br, this.fid, this.size, this.vd});

  H.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
//    vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
    data['vd'] = this.vd;
    return data;
  }
}

class TrackIds {
  int id;
  int v;
  Null alg;
  int lr;

  TrackIds({this.id, this.v, this.alg, this.lr});

  TrackIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    v = json['v'];
    alg = json['alg'];
    lr = json['lr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['v'] = this.v;
    data['alg'] = this.alg;
    data['lr'] = this.lr;
    return data;
  }
}

class Privileges {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privileges(
      {this.id,
        this.fee,
        this.payed,
        this.st,
        this.pl,
        this.dl,
        this.sp,
        this.cp,
        this.subp,
        this.cs,
        this.maxbr,
        this.fl,
        this.toast,
        this.flag,
        this.preSell});

  Privileges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['payed'] = this.payed;
    data['st'] = this.st;
    data['pl'] = this.pl;
    data['dl'] = this.dl;
    data['sp'] = this.sp;
    data['cp'] = this.cp;
    data['subp'] = this.subp;
    data['cs'] = this.cs;
    data['maxbr'] = this.maxbr;
    data['fl'] = this.fl;
    data['toast'] = this.toast;
    data['flag'] = this.flag;
    data['preSell'] = this.preSell;
    return data;
  }
}

