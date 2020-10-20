import 'package:alice/model/m_time_movie_detail_entity.dart';

mTimeMovieDetailEntityFromJson(MTimeMovieDetailEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['data'] != null) {
		data.data = new MTimeMovieDetailData().fromJson(json['data']);
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['showMsg'] != null) {
		data.showMsg = json['showMsg']?.toString();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailEntityToJson(MTimeMovieDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['msg'] = entity.msg;
	data['showMsg'] = entity.showMsg;
	return data;
}

mTimeMovieDetailDataFromJson(MTimeMovieDetailData data, Map<String, dynamic> json) {
	if (json['advertisement'] != null) {
		data.advertisement = new MTimeMovieDetailDataAdvertisement().fromJson(json['advertisement']);
	}
	if (json['basic'] != null) {
		data.basic = new MTimeMovieDetailDataBasic().fromJson(json['basic']);
	}
	if (json['boxOffice'] != null) {
		data.boxOffice = new MTimeMovieDetailDataBoxOffice().fromJson(json['boxOffice']);
	}
	if (json['live'] != null) {
		data.live = new MTimeMovieDetailDataLive().fromJson(json['live']);
	}
	if (json['playState'] != null) {
		data.playState = json['playState']?.toString();
	}
	if (json['playlist'] != null) {
		data.playlist = new List<dynamic>();
		data.playlist.addAll(json['playlist']);
	}
	if (json['related'] != null) {
		data.related = new MTimeMovieDetailDataRelated().fromJson(json['related']);
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataToJson(MTimeMovieDetailData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.advertisement != null) {
		data['advertisement'] = entity.advertisement.toJson();
	}
	if (entity.basic != null) {
		data['basic'] = entity.basic.toJson();
	}
	if (entity.boxOffice != null) {
		data['boxOffice'] = entity.boxOffice.toJson();
	}
	if (entity.live != null) {
		data['live'] = entity.live.toJson();
	}
	data['playState'] = entity.playState;
	if (entity.playlist != null) {
		data['playlist'] =  [];
	}
	if (entity.related != null) {
		data['related'] = entity.related.toJson();
	}
	return data;
}

mTimeMovieDetailDataAdvertisementFromJson(MTimeMovieDetailDataAdvertisement data, Map<String, dynamic> json) {
	if (json['advList'] != null) {
		data.advList = new List<dynamic>();
		data.advList.addAll(json['advList']);
	}
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['error'] != null) {
		data.error = json['error']?.toString();
	}
	if (json['success'] != null) {
		data.success = json['success'];
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataAdvertisementToJson(MTimeMovieDetailDataAdvertisement entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.advList != null) {
		data['advList'] =  [];
	}
	data['count'] = entity.count;
	data['error'] = entity.error;
	data['success'] = entity.success;
	return data;
}

mTimeMovieDetailDataBasicFromJson(MTimeMovieDetailDataBasic data, Map<String, dynamic> json) {
	if (json['actors'] != null) {
		data.actors = new List<MTimeMovieDetailDataBasicActor>();
		(json['actors'] as List).forEach((v) {
			data.actors.add(new MTimeMovieDetailDataBasicActor().fromJson(v));
		});
	}
	if (json['attitude'] != null) {
		data.attitude = json['attitude']?.toInt();
	}
	if (json['award'] != null) {
		data.award = new MTimeMovieDetailDataBasicAward().fromJson(json['award']);
	}
	if (json['bigImage'] != null) {
		data.bigImage = json['bigImage']?.toString();
	}
	if (json['broadcastDes'] != null) {
		data.broadcastDes = json['broadcastDes']?.toString();
	}
	if (json['commentSpecial'] != null) {
		data.commentSpecial = json['commentSpecial']?.toString();
	}
	if (json['community'] != null) {
		data.community = new MTimeMovieDetailDataBasicCommunity().fromJson(json['community']);
	}
	if (json['director'] != null) {
		data.director = new MTimeMovieDetailDataBasicDirector().fromJson(json['director']);
	}
	if (json['eggDesc'] != null) {
		data.eggDesc = json['eggDesc']?.toString();
	}
	if (json['episodeCnt'] != null) {
		data.episodeCnt = json['episodeCnt']?.toString();
	}
	if (json['festivals'] != null) {
		data.festivals = new List<dynamic>();
		data.festivals.addAll(json['festivals']);
	}
	if (json['hasSeenCount'] != null) {
		data.hasSeenCount = json['hasSeenCount']?.toInt();
	}
	if (json['hasSeenCountShow'] != null) {
		data.hasSeenCountShow = json['hasSeenCountShow']?.toString();
	}
	if (json['hotRanking'] != null) {
		data.hotRanking = json['hotRanking']?.toInt();
	}
	if (json['img'] != null) {
		data.img = json['img']?.toString();
	}
	if (json['is3D'] != null) {
		data.is3D = json['is3D'];
	}
	if (json['isDMAX'] != null) {
		data.isDMAX = json['isDMAX'];
	}
	if (json['isEggHunt'] != null) {
		data.isEggHunt = json['isEggHunt'];
	}
	if (json['isFavorite'] != null) {
		data.isFavorite = json['isFavorite']?.toInt();
	}
	if (json['isFilter'] != null) {
		data.isFilter = json['isFilter'];
	}
	if (json['isIMAX'] != null) {
		data.isIMAX = json['isIMAX'];
	}
	if (json['isIMAX3D'] != null) {
		data.isIMAX3D = json['isIMAX3D'];
	}
	if (json['isTicket'] != null) {
		data.isTicket = json['isTicket'];
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['mins'] != null) {
		data.mins = json['mins']?.toString();
	}
	if (json['movieId'] != null) {
		data.movieId = json['movieId']?.toInt();
	}
	if (json['movieStatus'] != null) {
		data.movieStatus = json['movieStatus']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['nameEn'] != null) {
		data.nameEn = json['nameEn']?.toString();
	}
	if (json['overallRating'] != null) {
		data.overallRating = json['overallRating']?.toInt();
	}
	if (json['personCount'] != null) {
		data.personCount = json['personCount']?.toInt();
	}
	if (json['quizGame'] != null) {
		data.quizGame = new MTimeMovieDetailDataBasicQuizGame().fromJson(json['quizGame']);
	}
	if (json['ratingCount'] != null) {
		data.ratingCount = json['ratingCount']?.toInt();
	}
	if (json['ratingCountShow'] != null) {
		data.ratingCountShow = json['ratingCountShow']?.toString();
	}
	if (json['releaseArea'] != null) {
		data.releaseArea = json['releaseArea']?.toString();
	}
	if (json['releaseDate'] != null) {
		data.releaseDate = json['releaseDate']?.toString();
	}
	if (json['sensitiveStatus'] != null) {
		data.sensitiveStatus = json['sensitiveStatus'];
	}
	if (json['showCinemaCount'] != null) {
		data.showCinemaCount = json['showCinemaCount']?.toInt();
	}
	if (json['showDay'] != null) {
		data.showDay = json['showDay']?.toInt();
	}
	if (json['showtimeCount'] != null) {
		data.showtimeCount = json['showtimeCount']?.toInt();
	}
	if (json['stageImg'] != null) {
		data.stageImg = new MTimeMovieDetailDataBasicStageImg().fromJson(json['stageImg']);
	}
	if (json['story'] != null) {
		data.story = json['story']?.toString();
	}
	if (json['style'] != null) {
		data.style = new MTimeMovieDetailDataBasicStyle().fromJson(json['style']);
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['totalNominateAward'] != null) {
		data.totalNominateAward = json['totalNominateAward']?.toInt();
	}
	if (json['totalWinAward'] != null) {
		data.totalWinAward = json['totalWinAward']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['userComment'] != null) {
		data.userComment = json['userComment']?.toString();
	}
	if (json['userCommentId'] != null) {
		data.userCommentId = json['userCommentId']?.toInt();
	}
	if (json['userImg'] != null) {
		data.userImg = json['userImg']?.toString();
	}
	if (json['userName'] != null) {
		data.userName = json['userName']?.toString();
	}
	if (json['userRating'] != null) {
		data.userRating = json['userRating']?.toInt();
	}
	if (json['video'] != null) {
		data.video = new MTimeMovieDetailDataBasicVideo().fromJson(json['video']);
	}
	if (json['wantToSeeCount'] != null) {
		data.wantToSeeCount = json['wantToSeeCount']?.toInt();
	}
	if (json['wantToSeeCountShow'] != null) {
		data.wantToSeeCountShow = json['wantToSeeCountShow']?.toString();
	}
	if (json['wantToSeeNumberShow'] != null) {
		data.wantToSeeNumberShow = json['wantToSeeNumberShow']?.toString();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicToJson(MTimeMovieDetailDataBasic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.actors != null) {
		data['actors'] =  entity.actors.map((v) => v.toJson()).toList();
	}
	data['attitude'] = entity.attitude;
	if (entity.award != null) {
		data['award'] = entity.award.toJson();
	}
	data['bigImage'] = entity.bigImage;
	data['broadcastDes'] = entity.broadcastDes;
	data['commentSpecial'] = entity.commentSpecial;
	if (entity.community != null) {
		data['community'] = entity.community.toJson();
	}
	if (entity.director != null) {
		data['director'] = entity.director.toJson();
	}
	data['eggDesc'] = entity.eggDesc;
	data['episodeCnt'] = entity.episodeCnt;
	if (entity.festivals != null) {
		data['festivals'] =  [];
	}
	data['hasSeenCount'] = entity.hasSeenCount;
	data['hasSeenCountShow'] = entity.hasSeenCountShow;
	data['hotRanking'] = entity.hotRanking;
	data['img'] = entity.img;
	data['is3D'] = entity.is3D;
	data['isDMAX'] = entity.isDMAX;
	data['isEggHunt'] = entity.isEggHunt;
	data['isFavorite'] = entity.isFavorite;
	data['isFilter'] = entity.isFilter;
	data['isIMAX'] = entity.isIMAX;
	data['isIMAX3D'] = entity.isIMAX3D;
	data['isTicket'] = entity.isTicket;
	data['message'] = entity.message;
	data['mins'] = entity.mins;
	data['movieId'] = entity.movieId;
	data['movieStatus'] = entity.movieStatus;
	data['name'] = entity.name;
	data['nameEn'] = entity.nameEn;
	data['overallRating'] = entity.overallRating;
	data['personCount'] = entity.personCount;
	if (entity.quizGame != null) {
		data['quizGame'] = entity.quizGame.toJson();
	}
	data['ratingCount'] = entity.ratingCount;
	data['ratingCountShow'] = entity.ratingCountShow;
	data['releaseArea'] = entity.releaseArea;
	data['releaseDate'] = entity.releaseDate;
	data['sensitiveStatus'] = entity.sensitiveStatus;
	data['showCinemaCount'] = entity.showCinemaCount;
	data['showDay'] = entity.showDay;
	data['showtimeCount'] = entity.showtimeCount;
	if (entity.stageImg != null) {
		data['stageImg'] = entity.stageImg.toJson();
	}
	data['story'] = entity.story;
	if (entity.style != null) {
		data['style'] = entity.style.toJson();
	}
	data['summary'] = entity.summary;
	data['totalNominateAward'] = entity.totalNominateAward;
	data['totalWinAward'] = entity.totalWinAward;
	data['type'] = entity.type;
	data['url'] = entity.url;
	data['userComment'] = entity.userComment;
	data['userCommentId'] = entity.userCommentId;
	data['userImg'] = entity.userImg;
	data['userName'] = entity.userName;
	data['userRating'] = entity.userRating;
	if (entity.video != null) {
		data['video'] = entity.video.toJson();
	}
	data['wantToSeeCount'] = entity.wantToSeeCount;
	data['wantToSeeCountShow'] = entity.wantToSeeCountShow;
	data['wantToSeeNumberShow'] = entity.wantToSeeNumberShow;
	data['year'] = entity.year;
	return data;
}

mTimeMovieDetailDataBasicActorFromJson(MTimeMovieDetailDataBasicActor data, Map<String, dynamic> json) {
	if (json['actorId'] != null) {
		data.actorId = json['actorId']?.toInt();
	}
	if (json['img'] != null) {
		data.img = json['img']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['nameEn'] != null) {
		data.nameEn = json['nameEn']?.toString();
	}
	if (json['roleImg'] != null) {
		data.roleImg = json['roleImg']?.toString();
	}
	if (json['roleName'] != null) {
		data.roleName = json['roleName']?.toString();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicActorToJson(MTimeMovieDetailDataBasicActor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['actorId'] = entity.actorId;
	data['img'] = entity.img;
	data['name'] = entity.name;
	data['nameEn'] = entity.nameEn;
	data['roleImg'] = entity.roleImg;
	data['roleName'] = entity.roleName;
	return data;
}

mTimeMovieDetailDataBasicAwardFromJson(MTimeMovieDetailDataBasicAward data, Map<String, dynamic> json) {
	if (json['awardList'] != null) {
		data.awardList = new List<dynamic>();
		data.awardList.addAll(json['awardList']);
	}
	if (json['totalNominateAward'] != null) {
		data.totalNominateAward = json['totalNominateAward']?.toInt();
	}
	if (json['totalWinAward'] != null) {
		data.totalWinAward = json['totalWinAward']?.toInt();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicAwardToJson(MTimeMovieDetailDataBasicAward entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.awardList != null) {
		data['awardList'] =  [];
	}
	data['totalNominateAward'] = entity.totalNominateAward;
	data['totalWinAward'] = entity.totalWinAward;
	return data;
}

mTimeMovieDetailDataBasicCommunityFromJson(MTimeMovieDetailDataBasicCommunity data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicCommunityToJson(MTimeMovieDetailDataBasicCommunity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

mTimeMovieDetailDataBasicDirectorFromJson(MTimeMovieDetailDataBasicDirector data, Map<String, dynamic> json) {
	if (json['directorId'] != null) {
		data.directorId = json['directorId']?.toInt();
	}
	if (json['img'] != null) {
		data.img = json['img']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['nameEn'] != null) {
		data.nameEn = json['nameEn']?.toString();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicDirectorToJson(MTimeMovieDetailDataBasicDirector entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['directorId'] = entity.directorId;
	data['img'] = entity.img;
	data['name'] = entity.name;
	data['nameEn'] = entity.nameEn;
	return data;
}

mTimeMovieDetailDataBasicQuizGameFromJson(MTimeMovieDetailDataBasicQuizGame data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicQuizGameToJson(MTimeMovieDetailDataBasicQuizGame entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

mTimeMovieDetailDataBasicStageImgFromJson(MTimeMovieDetailDataBasicStageImg data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<MTimeMovieDetailDataBasicStageImgList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new MTimeMovieDetailDataBasicStageImgList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicStageImgToJson(MTimeMovieDetailDataBasicStageImg entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

mTimeMovieDetailDataBasicStageImgListFromJson(MTimeMovieDetailDataBasicStageImgList data, Map<String, dynamic> json) {
	if (json['imgId'] != null) {
		data.imgId = json['imgId']?.toInt();
	}
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicStageImgListToJson(MTimeMovieDetailDataBasicStageImgList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgId'] = entity.imgId;
	data['imgUrl'] = entity.imgUrl;
	return data;
}

mTimeMovieDetailDataBasicStyleFromJson(MTimeMovieDetailDataBasicStyle data, Map<String, dynamic> json) {
	if (json['isLeadPage'] != null) {
		data.isLeadPage = json['isLeadPage']?.toInt();
	}
	if (json['leadImg'] != null) {
		data.leadImg = json['leadImg']?.toString();
	}
	if (json['leadUrl'] != null) {
		data.leadUrl = json['leadUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicStyleToJson(MTimeMovieDetailDataBasicStyle entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['isLeadPage'] = entity.isLeadPage;
	data['leadImg'] = entity.leadImg;
	data['leadUrl'] = entity.leadUrl;
	return data;
}

mTimeMovieDetailDataBasicVideoFromJson(MTimeMovieDetailDataBasicVideo data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['hightUrl'] != null) {
		data.hightUrl = json['hightUrl']?.toString();
	}
	if (json['img'] != null) {
		data.img = json['img']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['videoId'] != null) {
		data.videoId = json['videoId']?.toInt();
	}
	if (json['videoSourceType'] != null) {
		data.videoSourceType = json['videoSourceType']?.toInt();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBasicVideoToJson(MTimeMovieDetailDataBasicVideo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	data['hightUrl'] = entity.hightUrl;
	data['img'] = entity.img;
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['videoId'] = entity.videoId;
	data['videoSourceType'] = entity.videoSourceType;
	return data;
}

mTimeMovieDetailDataBoxOfficeFromJson(MTimeMovieDetailDataBoxOffice data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataBoxOfficeToJson(MTimeMovieDetailDataBoxOffice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

mTimeMovieDetailDataLiveFromJson(MTimeMovieDetailDataLive data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['img'] != null) {
		data.img = json['img']?.toString();
	}
	if (json['isSubscribe'] != null) {
		data.isSubscribe = json['isSubscribe'];
	}
	if (json['liveId'] != null) {
		data.liveId = json['liveId']?.toInt();
	}
	if (json['playNumTag'] != null) {
		data.playNumTag = json['playNumTag']?.toString();
	}
	if (json['playTag'] != null) {
		data.playTag = json['playTag']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataLiveToJson(MTimeMovieDetailDataLive entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	data['img'] = entity.img;
	data['isSubscribe'] = entity.isSubscribe;
	data['liveId'] = entity.liveId;
	data['playNumTag'] = entity.playNumTag;
	data['playTag'] = entity.playTag;
	data['status'] = entity.status;
	data['title'] = entity.title;
	return data;
}

mTimeMovieDetailDataRelatedFromJson(MTimeMovieDetailDataRelated data, Map<String, dynamic> json) {
	if (json['goodsCount'] != null) {
		data.goodsCount = json['goodsCount']?.toInt();
	}
	if (json['goodsList'] != null) {
		data.goodsList = new List<dynamic>();
		data.goodsList.addAll(json['goodsList']);
	}
	if (json['relateId'] != null) {
		data.relateId = json['relateId']?.toInt();
	}
	if (json['relatedUrl'] != null) {
		data.relatedUrl = json['relatedUrl']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	return data;
}

Map<String, dynamic> mTimeMovieDetailDataRelatedToJson(MTimeMovieDetailDataRelated entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['goodsCount'] = entity.goodsCount;
	if (entity.goodsList != null) {
		data['goodsList'] =  [];
	}
	data['relateId'] = entity.relateId;
	data['relatedUrl'] = entity.relatedUrl;
	data['type'] = entity.type;
	return data;
}