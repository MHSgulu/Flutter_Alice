import 'package:alice/model/m_t_movie_detail_entity.dart';

mTMovieDetailEntityFromJson(MTMovieDetailEntity data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['titleCn'] != null) {
		data.titleCn = json['titleCn'].toString();
	}
	if (json['titleEn'] != null) {
		data.titleEn = json['titleEn'].toString();
	}
	if (json['rating'] != null) {
		data.rating = json['rating'].toString();
	}
	if (json['scoreCount'] != null) {
		data.scoreCount = json['scoreCount'].toString();
	}
	if (json['year'] != null) {
		data.year = json['year'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['runTime'] != null) {
		data.runTime = json['runTime'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['wapUrl'] != null) {
		data.wapUrl = json['wapUrl'].toString();
	}
	if (json['isEggHunt'] != null) {
		data.isEggHunt = json['isEggHunt'];
	}
	if (json['commonSpecial'] != null) {
		data.commonSpecial = json['commonSpecial'].toString();
	}
	if (json['hotRanking'] != null) {
		data.hotRanking = json['hotRanking'] is String
				? int.tryParse(json['hotRanking'])
				: json['hotRanking'].toInt();
	}
	if (json['weekBoxOffice'] != null) {
		data.weekBoxOffice = json['weekBoxOffice'].toString();
	}
	if (json['totalBoxOffice'] != null) {
		data.totalBoxOffice = json['totalBoxOffice'].toString();
	}
	if (json['weekBoxOfficeUnit'] != null) {
		data.weekBoxOfficeUnit = json['weekBoxOfficeUnit'].toString();
	}
	if (json['totalBoxOfficeUnit'] != null) {
		data.totalBoxOfficeUnit = json['totalBoxOfficeUnit'].toString();
	}
	if (json['director'] != null) {
		data.director = new MTMovieDetailDirector().fromJson(json['director']);
	}
	if (json['actorList'] != null) {
		data.actorList = new List<MTMovieDetailActorList>();
		(json['actorList'] as List).forEach((v) {
			data.actorList.add(new MTMovieDetailActorList().fromJson(v));
		});
	}
	if (json['isTicket'] != null) {
		data.isTicket = json['isTicket'];
	}
	if (json['showCinemaCount'] != null) {
		data.showCinemaCount = json['showCinemaCount'] is String
				? int.tryParse(json['showCinemaCount'])
				: json['showCinemaCount'].toInt();
	}
	if (json['showtimeCount'] != null) {
		data.showtimeCount = json['showtimeCount'] is String
				? int.tryParse(json['showtimeCount'])
				: json['showtimeCount'].toInt();
	}
	if (json['showDay'] != null) {
		data.showDay = json['showDay'] is String
				? int.tryParse(json['showDay'])
				: json['showDay'].toInt();
	}
	if (json['style'] != null) {
		data.style = new MTMovieDetailStyle().fromJson(json['style']);
	}
	if (json['is3D'] != null) {
		data.is3D = json['is3D'];
	}
	if (json['isIMAX'] != null) {
		data.isIMAX = json['isIMAX'];
	}
	if (json['isIMAX3D'] != null) {
		data.isIMAX3D = json['isIMAX3D'];
	}
	if (json['isDMAX'] != null) {
		data.isDMAX = json['isDMAX'];
	}
	if (json['festivals'] != null) {
		data.festivals = new List<dynamic>();
		data.festivals.addAll(json['festivals']);
	}
	if (json['awards'] != null) {
		data.awards = new List<dynamic>();
		data.awards.addAll(json['awards']);
	}
	if (json['totalWinAward'] != null) {
		data.totalWinAward = json['totalWinAward'] is String
				? int.tryParse(json['totalWinAward'])
				: json['totalWinAward'].toInt();
	}
	if (json['totalNominateAward'] != null) {
		data.totalNominateAward = json['totalNominateAward'] is String
				? int.tryParse(json['totalNominateAward'])
				: json['totalNominateAward'].toInt();
	}
	if (json['directors'] != null) {
		data.directors = json['directors']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['actors'] != null) {
		data.actors = json['actors']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['release'] != null) {
		data.release = new MTMovieDetailRelease().fromJson(json['release']);
	}
	if (json['imageCount'] != null) {
		data.imageCount = json['imageCount'] is String
				? int.tryParse(json['imageCount'])
				: json['imageCount'].toInt();
	}
	if (json['images'] != null) {
		data.images = json['images']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['video'] != null) {
		data.video = json['video'].toString();
	}
	if (json['videoId'] != null) {
		data.videoId = json['videoId'] is String
				? int.tryParse(json['videoId'])
				: json['videoId'].toInt();
	}
	if (json['videoCount'] != null) {
		data.videoCount = json['videoCount'] is String
				? int.tryParse(json['videoCount'])
				: json['videoCount'].toInt();
	}
	if (json['videos'] != null) {
		data.videos = new List<MTMovieDetailVideo>();
		(json['videos'] as List).forEach((v) {
			data.videos.add(new MTMovieDetailVideo().fromJson(v));
		});
	}
	if (json['personCount'] != null) {
		data.personCount = json['personCount'] is String
				? int.tryParse(json['personCount'])
				: json['personCount'].toInt();
	}
	return data;
}

Map<String, dynamic> mTMovieDetailEntityToJson(MTMovieDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['titleCn'] = entity.titleCn;
	data['titleEn'] = entity.titleEn;
	data['rating'] = entity.rating;
	data['scoreCount'] = entity.scoreCount;
	data['year'] = entity.year;
	data['content'] = entity.content;
	data['type'] = entity.type;
	data['runTime'] = entity.runTime;
	data['url'] = entity.url;
	data['wapUrl'] = entity.wapUrl;
	data['isEggHunt'] = entity.isEggHunt;
	data['commonSpecial'] = entity.commonSpecial;
	data['hotRanking'] = entity.hotRanking;
	data['weekBoxOffice'] = entity.weekBoxOffice;
	data['totalBoxOffice'] = entity.totalBoxOffice;
	data['weekBoxOfficeUnit'] = entity.weekBoxOfficeUnit;
	data['totalBoxOfficeUnit'] = entity.totalBoxOfficeUnit;
	if (entity.director != null) {
		data['director'] = entity.director.toJson();
	}
	if (entity.actorList != null) {
		data['actorList'] =  entity.actorList.map((v) => v.toJson()).toList();
	}
	data['isTicket'] = entity.isTicket;
	data['showCinemaCount'] = entity.showCinemaCount;
	data['showtimeCount'] = entity.showtimeCount;
	data['showDay'] = entity.showDay;
	if (entity.style != null) {
		data['style'] = entity.style.toJson();
	}
	data['is3D'] = entity.is3D;
	data['isIMAX'] = entity.isIMAX;
	data['isIMAX3D'] = entity.isIMAX3D;
	data['isDMAX'] = entity.isDMAX;
	if (entity.festivals != null) {
		data['festivals'] =  [];
	}
	if (entity.awards != null) {
		data['awards'] =  [];
	}
	data['totalWinAward'] = entity.totalWinAward;
	data['totalNominateAward'] = entity.totalNominateAward;
	data['directors'] = entity.directors;
	data['actors'] = entity.actors;
	if (entity.release != null) {
		data['release'] = entity.release.toJson();
	}
	data['imageCount'] = entity.imageCount;
	data['images'] = entity.images;
	data['video'] = entity.video;
	data['videoId'] = entity.videoId;
	data['videoCount'] = entity.videoCount;
	if (entity.videos != null) {
		data['videos'] =  entity.videos.map((v) => v.toJson()).toList();
	}
	data['personCount'] = entity.personCount;
	return data;
}

mTMovieDetailDirectorFromJson(MTMovieDetailDirector data, Map<String, dynamic> json) {
	if (json['directorId'] != null) {
		data.directorId = json['directorId'] is String
				? int.tryParse(json['directorId'])
				: json['directorId'].toInt();
	}
	if (json['directorName'] != null) {
		data.directorName = json['directorName'].toString();
	}
	if (json['directorNameEn'] != null) {
		data.directorNameEn = json['directorNameEn'].toString();
	}
	if (json['directorImg'] != null) {
		data.directorImg = json['directorImg'].toString();
	}
	return data;
}

Map<String, dynamic> mTMovieDetailDirectorToJson(MTMovieDetailDirector entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['directorId'] = entity.directorId;
	data['directorName'] = entity.directorName;
	data['directorNameEn'] = entity.directorNameEn;
	data['directorImg'] = entity.directorImg;
	return data;
}

mTMovieDetailActorListFromJson(MTMovieDetailActorList data, Map<String, dynamic> json) {
	if (json['actorId'] != null) {
		data.actorId = json['actorId'] is String
				? int.tryParse(json['actorId'])
				: json['actorId'].toInt();
	}
	if (json['actor'] != null) {
		data.actor = json['actor'].toString();
	}
	if (json['actorEn'] != null) {
		data.actorEn = json['actorEn'].toString();
	}
	if (json['actorImg'] != null) {
		data.actorImg = json['actorImg'].toString();
	}
	if (json['roleName'] != null) {
		data.roleName = json['roleName'].toString();
	}
	if (json['roleImg'] != null) {
		data.roleImg = json['roleImg'].toString();
	}
	return data;
}

Map<String, dynamic> mTMovieDetailActorListToJson(MTMovieDetailActorList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['actorId'] = entity.actorId;
	data['actor'] = entity.actor;
	data['actorEn'] = entity.actorEn;
	data['actorImg'] = entity.actorImg;
	data['roleName'] = entity.roleName;
	data['roleImg'] = entity.roleImg;
	return data;
}

mTMovieDetailStyleFromJson(MTMovieDetailStyle data, Map<String, dynamic> json) {
	if (json['ifLeadPage'] != null) {
		data.ifLeadPage = json['ifLeadPage'] is String
				? int.tryParse(json['ifLeadPage'])
				: json['ifLeadPage'].toInt();
	}
	if (json['leadUrl'] != null) {
		data.leadUrl = json['leadUrl'].toString();
	}
	if (json['leadImag'] != null) {
		data.leadImag = json['leadImag'].toString();
	}
	return data;
}

Map<String, dynamic> mTMovieDetailStyleToJson(MTMovieDetailStyle entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ifLeadPage'] = entity.ifLeadPage;
	data['leadUrl'] = entity.leadUrl;
	data['leadImag'] = entity.leadImag;
	return data;
}

mTMovieDetailReleaseFromJson(MTMovieDetailRelease data, Map<String, dynamic> json) {
	if (json['location'] != null) {
		data.location = json['location'].toString();
	}
	if (json['date'] != null) {
		data.date = json['date'].toString();
	}
	return data;
}

Map<String, dynamic> mTMovieDetailReleaseToJson(MTMovieDetailRelease entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['location'] = entity.location;
	data['date'] = entity.date;
	return data;
}

mTMovieDetailVideoFromJson(MTMovieDetailVideo data, Map<String, dynamic> json) {
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['length'] != null) {
		data.length = json['length'] is String
				? int.tryParse(json['length'])
				: json['length'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['videoId'] != null) {
		data.videoId = json['videoId'] is String
				? int.tryParse(json['videoId'])
				: json['videoId'].toInt();
	}
	return data;
}

Map<String, dynamic> mTMovieDetailVideoToJson(MTMovieDetailVideo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['url'] = entity.url;
	data['image'] = entity.image;
	data['length'] = entity.length;
	data['title'] = entity.title;
	data['videoId'] = entity.videoId;
	return data;
}