class LeaderboardModel {
  int code;
  List<BoardListitem> list;
  ArtistToplist artistToplist;
  RewardToplist rewardToplist;

  LeaderboardModel({this.code, this.list, this.artistToplist, this.rewardToplist});

  LeaderboardModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['list'] != null) {
      list = new List<BoardListitem>();
      json['list'].forEach((v) { list.add(new BoardListitem.fromJson(v)); });
    }
    artistToplist = json['artistToplist'] != null ? new ArtistToplist.fromJson(json['artistToplist']) : null;
    rewardToplist = json['rewardToplist'] != null ? new RewardToplist.fromJson(json['rewardToplist']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.artistToplist != null) {
      data['artistToplist'] = this.artistToplist.toJson();
    }
    if (this.rewardToplist != null) {
      data['rewardToplist'] = this.rewardToplist.toJson();
    }
    return data;
  }
}

class BoardListitem {
  List subscribers;
  String subscribed;
  String creator;
  List<Artists> artists;
  List<Tracks> tracks;
  String updateFrequency;
  int backgroundCoverId;
  String backgroundCoverUrl;
  int status;
  String coverImgUrl;
  int userId;
  bool newImported;
  bool anonimous;
  int adType;
  int trackNumberUpdateTime;
  int specialType;
  int updateTime;
  String commentThreadId;
  int privacy;
  int trackUpdateTime;
  int trackCount;
  int playCount;
  int coverImgId;
  int totalDuration;
  int createTime;
  bool highQuality;
  String description;
  List<String> tags;
  bool ordered;
  int subscribedCount;
  int cloudTrackCount;
  String name;
  int id;
  String coverImgIdStr;
  String toplistType;

  BoardListitem({this.subscribers, this.subscribed, this.creator, this.artists, this.tracks, this.updateFrequency, this.backgroundCoverId, this.backgroundCoverUrl, this.status, this.coverImgUrl, this.userId, this.newImported, this.anonimous, this.adType, this.trackNumberUpdateTime, this.specialType, this.updateTime, this.commentThreadId, this.privacy, this.trackUpdateTime, this.trackCount, this.playCount, this.coverImgId, this.totalDuration, this.createTime, this.highQuality, this.description, this.tags, this.ordered, this.subscribedCount, this.cloudTrackCount, this.name, this.id, this.coverImgIdStr, this.toplistType});

  BoardListitem.fromJson(Map<String, dynamic> json) {
    if (json['subscribers'] != null) {
      subscribers = new List();
    }
    subscribed = json['subscribed'];
    creator = json['creator'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) { artists.add(new Artists.fromJson(v)); });
    }
    if (json['tracks'] != null) {
      tracks = new List<Tracks>();
      json['tracks'].forEach((v) { tracks.add(new Tracks.fromJson(v)); });
    }
    updateFrequency = json['updateFrequency'];
    backgroundCoverId = json['backgroundCoverId'];
    backgroundCoverUrl = json['backgroundCoverUrl'];
    status = json['status'];
    coverImgUrl = json['coverImgUrl'];
    userId = json['userId'];
    newImported = json['newImported'];
    anonimous = json['anonimous'];
    adType = json['adType'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    specialType = json['specialType'];
    updateTime = json['updateTime'];
    commentThreadId = json['commentThreadId'];
    privacy = json['privacy'];
    trackUpdateTime = json['trackUpdateTime'];
    trackCount = json['trackCount'];
    playCount = json['playCount'];
    coverImgId = json['coverImgId'];
    totalDuration = json['totalDuration'];
    createTime = json['createTime'];
    highQuality = json['highQuality'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    ordered = json['ordered'];
    subscribedCount = json['subscribedCount'];
    cloudTrackCount = json['cloudTrackCount'];
    name = json['name'];
    id = json['id'];
    coverImgIdStr = json['coverImgId_str'];
    toplistType = json['ToplistType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subscribers != null) {
      data['subscribers'] = this.subscribers.map((v) => v.toJson()).toList();
    }
    data['subscribed'] = this.subscribed;
    data['creator'] = this.creator;
    data['artists'] = this.artists;
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    data['updateFrequency'] = this.updateFrequency;
    data['backgroundCoverId'] = this.backgroundCoverId;
    data['backgroundCoverUrl'] = this.backgroundCoverUrl;
    data['status'] = this.status;
    data['coverImgUrl'] = this.coverImgUrl;
    data['userId'] = this.userId;
    data['newImported'] = this.newImported;
    data['anonimous'] = this.anonimous;
    data['adType'] = this.adType;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['specialType'] = this.specialType;
    data['updateTime'] = this.updateTime;
    data['commentThreadId'] = this.commentThreadId;
    data['privacy'] = this.privacy;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['trackCount'] = this.trackCount;
    data['playCount'] = this.playCount;
    data['coverImgId'] = this.coverImgId;
    data['totalDuration'] = this.totalDuration;
    data['createTime'] = this.createTime;
    data['highQuality'] = this.highQuality;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['ordered'] = this.ordered;
    data['subscribedCount'] = this.subscribedCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['name'] = this.name;
    data['id'] = this.id;
    data['coverImgId_str'] = this.coverImgIdStr;
    data['ToplistType'] = this.toplistType;
    return data;
  }
}

class Tracks {
  String first;
  String second;

  Tracks({this.first, this.second});

  Tracks.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}

class ArtistToplist {
  String coverUrl;
  List<Artists> artists;
  String name;
  String upateFrequency;
  int position;
  String updateFrequency;

  ArtistToplist({this.coverUrl, this.artists, this.name, this.upateFrequency, this.position, this.updateFrequency});

  ArtistToplist.fromJson(Map<String, dynamic> json) {
    coverUrl = json['coverUrl'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) { artists.add(new Artists.fromJson(v)); });
    }
    name = json['name'];
    upateFrequency = json['upateFrequency'];
    position = json['position'];
    updateFrequency = json['updateFrequency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coverUrl'] = this.coverUrl;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['upateFrequency'] = this.upateFrequency;
    data['position'] = this.position;
    data['updateFrequency'] = this.updateFrequency;
    return data;
  }
}

class Artist {
  String first;
  String second;
  int third;

  Artist({this.first, this.second, this.third});

  Artist.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
    third = json['third'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    data['third'] = this.third;
    return data;
  }
}

class RewardToplist {
  String coverUrl;
  List<Songs> songs;
  String name;
  int position;

  RewardToplist({this.coverUrl, this.songs, this.name, this.position});

  RewardToplist.fromJson(Map<String, dynamic> json) {
    coverUrl = json['coverUrl'];
    if (json['songs'] != null) {
      songs = new List<Songs>();
      json['songs'].forEach((v) { songs.add(new Songs.fromJson(v)); });
    }
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coverUrl'] = this.coverUrl;
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['position'] = this.position;
    return data;
  }
}

class Songs {
  String name;
  int id;
  int position;
  List alias;
  int status;
  int fee;
  int copyrightId;
  String disc;
  int no;
  List<Artists> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String ringtone;
  String crbt;
  String audition;
  String copyFrom;
  String commentThreadId;
  String rtUrl;
  int ftype;
  List rtUrls;
  int copyright;
  String transName;
  String sign;
  int mark;
  HMusic hMusic;
  HMusic mMusic;
  HMusic lMusic;
  HMusic bMusic;
  int rtype;
  String rurl;
  int mvid;
  String mp3Url;

  Songs({this.name, this.id, this.position, this.alias, this.status, this.fee, this.copyrightId, this.disc, this.no, this.artists, this.album, this.starred, this.popularity, this.score, this.starredNum, this.duration, this.playedNum, this.dayPlays, this.hearTime, this.ringtone, this.crbt, this.audition, this.copyFrom, this.commentThreadId, this.rtUrl, this.ftype, this.rtUrls, this.copyright, this.transName, this.sign, this.mark, this.hMusic, this.mMusic, this.lMusic, this.bMusic, this.rtype, this.rurl, this.mvid, this.mp3Url});

  Songs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    position = json['position'];
    if (json['alias'] != null) {
      alias = new List();
    }
    status = json['status'];
    fee = json['fee'];
    copyrightId = json['copyrightId'];
    disc = json['disc'];
    no = json['no'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) { artists.add(new Artists.fromJson(v)); });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    starred = json['starred'];
    popularity = json['popularity'];
    score = json['score'];
    starredNum = json['starredNum'];
    duration = json['duration'];
    playedNum = json['playedNum'];
    dayPlays = json['dayPlays'];
    hearTime = json['hearTime'];
    ringtone = json['ringtone'];
    crbt = json['crbt'];
    audition = json['audition'];
    copyFrom = json['copyFrom'];
    commentThreadId = json['commentThreadId'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
    if (json['rtUrls'] != null) {
      rtUrls = new List();
    }
    copyright = json['copyright'];
    transName = json['transName'];
    sign = json['sign'];
    mark = json['mark'];
    hMusic = json['hMusic'] != null ? new HMusic.fromJson(json['hMusic']) : null;
    mMusic = json['mMusic'] != null ? new HMusic.fromJson(json['mMusic']) : null;
    lMusic = json['lMusic'] != null ? new HMusic.fromJson(json['lMusic']) : null;
    bMusic = json['bMusic'] != null ? new HMusic.fromJson(json['bMusic']) : null;
    rtype = json['rtype'];
    rurl = json['rurl'];
    mvid = json['mvid'];
    mp3Url = json['mp3Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['position'] = this.position;
    if (this.alias != null) {
      data['alias'] = this.alias.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['fee'] = this.fee;
    data['copyrightId'] = this.copyrightId;
    data['disc'] = this.disc;
    data['no'] = this.no;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['starred'] = this.starred;
    data['popularity'] = this.popularity;
    data['score'] = this.score;
    data['starredNum'] = this.starredNum;
    data['duration'] = this.duration;
    data['playedNum'] = this.playedNum;
    data['dayPlays'] = this.dayPlays;
    data['hearTime'] = this.hearTime;
    data['ringtone'] = this.ringtone;
    data['crbt'] = this.crbt;
    data['audition'] = this.audition;
    data['copyFrom'] = this.copyFrom;
    data['commentThreadId'] = this.commentThreadId;
    data['rtUrl'] = this.rtUrl;
    data['ftype'] = this.ftype;
    if (this.rtUrls != null) {
      data['rtUrls'] = this.rtUrls.map((v) => v.toJson()).toList();
    }
    data['copyright'] = this.copyright;
    data['transName'] = this.transName;
    data['sign'] = this.sign;
    data['mark'] = this.mark;
    if (this.hMusic != null) {
      data['hMusic'] = this.hMusic.toJson();
    }
    if (this.mMusic != null) {
      data['mMusic'] = this.mMusic.toJson();
    }
    if (this.lMusic != null) {
      data['lMusic'] = this.lMusic.toJson();
    }
    if (this.bMusic != null) {
      data['bMusic'] = this.bMusic.toJson();
    }
    data['rtype'] = this.rtype;
    data['rurl'] = this.rurl;
    data['mvid'] = this.mvid;
    data['mp3Url'] = this.mp3Url;
    return data;
  }
}

class Artists {
  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List alias;
  String trans;
  int musicSize;
  int topicPerson;

  Artists({this.name, this.id, this.picId, this.img1v1Id, this.briefDesc, this.picUrl, this.img1v1Url, this.albumSize, this.alias, this.trans, this.musicSize, this.topicPerson});

  Artists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
    if (json['alias'] != null) {
      alias = new List();
    }
    trans = json['trans'];
    musicSize = json['musicSize'];
    topicPerson = json['topicPerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picId'] = this.picId;
    data['img1v1Id'] = this.img1v1Id;
    data['briefDesc'] = this.briefDesc;
    data['picUrl'] = this.picUrl;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
    if (this.alias != null) {
      data['alias'] = this.alias.map((v) => v.toJson()).toList();
    }
    data['trans'] = this.trans;
    data['musicSize'] = this.musicSize;
    data['topicPerson'] = this.topicPerson;
    return data;
  }
}

class Album {
  String name;
  int id;
  String type;
  int size;
  int picId;
  String blurPicUrl;
  int companyId;
  int pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
  String company;
  String briefDesc;
  Artist artist;
  List<Songs> songs;
  List alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String subType;
  String transName;
  int mark;
  String picIdStr;

  Album({this.name, this.id, this.type, this.size, this.picId, this.blurPicUrl, this.companyId, this.pic, this.picUrl, this.publishTime, this.description, this.tags, this.company, this.briefDesc, this.artist, this.songs, this.alias, this.status, this.copyrightId, this.commentThreadId, this.artists, this.subType, this.transName, this.mark, this.picIdStr});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
    size = json['size'];
    picId = json['picId'];
    blurPicUrl = json['blurPicUrl'];
    companyId = json['companyId'];
    pic = json['pic'];
    picUrl = json['picUrl'];
    publishTime = json['publishTime'];
    description = json['description'];
    tags = json['tags'];
    company = json['company'];
    briefDesc = json['briefDesc'];
    artist = json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    if (json['songs'] != null) {
      songs = new List<Songs>();
      json['songs'].forEach((v) { songs.add(new Songs.fromJson(v)); });
    }
    if (json['alias'] != null) {
      alias = new List();
    }
    status = json['status'];
    copyrightId = json['copyrightId'];
    commentThreadId = json['commentThreadId'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) { artists.add(new Artists.fromJson(v)); });
    }
    subType = json['subType'];
    transName = json['transName'];
    mark = json['mark'];
    picIdStr = json['picId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['type'] = this.type;
    data['size'] = this.size;
    data['picId'] = this.picId;
    data['blurPicUrl'] = this.blurPicUrl;
    data['companyId'] = this.companyId;
    data['pic'] = this.pic;
    data['picUrl'] = this.picUrl;
    data['publishTime'] = this.publishTime;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['company'] = this.company;
    data['briefDesc'] = this.briefDesc;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    if (this.alias != null) {
      data['alias'] = this.alias.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['copyrightId'] = this.copyrightId;
    data['commentThreadId'] = this.commentThreadId;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['subType'] = this.subType;
    data['transName'] = this.transName;
    data['mark'] = this.mark;
    data['picId_str'] = this.picIdStr;
    return data;
  }
}

class HMusic {
  String name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  int volumeDelta;

  HMusic({this.name, this.id, this.size, this.extension, this.sr, this.dfsId, this.bitrate, this.playTime, this.volumeDelta});

  HMusic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    size = json['size'];
    extension = json['extension'];
    sr = json['sr'];
    dfsId = json['dfsId'];
    bitrate = json['bitrate'];
    playTime = json['playTime'];
    volumeDelta = json['volumeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['size'] = this.size;
    data['extension'] = this.extension;
    data['sr'] = this.sr;
    data['dfsId'] = this.dfsId;
    data['bitrate'] = this.bitrate;
    data['playTime'] = this.playTime;
    data['volumeDelta'] = this.volumeDelta;
    return data;
  }
}



