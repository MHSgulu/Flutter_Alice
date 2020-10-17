import 'package:alice/model/mtime_hot_movie_entity.dart';

mtimeHotMovieEntityFromJson(MtimeHotMovieEntity data, Map<String, dynamic> json) {
	if (json['bImg'] != null) {
		data.bImg = json['bImg']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['hasPromo'] != null) {
		data.hasPromo = json['hasPromo'];
	}
	if (json['lid'] != null) {
		data.lid = json['lid']?.toInt();
	}
	if (json['ms'] != null) {
		data.ms = new List<MtimeHotMovieM>();
		(json['ms'] as List).forEach((v) {
			data.ms.add(new MtimeHotMovieM().fromJson(v));
		});
	}
	if (json['newActivitiesTime'] != null) {
		data.newActivitiesTime = json['newActivitiesTime']?.toInt();
	}
	if (json['promo'] != null) {
		data.promo = new MtimeHotMoviePromo().fromJson(json['promo']);
	}
	if (json['totalComingMovie'] != null) {
		data.totalComingMovie = json['totalComingMovie']?.toInt();
	}
	if (json['voucherMsg'] != null) {
		data.voucherMsg = json['voucherMsg']?.toString();
	}
	return data;
}

Map<String, dynamic> mtimeHotMovieEntityToJson(MtimeHotMovieEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['bImg'] = entity.bImg;
	data['date'] = entity.date;
	data['hasPromo'] = entity.hasPromo;
	data['lid'] = entity.lid;
	if (entity.ms != null) {
		data['ms'] =  entity.ms.map((v) => v.toJson()).toList();
	}
	data['newActivitiesTime'] = entity.newActivitiesTime;
	if (entity.promo != null) {
		data['promo'] = entity.promo.toJson();
	}
	data['totalComingMovie'] = entity.totalComingMovie;
	data['voucherMsg'] = entity.voucherMsg;
	return data;
}

mtimeHotMovieMFromJson(MtimeHotMovieM data, Map<String, dynamic> json) {
	if (json['NearestCinemaCount'] != null) {
		data.nearestCinemaCount = json['NearestCinemaCount']?.toInt();
	}
	if (json['NearestDay'] != null) {
		data.nearestDay = json['NearestDay']?.toInt();
	}
	if (json['NearestShowtimeCount'] != null) {
		data.nearestShowtimeCount = json['NearestShowtimeCount']?.toInt();
	}
	if (json['aN1'] != null) {
		data.aN1 = json['aN1']?.toString();
	}
	if (json['aN2'] != null) {
		data.aN2 = json['aN2']?.toString();
	}
	if (json['actors'] != null) {
		data.actors = json['actors']?.toString();
	}
	if (json['cC'] != null) {
		data.cC = json['cC']?.toInt();
	}
	if (json['commonSpecial'] != null) {
		data.commonSpecial = json['commonSpecial']?.toString();
	}
	if (json['d'] != null) {
		data.d = json['d']?.toString();
	}
	if (json['dN'] != null) {
		data.dN = json['dN']?.toString();
	}
	if (json['def'] != null) {
		data.def = json['def']?.toInt();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
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
	if (json['isFilter'] != null) {
		data.isFilter = json['isFilter'];
	}
	if (json['isHasTrailer'] != null) {
		data.isHasTrailer = json['isHasTrailer'];
	}
	if (json['isHot'] != null) {
		data.isHot = json['isHot'];
	}
	if (json['isIMAX'] != null) {
		data.isIMAX = json['isIMAX'];
	}
	if (json['isIMAX3D'] != null) {
		data.isIMAX3D = json['isIMAX3D'];
	}
	if (json['isNew'] != null) {
		data.isNew = json['isNew'];
	}
	if (json['isTicket'] != null) {
		data.isTicket = json['isTicket'];
	}
	if (json['m'] != null) {
		data.m = json['m']?.toString();
	}
	if (json['movieId'] != null) {
		data.movieId = json['movieId']?.toInt();
	}
	if (json['movieType'] != null) {
		data.movieType = json['movieType']?.toString();
	}
	if (json['p'] != null) {
		data.p = json['p']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['preferentialFlag'] != null) {
		data.preferentialFlag = json['preferentialFlag'];
	}
	if (json['r'] != null) {
		data.r = json['r']?.toDouble();
	}
	if (json['rc'] != null) {
		data.rc = json['rc']?.toInt();
	}
	if (json['rd'] != null) {
		data.rd = json['rd']?.toString();
	}
	if (json['rsC'] != null) {
		data.rsC = json['rsC']?.toInt();
	}
	if (json['sC'] != null) {
		data.sC = json['sC']?.toInt();
	}
	if (json['t'] != null) {
		data.t = json['t']?.toString();
	}
	if (json['tCn'] != null) {
		data.tCn = json['tCn']?.toString();
	}
	if (json['tEn'] != null) {
		data.tEn = json['tEn']?.toString();
	}
	if (json['ua'] != null) {
		data.ua = json['ua']?.toInt();
	}
	if (json['versions'] != null) {
		data.versions = new List<MtimeHotMovieMsVersion>();
		(json['versions'] as List).forEach((v) {
			data.versions.add(new MtimeHotMovieMsVersion().fromJson(v));
		});
	}
	if (json['wantedCount'] != null) {
		data.wantedCount = json['wantedCount']?.toInt();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	return data;
}

Map<String, dynamic> mtimeHotMovieMToJson(MtimeHotMovieM entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['NearestCinemaCount'] = entity.nearestCinemaCount;
	data['NearestDay'] = entity.nearestDay;
	data['NearestShowtimeCount'] = entity.nearestShowtimeCount;
	data['aN1'] = entity.aN1;
	data['aN2'] = entity.aN2;
	data['actors'] = entity.actors;
	data['cC'] = entity.cC;
	data['commonSpecial'] = entity.commonSpecial;
	data['d'] = entity.d;
	data['dN'] = entity.dN;
	data['def'] = entity.def;
	data['id'] = entity.id;
	data['img'] = entity.img;
	data['is3D'] = entity.is3D;
	data['isDMAX'] = entity.isDMAX;
	data['isFilter'] = entity.isFilter;
	data['isHasTrailer'] = entity.isHasTrailer;
	data['isHot'] = entity.isHot;
	data['isIMAX'] = entity.isIMAX;
	data['isIMAX3D'] = entity.isIMAX3D;
	data['isNew'] = entity.isNew;
	data['isTicket'] = entity.isTicket;
	data['m'] = entity.m;
	data['movieId'] = entity.movieId;
	data['movieType'] = entity.movieType;
	data['p'] = entity.p;
	data['preferentialFlag'] = entity.preferentialFlag;
	data['r'] = entity.r;
	data['rc'] = entity.rc;
	data['rd'] = entity.rd;
	data['rsC'] = entity.rsC;
	data['sC'] = entity.sC;
	data['t'] = entity.t;
	data['tCn'] = entity.tCn;
	data['tEn'] = entity.tEn;
	data['ua'] = entity.ua;
	if (entity.versions != null) {
		data['versions'] =  entity.versions.map((v) => v.toJson()).toList();
	}
	data['wantedCount'] = entity.wantedCount;
	data['year'] = entity.year;
	return data;
}

mtimeHotMovieMsVersionFromJson(MtimeHotMovieMsVersion data, Map<String, dynamic> json) {
	if (json['enum'] != null) {
		data.xEnum = json['enum']?.toInt();
	}
	if (json['version'] != null) {
		data.version = json['version']?.toString();
	}
	return data;
}

Map<String, dynamic> mtimeHotMovieMsVersionToJson(MtimeHotMovieMsVersion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['enum'] = entity.xEnum;
	data['version'] = entity.version;
	return data;
}

mtimeHotMoviePromoFromJson(MtimeHotMoviePromo data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> mtimeHotMoviePromoToJson(MtimeHotMoviePromo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}