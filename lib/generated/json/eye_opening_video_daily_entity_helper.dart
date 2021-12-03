import 'package:alice/model/eye_opening_video_daily_entity.dart';

eyeOpeningVideoDailyEntityFromJson(EyeOpeningVideoDailyEntity data, Map<String, dynamic> json) {
	if (json['itemList'] != null) {
		data.itemList = <EyeOpeningVideoDailyItemList>[];
		(json['itemList'] as List).forEach((v) {
			data.itemList.add(new EyeOpeningVideoDailyItemList().fromJson(v));
		});
	}
	if (json['count'] != null) {
		data.count = json['count'] is String
				? int.tryParse(json['count'])
				: json['count'].toInt();
	}
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	if (json['nextPageUrl'] != null) {
		data.nextPageUrl = json['nextPageUrl'].toString();
	}
	if (json['adExist'] != null) {
		data.adExist = json['adExist'];
	}
	if (json['date'] != null) {
		data.date = json['date'] is String
				? int.tryParse(json['date'])
				: json['date'].toInt();
	}
	if (json['nextPublishTime'] != null) {
		data.nextPublishTime = json['nextPublishTime'] is String
				? int.tryParse(json['nextPublishTime'])
				: json['nextPublishTime'].toInt();
	}
	if (json['dialog'] != null) {
		data.dialog = json['dialog'];
	}
	if (json['topIssue'] != null) {
		data.topIssue = json['topIssue'];
	}
	if (json['refreshCount'] != null) {
		data.refreshCount = json['refreshCount'] is String
				? int.tryParse(json['refreshCount'])
				: json['refreshCount'].toInt();
	}
	if (json['lastStartId'] != null) {
		data.lastStartId = json['lastStartId'] is String
				? int.tryParse(json['lastStartId'])
				: json['lastStartId'].toInt();
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyEntityToJson(EyeOpeningVideoDailyEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.itemList != null) {
		data['itemList'] =  entity.itemList.map((v) => v.toJson()).toList();
	}
	data['count'] = entity.count;
	data['total'] = entity.total;
	data['nextPageUrl'] = entity.nextPageUrl;
	data['adExist'] = entity.adExist;
	data['date'] = entity.date;
	data['nextPublishTime'] = entity.nextPublishTime;
	data['dialog'] = entity.dialog;
	data['topIssue'] = entity.topIssue;
	data['refreshCount'] = entity.refreshCount;
	data['lastStartId'] = entity.lastStartId;
	return data;
}

eyeOpeningVideoDailyItemListFromJson(EyeOpeningVideoDailyItemList data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['data'] != null) {
		data.data = new EyeOpeningVideoDailyItemListData().fromJson(json['data']);
	}
	if (json['trackingData'] != null) {
		data.trackingData = json['trackingData'];
	}
	if (json['tag'] != null) {
		data.tag = json['tag'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['adIndex'] != null) {
		data.adIndex = json['adIndex'] is String
				? int.tryParse(json['adIndex'])
				: json['adIndex'].toInt();
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListToJson(EyeOpeningVideoDailyItemList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['trackingData'] = entity.trackingData;
	data['tag'] = entity.tag;
	data['id'] = entity.id;
	data['adIndex'] = entity.adIndex;
	return data;
}

eyeOpeningVideoDailyItemListDataFromJson(EyeOpeningVideoDailyItemListData data, Map<String, dynamic> json) {
	if (json['dataType'] != null) {
		data.dataType = json['dataType'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['library'] != null) {
		data.xLibrary = json['library'].toString();
	}
	if (json['tags'] != null) {
		data.tags = <EyeOpeningVideoDailyItemListDataTag>[];
		(json['tags'] as List).forEach((v) {
			data.tags.add(new EyeOpeningVideoDailyItemListDataTag().fromJson(v));
		});
	}
	if (json['consumption'] != null) {
		data.consumption = new EyeOpeningVideoDailyItemListDataConsumption().fromJson(json['consumption']);
	}
	if (json['resourceType'] != null) {
		data.resourceType = json['resourceType'].toString();
	}
	if (json['slogan'] != null) {
		data.slogan = json['slogan'];
	}
	if (json['provider'] != null) {
		data.provider = new EyeOpeningVideoDailyItemListDataProvider().fromJson(json['provider']);
	}
	if (json['category'] != null) {
		data.category = json['category'].toString();
	}
	if (json['author'] != null) {
		data.author = new EyeOpeningVideoDailyItemListDataAuthor().fromJson(json['author']);
	}
	if (json['cover'] != null) {
		data.cover = new EyeOpeningVideoDailyItemListDataCover().fromJson(json['cover']);
	}
	if (json['playUrl'] != null) {
		data.playUrl = json['playUrl'].toString();
	}
	if (json['thumbPlayUrl'] != null) {
		data.thumbPlayUrl = json['thumbPlayUrl'];
	}
	if (json['duration'] != null) {
		data.duration = json['duration'] is String
				? int.tryParse(json['duration'])
				: json['duration'].toInt();
	}
	if (json['webUrl'] != null) {
		data.webUrl = new EyeOpeningVideoDailyItemListDataWebUrl().fromJson(json['webUrl']);
	}
	if (json['releaseTime'] != null) {
		data.releaseTime = json['releaseTime'] is String
				? int.tryParse(json['releaseTime'])
				: json['releaseTime'].toInt();
	}
	if (json['playInfo'] != null) {
		data.playInfo = <dynamic>[];
		data.playInfo.addAll(json['playInfo']);
	}
	if (json['campaign'] != null) {
		data.campaign = json['campaign'];
	}
	if (json['waterMarks'] != null) {
		data.waterMarks = json['waterMarks'];
	}
	if (json['ad'] != null) {
		data.ad = json['ad'];
	}
	if (json['adTrack'] != null) {
		data.adTrack = <dynamic>[];
		data.adTrack.addAll(json['adTrack']);
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['titlePgc'] != null) {
		data.titlePgc = json['titlePgc'].toString();
	}
	if (json['descriptionPgc'] != null) {
		data.descriptionPgc = json['descriptionPgc'].toString();
	}
	if (json['remark'] != null) {
		data.remark = json['remark'].toString();
	}
	if (json['ifLimitVideo'] != null) {
		data.ifLimitVideo = json['ifLimitVideo'];
	}
	if (json['searchWeight'] != null) {
		data.searchWeight = json['searchWeight'] is String
				? int.tryParse(json['searchWeight'])
				: json['searchWeight'].toInt();
	}
	if (json['brandWebsiteInfo'] != null) {
		data.brandWebsiteInfo = json['brandWebsiteInfo'];
	}
	if (json['videoPosterBean'] != null) {
		data.videoPosterBean = new EyeOpeningVideoDailyItemListDataVideoPosterBean().fromJson(json['videoPosterBean']);
	}
	if (json['idx'] != null) {
		data.idx = json['idx'] is String
				? int.tryParse(json['idx'])
				: json['idx'].toInt();
	}
	if (json['shareAdTrack'] != null) {
		data.shareAdTrack = json['shareAdTrack'];
	}
	if (json['favoriteAdTrack'] != null) {
		data.favoriteAdTrack = json['favoriteAdTrack'];
	}
	if (json['webAdTrack'] != null) {
		data.webAdTrack = json['webAdTrack'];
	}
	if (json['date'] != null) {
		data.date = json['date'] is String
				? int.tryParse(json['date'])
				: json['date'].toInt();
	}
	if (json['promotion'] != null) {
		data.promotion = json['promotion'];
	}
	if (json['label'] != null) {
		data.label = json['label'];
	}
	if (json['labelList'] != null) {
		data.labelList = <dynamic>[];
		data.labelList.addAll(json['labelList']);
	}
	if (json['descriptionEditor'] != null) {
		data.descriptionEditor = json['descriptionEditor'].toString();
	}
	if (json['collected'] != null) {
		data.collected = json['collected'];
	}
	if (json['reallyCollected'] != null) {
		data.reallyCollected = json['reallyCollected'];
	}
	if (json['played'] != null) {
		data.played = json['played'];
	}
	if (json['subtitles'] != null) {
		data.subtitles = <dynamic>[];
		data.subtitles.addAll(json['subtitles']);
	}
	if (json['lastViewTime'] != null) {
		data.lastViewTime = json['lastViewTime'];
	}
	if (json['playlists'] != null) {
		data.playlists = json['playlists'];
	}
	if (json['src'] != null) {
		data.src = json['src'];
	}
	if (json['recallSource'] != null) {
		data.recallSource = json['recallSource'];
	}
	if (json['recall_source'] != null) {
		data.recallsource = json['recall_source'];
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataToJson(EyeOpeningVideoDailyItemListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dataType'] = entity.dataType;
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['library'] = entity.xLibrary;
	if (entity.tags != null) {
		data['tags'] =  entity.tags.map((v) => v.toJson()).toList();
	}
	if (entity.consumption != null) {
		data['consumption'] = entity.consumption.toJson();
	}
	data['resourceType'] = entity.resourceType;
	data['slogan'] = entity.slogan;
	if (entity.provider != null) {
		data['provider'] = entity.provider.toJson();
	}
	data['category'] = entity.category;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	if (entity.cover != null) {
		data['cover'] = entity.cover.toJson();
	}
	data['playUrl'] = entity.playUrl;
	data['thumbPlayUrl'] = entity.thumbPlayUrl;
	data['duration'] = entity.duration;
	if (entity.webUrl != null) {
		data['webUrl'] = entity.webUrl.toJson();
	}
	data['releaseTime'] = entity.releaseTime;
	if (entity.playInfo != null) {
		data['playInfo'] =  [];
	}
	data['campaign'] = entity.campaign;
	data['waterMarks'] = entity.waterMarks;
	data['ad'] = entity.ad;
	if (entity.adTrack != null) {
		data['adTrack'] =  [];
	}
	data['type'] = entity.type;
	data['titlePgc'] = entity.titlePgc;
	data['descriptionPgc'] = entity.descriptionPgc;
	data['remark'] = entity.remark;
	data['ifLimitVideo'] = entity.ifLimitVideo;
	data['searchWeight'] = entity.searchWeight;
	data['brandWebsiteInfo'] = entity.brandWebsiteInfo;
	if (entity.videoPosterBean != null) {
		data['videoPosterBean'] = entity.videoPosterBean.toJson();
	}
	data['idx'] = entity.idx;
	data['shareAdTrack'] = entity.shareAdTrack;
	data['favoriteAdTrack'] = entity.favoriteAdTrack;
	data['webAdTrack'] = entity.webAdTrack;
	data['date'] = entity.date;
	data['promotion'] = entity.promotion;
	data['label'] = entity.label;
	if (entity.labelList != null) {
		data['labelList'] =  [];
	}
	data['descriptionEditor'] = entity.descriptionEditor;
	data['collected'] = entity.collected;
	data['reallyCollected'] = entity.reallyCollected;
	data['played'] = entity.played;
	if (entity.subtitles != null) {
		data['subtitles'] =  [];
	}
	data['lastViewTime'] = entity.lastViewTime;
	data['playlists'] = entity.playlists;
	data['src'] = entity.src;
	data['recallSource'] = entity.recallSource;
	data['recall_source'] = entity.recallsource;
	return data;
}

eyeOpeningVideoDailyItemListDataTagFromJson(EyeOpeningVideoDailyItemListDataTag data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['actionUrl'] != null) {
		data.actionUrl = json['actionUrl'].toString();
	}
	if (json['adTrack'] != null) {
		data.adTrack = json['adTrack'];
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	if (json['bgPicture'] != null) {
		data.bgPicture = json['bgPicture'].toString();
	}
	if (json['headerImage'] != null) {
		data.headerImage = json['headerImage'].toString();
	}
	if (json['tagRecType'] != null) {
		data.tagRecType = json['tagRecType'].toString();
	}
	if (json['childTagList'] != null) {
		data.childTagList = json['childTagList'];
	}
	if (json['childTagIdList'] != null) {
		data.childTagIdList = json['childTagIdList'];
	}
	if (json['haveReward'] != null) {
		data.haveReward = json['haveReward'];
	}
	if (json['ifNewest'] != null) {
		data.ifNewest = json['ifNewest'];
	}
	if (json['newestEndTime'] != null) {
		data.newestEndTime = json['newestEndTime'];
	}
	if (json['communityIndex'] != null) {
		data.communityIndex = json['communityIndex'] is String
				? int.tryParse(json['communityIndex'])
				: json['communityIndex'].toInt();
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataTagToJson(EyeOpeningVideoDailyItemListDataTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['actionUrl'] = entity.actionUrl;
	data['adTrack'] = entity.adTrack;
	data['desc'] = entity.desc;
	data['bgPicture'] = entity.bgPicture;
	data['headerImage'] = entity.headerImage;
	data['tagRecType'] = entity.tagRecType;
	data['childTagList'] = entity.childTagList;
	data['childTagIdList'] = entity.childTagIdList;
	data['haveReward'] = entity.haveReward;
	data['ifNewest'] = entity.ifNewest;
	data['newestEndTime'] = entity.newestEndTime;
	data['communityIndex'] = entity.communityIndex;
	return data;
}

eyeOpeningVideoDailyItemListDataConsumptionFromJson(EyeOpeningVideoDailyItemListDataConsumption data, Map<String, dynamic> json) {
	if (json['collectionCount'] != null) {
		data.collectionCount = json['collectionCount'] is String
				? int.tryParse(json['collectionCount'])
				: json['collectionCount'].toInt();
	}
	if (json['shareCount'] != null) {
		data.shareCount = json['shareCount'] is String
				? int.tryParse(json['shareCount'])
				: json['shareCount'].toInt();
	}
	if (json['replyCount'] != null) {
		data.replyCount = json['replyCount'] is String
				? int.tryParse(json['replyCount'])
				: json['replyCount'].toInt();
	}
	if (json['realCollectionCount'] != null) {
		data.realCollectionCount = json['realCollectionCount'] is String
				? int.tryParse(json['realCollectionCount'])
				: json['realCollectionCount'].toInt();
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataConsumptionToJson(EyeOpeningVideoDailyItemListDataConsumption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['collectionCount'] = entity.collectionCount;
	data['shareCount'] = entity.shareCount;
	data['replyCount'] = entity.replyCount;
	data['realCollectionCount'] = entity.realCollectionCount;
	return data;
}

eyeOpeningVideoDailyItemListDataProviderFromJson(EyeOpeningVideoDailyItemListDataProvider data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['alias'] != null) {
		data.alias = json['alias'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataProviderToJson(EyeOpeningVideoDailyItemListDataProvider entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['alias'] = entity.alias;
	data['icon'] = entity.icon;
	return data;
}

eyeOpeningVideoDailyItemListDataAuthorFromJson(EyeOpeningVideoDailyItemListDataAuthor data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['link'] != null) {
		data.link = json['link'].toString();
	}
	if (json['latestReleaseTime'] != null) {
		data.latestReleaseTime = json['latestReleaseTime'] is String
				? int.tryParse(json['latestReleaseTime'])
				: json['latestReleaseTime'].toInt();
	}
	if (json['videoNum'] != null) {
		data.videoNum = json['videoNum'] is String
				? int.tryParse(json['videoNum'])
				: json['videoNum'].toInt();
	}
	if (json['adTrack'] != null) {
		data.adTrack = json['adTrack'];
	}
	if (json['follow'] != null) {
		data.follow = new EyeOpeningVideoDailyItemListDataAuthorFollow().fromJson(json['follow']);
	}
	if (json['shield'] != null) {
		data.shield = new EyeOpeningVideoDailyItemListDataAuthorShield().fromJson(json['shield']);
	}
	if (json['approvedNotReadyVideoCount'] != null) {
		data.approvedNotReadyVideoCount = json['approvedNotReadyVideoCount'] is String
				? int.tryParse(json['approvedNotReadyVideoCount'])
				: json['approvedNotReadyVideoCount'].toInt();
	}
	if (json['ifPgc'] != null) {
		data.ifPgc = json['ifPgc'];
	}
	if (json['recSort'] != null) {
		data.recSort = json['recSort'] is String
				? int.tryParse(json['recSort'])
				: json['recSort'].toInt();
	}
	if (json['expert'] != null) {
		data.expert = json['expert'];
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataAuthorToJson(EyeOpeningVideoDailyItemListDataAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['icon'] = entity.icon;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['link'] = entity.link;
	data['latestReleaseTime'] = entity.latestReleaseTime;
	data['videoNum'] = entity.videoNum;
	data['adTrack'] = entity.adTrack;
	if (entity.follow != null) {
		data['follow'] = entity.follow.toJson();
	}
	if (entity.shield != null) {
		data['shield'] = entity.shield.toJson();
	}
	data['approvedNotReadyVideoCount'] = entity.approvedNotReadyVideoCount;
	data['ifPgc'] = entity.ifPgc;
	data['recSort'] = entity.recSort;
	data['expert'] = entity.expert;
	return data;
}

eyeOpeningVideoDailyItemListDataAuthorFollowFromJson(EyeOpeningVideoDailyItemListDataAuthorFollow data, Map<String, dynamic> json) {
	if (json['itemType'] != null) {
		data.itemType = json['itemType'].toString();
	}
	if (json['itemId'] != null) {
		data.itemId = json['itemId'] is String
				? int.tryParse(json['itemId'])
				: json['itemId'].toInt();
	}
	if (json['followed'] != null) {
		data.followed = json['followed'];
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataAuthorFollowToJson(EyeOpeningVideoDailyItemListDataAuthorFollow entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['itemType'] = entity.itemType;
	data['itemId'] = entity.itemId;
	data['followed'] = entity.followed;
	return data;
}

eyeOpeningVideoDailyItemListDataAuthorShieldFromJson(EyeOpeningVideoDailyItemListDataAuthorShield data, Map<String, dynamic> json) {
	if (json['itemType'] != null) {
		data.itemType = json['itemType'].toString();
	}
	if (json['itemId'] != null) {
		data.itemId = json['itemId'] is String
				? int.tryParse(json['itemId'])
				: json['itemId'].toInt();
	}
	if (json['shielded'] != null) {
		data.shielded = json['shielded'];
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataAuthorShieldToJson(EyeOpeningVideoDailyItemListDataAuthorShield entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['itemType'] = entity.itemType;
	data['itemId'] = entity.itemId;
	data['shielded'] = entity.shielded;
	return data;
}

eyeOpeningVideoDailyItemListDataCoverFromJson(EyeOpeningVideoDailyItemListDataCover data, Map<String, dynamic> json) {
	if (json['feed'] != null) {
		data.feed = json['feed'].toString();
	}
	if (json['detail'] != null) {
		data.detail = json['detail'].toString();
	}
	if (json['blurred'] != null) {
		data.blurred = json['blurred'].toString();
	}
	if (json['sharing'] != null) {
		data.sharing = json['sharing'];
	}
	if (json['homepage'] != null) {
		data.homepage = json['homepage'].toString();
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataCoverToJson(EyeOpeningVideoDailyItemListDataCover entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['feed'] = entity.feed;
	data['detail'] = entity.detail;
	data['blurred'] = entity.blurred;
	data['sharing'] = entity.sharing;
	data['homepage'] = entity.homepage;
	return data;
}

eyeOpeningVideoDailyItemListDataWebUrlFromJson(EyeOpeningVideoDailyItemListDataWebUrl data, Map<String, dynamic> json) {
	if (json['raw'] != null) {
		data.raw = json['raw'].toString();
	}
	if (json['forWeibo'] != null) {
		data.forWeibo = json['forWeibo'].toString();
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataWebUrlToJson(EyeOpeningVideoDailyItemListDataWebUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['raw'] = entity.raw;
	data['forWeibo'] = entity.forWeibo;
	return data;
}

eyeOpeningVideoDailyItemListDataVideoPosterBeanFromJson(EyeOpeningVideoDailyItemListDataVideoPosterBean data, Map<String, dynamic> json) {
	if (json['scale'] != null) {
		data.scale = json['scale'] is String
				? double.tryParse(json['scale'])
				: json['scale'].toDouble();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['fileSizeStr'] != null) {
		data.fileSizeStr = json['fileSizeStr'].toString();
	}
	return data;
}

Map<String, dynamic> eyeOpeningVideoDailyItemListDataVideoPosterBeanToJson(EyeOpeningVideoDailyItemListDataVideoPosterBean entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['scale'] = entity.scale;
	data['url'] = entity.url;
	data['fileSizeStr'] = entity.fileSizeStr;
	return data;
}