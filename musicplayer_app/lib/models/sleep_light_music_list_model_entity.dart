class SleepLightMusicListModelEntity {
	int total;
	int code;
	bool more;
	String cat;
	List<SleepLightMusicListModelPlaylist> playlists;

	SleepLightMusicListModelEntity({this.total, this.code, this.more, this.cat, this.playlists});

	SleepLightMusicListModelEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		code = json['code'];
		more = json['more'];
		cat = json['cat'];
		if (json['playlists'] != null) {
			playlists = new List<SleepLightMusicListModelPlaylist>();(json['playlists'] as List).forEach((v) { playlists.add(new SleepLightMusicListModelPlaylist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['code'] = this.code;
		data['more'] = this.more;
		data['cat'] = this.cat;
		if (this.playlists != null) {
      data['playlists'] =  this.playlists.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class SleepLightMusicListModelPlaylist {
	String description;
	int privacy;
	int trackNumberUpdateTime;
	dynamic subscribed;
	int shareCount;
	int trackCount;
	int adType;
	String coverimgidStr;
	int specialType;
	int id;
	String alg;
	int totalDuration;
	bool ordered;
	SleepLightMusicListModelPlaylistsCreator creator;
	List<SleepLightMusicListModelPlaylistsSubscriber> subscribers;
	String commentThreadId;
	bool highQuality;
	int updateTime;
	int trackUpdateTime;
	int userId;
	int coverStatus;
	dynamic tracks;
	List<String> tags;
	bool anonimous;
	int commentCount;
	int cloudTrackCount;
	String coverImgUrl;
	int playCount;
	int coverImgId;
	int createTime;
	String name;
	int subscribedCount;
	int status;
	bool newImported;

	SleepLightMusicListModelPlaylist({this.description, this.privacy, this.trackNumberUpdateTime, this.subscribed, this.shareCount, this.trackCount, this.adType, this.coverimgidStr, this.specialType, this.id, this.alg, this.totalDuration, this.ordered, this.creator, this.subscribers, this.commentThreadId, this.highQuality, this.updateTime, this.trackUpdateTime, this.userId, this.coverStatus, this.tracks, this.tags, this.anonimous, this.commentCount, this.cloudTrackCount, this.coverImgUrl, this.playCount, this.coverImgId, this.createTime, this.name, this.subscribedCount, this.status, this.newImported});

	SleepLightMusicListModelPlaylist.fromJson(Map<String, dynamic> json) {
		description = json['description'];
		privacy = json['privacy'];
		trackNumberUpdateTime = json['trackNumberUpdateTime'];
		subscribed = json['subscribed'];
		shareCount = json['shareCount'];
		trackCount = json['trackCount'];
		adType = json['adType'];
		coverimgidStr = json['coverImgId_str'];
		specialType = json['specialType'];
		id = json['id'];
		alg = json['alg'];
		totalDuration = json['totalDuration'];
		ordered = json['ordered'];
		creator = json['creator'] != null ? new SleepLightMusicListModelPlaylistsCreator.fromJson(json['creator']) : null;
		if (json['subscribers'] != null) {
			subscribers = new List<SleepLightMusicListModelPlaylistsSubscriber>();(json['subscribers'] as List).forEach((v) { subscribers.add(new SleepLightMusicListModelPlaylistsSubscriber.fromJson(v)); });
		}
		commentThreadId = json['commentThreadId'];
		highQuality = json['highQuality'];
		updateTime = json['updateTime'];
		trackUpdateTime = json['trackUpdateTime'];
		userId = json['userId'];
		coverStatus = json['coverStatus'];
		tracks = json['tracks'];
		tags = json['tags']?.cast<String>();
		anonimous = json['anonimous'];
		commentCount = json['commentCount'];
		cloudTrackCount = json['cloudTrackCount'];
		coverImgUrl = json['coverImgUrl'];
		playCount = json['playCount'];
		coverImgId = json['coverImgId'];
		createTime = json['createTime'];
		name = json['name'];
		subscribedCount = json['subscribedCount'];
		status = json['status'];
		newImported = json['newImported'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['description'] = this.description;
		data['privacy'] = this.privacy;
		data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
		data['subscribed'] = this.subscribed;
		data['shareCount'] = this.shareCount;
		data['trackCount'] = this.trackCount;
		data['adType'] = this.adType;
		data['coverImgId_str'] = this.coverimgidStr;
		data['specialType'] = this.specialType;
		data['id'] = this.id;
		data['alg'] = this.alg;
		data['totalDuration'] = this.totalDuration;
		data['ordered'] = this.ordered;
		if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
		if (this.subscribers != null) {
      data['subscribers'] =  this.subscribers.map((v) => v.toJson()).toList();
    }
		data['commentThreadId'] = this.commentThreadId;
		data['highQuality'] = this.highQuality;
		data['updateTime'] = this.updateTime;
		data['trackUpdateTime'] = this.trackUpdateTime;
		data['userId'] = this.userId;
		data['coverStatus'] = this.coverStatus;
		data['tracks'] = this.tracks;
		data['tags'] = this.tags;
		data['anonimous'] = this.anonimous;
		data['commentCount'] = this.commentCount;
		data['cloudTrackCount'] = this.cloudTrackCount;
		data['coverImgUrl'] = this.coverImgUrl;
		data['playCount'] = this.playCount;
		data['coverImgId'] = this.coverImgId;
		data['createTime'] = this.createTime;
		data['name'] = this.name;
		data['subscribedCount'] = this.subscribedCount;
		data['status'] = this.status;
		data['newImported'] = this.newImported;
		return data;
	}
}

class SleepLightMusicListModelPlaylistsCreator {
	int birthday;
	String detailDescription;
	String backgroundUrl;
	int gender;
	int city;
	String signature;
	String description;
	dynamic remarkName;
	int accountStatus;
	int avatarImgId;
	bool defaultAvatar;
	String backgroundImgIdStr;
	String avatarImgIdStr;
	int province;
	String nickname;
	List<String> expertTags;
	int djStatus;
	String avatarUrl;
	int authStatus;
	int vipType;
	bool followed;
	int userId;
	bool mutual;
	String avatarimgidStr;
	int authority;
	int userType;
	int backgroundImgId;
	dynamic experts;

	SleepLightMusicListModelPlaylistsCreator({this.birthday, this.detailDescription, this.backgroundUrl, this.gender, this.city, this.signature, this.description, this.remarkName, this.accountStatus, this.avatarImgId, this.defaultAvatar, this.backgroundImgIdStr, this.avatarImgIdStr, this.province, this.nickname, this.expertTags, this.djStatus, this.avatarUrl, this.authStatus, this.vipType, this.followed, this.userId, this.mutual, this.avatarimgidStr, this.authority, this.userType, this.backgroundImgId, this.experts});

	SleepLightMusicListModelPlaylistsCreator.fromJson(Map<String, dynamic> json) {
		birthday = json['birthday'];
		detailDescription = json['detailDescription'];
		backgroundUrl = json['backgroundUrl'];
		gender = json['gender'];
		city = json['city'];
		signature = json['signature'];
		description = json['description'];
		remarkName = json['remarkName'];
		accountStatus = json['accountStatus'];
		avatarImgId = json['avatarImgId'];
		defaultAvatar = json['defaultAvatar'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		avatarImgIdStr = json['avatarImgIdStr'];
		province = json['province'];
		nickname = json['nickname'];
		expertTags = json['expertTags']?.cast<String>();
		djStatus = json['djStatus'];
		avatarUrl = json['avatarUrl'];
		authStatus = json['authStatus'];
		vipType = json['vipType'];
		followed = json['followed'];
		userId = json['userId'];
		mutual = json['mutual'];
		avatarimgidStr = json['avatarImgId_str'];
		authority = json['authority'];
		userType = json['userType'];
		backgroundImgId = json['backgroundImgId'];
		experts = json['experts'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['birthday'] = this.birthday;
		data['detailDescription'] = this.detailDescription;
		data['backgroundUrl'] = this.backgroundUrl;
		data['gender'] = this.gender;
		data['city'] = this.city;
		data['signature'] = this.signature;
		data['description'] = this.description;
		data['remarkName'] = this.remarkName;
		data['accountStatus'] = this.accountStatus;
		data['avatarImgId'] = this.avatarImgId;
		data['defaultAvatar'] = this.defaultAvatar;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['province'] = this.province;
		data['nickname'] = this.nickname;
		data['expertTags'] = this.expertTags;
		data['djStatus'] = this.djStatus;
		data['avatarUrl'] = this.avatarUrl;
		data['authStatus'] = this.authStatus;
		data['vipType'] = this.vipType;
		data['followed'] = this.followed;
		data['userId'] = this.userId;
		data['mutual'] = this.mutual;
		data['avatarImgId_str'] = this.avatarimgidStr;
		data['authority'] = this.authority;
		data['userType'] = this.userType;
		data['backgroundImgId'] = this.backgroundImgId;
		data['experts'] = this.experts;
		return data;
	}
}

class SleepLightMusicListModelPlaylistsSubscriber {
	int birthday;
	String detailDescription;
	String backgroundUrl;
	int gender;
	int city;
	String signature;
	String description;
	dynamic remarkName;
	int accountStatus;
	int avatarImgId;
	bool defaultAvatar;
	String backgroundImgIdStr;
	String avatarImgIdStr;
	int province;
	String nickname;
	dynamic expertTags;
	int djStatus;
	String avatarUrl;
	int authStatus;
	int vipType;
	bool followed;
	int userId;
	bool mutual;
	String avatarimgidStr;
	int authority;
	int userType;
	int backgroundImgId;
	dynamic experts;

	SleepLightMusicListModelPlaylistsSubscriber({this.birthday, this.detailDescription, this.backgroundUrl, this.gender, this.city, this.signature, this.description, this.remarkName, this.accountStatus, this.avatarImgId, this.defaultAvatar, this.backgroundImgIdStr, this.avatarImgIdStr, this.province, this.nickname, this.expertTags, this.djStatus, this.avatarUrl, this.authStatus, this.vipType, this.followed, this.userId, this.mutual, this.avatarimgidStr, this.authority, this.userType, this.backgroundImgId, this.experts});

	SleepLightMusicListModelPlaylistsSubscriber.fromJson(Map<String, dynamic> json) {
		birthday = json['birthday'];
		detailDescription = json['detailDescription'];
		backgroundUrl = json['backgroundUrl'];
		gender = json['gender'];
		city = json['city'];
		signature = json['signature'];
		description = json['description'];
		remarkName = json['remarkName'];
		accountStatus = json['accountStatus'];
		avatarImgId = json['avatarImgId'];
		defaultAvatar = json['defaultAvatar'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		avatarImgIdStr = json['avatarImgIdStr'];
		province = json['province'];
		nickname = json['nickname'];
		expertTags = json['expertTags'];
		djStatus = json['djStatus'];
		avatarUrl = json['avatarUrl'];
		authStatus = json['authStatus'];
		vipType = json['vipType'];
		followed = json['followed'];
		userId = json['userId'];
		mutual = json['mutual'];
		avatarimgidStr = json['avatarImgId_str'];
		authority = json['authority'];
		userType = json['userType'];
		backgroundImgId = json['backgroundImgId'];
		experts = json['experts'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['birthday'] = this.birthday;
		data['detailDescription'] = this.detailDescription;
		data['backgroundUrl'] = this.backgroundUrl;
		data['gender'] = this.gender;
		data['city'] = this.city;
		data['signature'] = this.signature;
		data['description'] = this.description;
		data['remarkName'] = this.remarkName;
		data['accountStatus'] = this.accountStatus;
		data['avatarImgId'] = this.avatarImgId;
		data['defaultAvatar'] = this.defaultAvatar;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['province'] = this.province;
		data['nickname'] = this.nickname;
		data['expertTags'] = this.expertTags;
		data['djStatus'] = this.djStatus;
		data['avatarUrl'] = this.avatarUrl;
		data['authStatus'] = this.authStatus;
		data['vipType'] = this.vipType;
		data['followed'] = this.followed;
		data['userId'] = this.userId;
		data['mutual'] = this.mutual;
		data['avatarImgId_str'] = this.avatarimgidStr;
		data['authority'] = this.authority;
		data['userType'] = this.userType;
		data['backgroundImgId'] = this.backgroundImgId;
		data['experts'] = this.experts;
		return data;
	}
}
