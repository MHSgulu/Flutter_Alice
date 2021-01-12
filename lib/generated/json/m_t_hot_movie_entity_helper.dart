import 'package:alice/model/m_t_hot_movie_entity.dart';

mTHotMovieEntityFromJson(MTHotMovieEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count'] is String
				? int.tryParse(json['count'])
				: json['count'].toInt();
	}
	if (json['movies'] != null) {
		data.movies = new List<MTHotMovieMovie>();
		(json['movies'] as List).forEach((v) {
			data.movies.add(new MTHotMovieMovie().fromJson(v));
		});
	}
	if (json['totalCinemaCount'] != null) {
		data.totalCinemaCount = json['totalCinemaCount'] is String
				? int.tryParse(json['totalCinemaCount'])
				: json['totalCinemaCount'].toInt();
	}
	if (json['totalComingMovie'] != null) {
		data.totalComingMovie = json['totalComingMovie'] is String
				? int.tryParse(json['totalComingMovie'])
				: json['totalComingMovie'].toInt();
	}
	if (json['totalHotMovie'] != null) {
		data.totalHotMovie = json['totalHotMovie'] is String
				? int.tryParse(json['totalHotMovie'])
				: json['totalHotMovie'].toInt();
	}
	return data;
}

Map<String, dynamic> mTHotMovieEntityToJson(MTHotMovieEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	if (entity.movies != null) {
		data['movies'] =  entity.movies.map((v) => v.toJson()).toList();
	}
	data['totalCinemaCount'] = entity.totalCinemaCount;
	data['totalComingMovie'] = entity.totalComingMovie;
	data['totalHotMovie'] = entity.totalHotMovie;
	return data;
}

mTHotMovieMovieFromJson(MTHotMovieMovie data, Map<String, dynamic> json) {
	if (json['actorName1'] != null) {
		data.actorName1 = json['actorName1'].toString();
	}
	if (json['actorName2'] != null) {
		data.actorName2 = json['actorName2'].toString();
	}
	if (json['btnText'] != null) {
		data.btnText = json['btnText'].toString();
	}
	if (json['commonSpecial'] != null) {
		data.commonSpecial = json['commonSpecial'].toString();
	}
	if (json['directorName'] != null) {
		data.directorName = json['directorName'].toString();
	}
	if (json['img'] != null) {
		data.img = json['img'].toString();
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
	if (json['length'] != null) {
		data.length = json['length'] is String
				? int.tryParse(json['length'])
				: json['length'].toInt();
	}
	if (json['movieId'] != null) {
		data.movieId = json['movieId'] is String
				? int.tryParse(json['movieId'])
				: json['movieId'].toInt();
	}
	if (json['nearestShowtime'] != null) {
		data.nearestShowtime = new MTHotMovieMoviesNearestShowtime().fromJson(json['nearestShowtime']);
	}
	if (json['preferentialFlag'] != null) {
		data.preferentialFlag = json['preferentialFlag'];
	}
	if (json['rDay'] != null) {
		data.rDay = json['rDay'] is String
				? int.tryParse(json['rDay'])
				: json['rDay'].toInt();
	}
	if (json['rMonth'] != null) {
		data.rMonth = json['rMonth'] is String
				? int.tryParse(json['rMonth'])
				: json['rMonth'].toInt();
	}
	if (json['rYear'] != null) {
		data.rYear = json['rYear'] is String
				? int.tryParse(json['rYear'])
				: json['rYear'].toInt();
	}
	if (json['ratingFinal'] != null) {
		data.ratingFinal = json['ratingFinal'] is String
				? double.tryParse(json['ratingFinal'])
				: json['ratingFinal'].toDouble();
	}
	if (json['titleCn'] != null) {
		data.titleCn = json['titleCn'].toString();
	}
	if (json['titleEn'] != null) {
		data.titleEn = json['titleEn'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	if (json['wantedCount'] != null) {
		data.wantedCount = json['wantedCount'] is String
				? int.tryParse(json['wantedCount'])
				: json['wantedCount'].toInt();
	}
	return data;
}

Map<String, dynamic> mTHotMovieMovieToJson(MTHotMovieMovie entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['actorName1'] = entity.actorName1;
	data['actorName2'] = entity.actorName2;
	data['btnText'] = entity.btnText;
	data['commonSpecial'] = entity.commonSpecial;
	data['directorName'] = entity.directorName;
	data['img'] = entity.img;
	data['is3D'] = entity.is3D;
	data['isDMAX'] = entity.isDMAX;
	data['isFilter'] = entity.isFilter;
	data['isHot'] = entity.isHot;
	data['isIMAX'] = entity.isIMAX;
	data['isIMAX3D'] = entity.isIMAX3D;
	data['isNew'] = entity.isNew;
	data['length'] = entity.length;
	data['movieId'] = entity.movieId;
	if (entity.nearestShowtime != null) {
		data['nearestShowtime'] = entity.nearestShowtime.toJson();
	}
	data['preferentialFlag'] = entity.preferentialFlag;
	data['rDay'] = entity.rDay;
	data['rMonth'] = entity.rMonth;
	data['rYear'] = entity.rYear;
	data['ratingFinal'] = entity.ratingFinal;
	data['titleCn'] = entity.titleCn;
	data['titleEn'] = entity.titleEn;
	data['type'] = entity.type;
	data['wantedCount'] = entity.wantedCount;
	return data;
}

mTHotMovieMoviesNearestShowtimeFromJson(MTHotMovieMoviesNearestShowtime data, Map<String, dynamic> json) {
	if (json['isTicket'] != null) {
		data.isTicket = json['isTicket'];
	}
	if (json['nearestCinemaCount'] != null) {
		data.nearestCinemaCount = json['nearestCinemaCount'] is String
				? int.tryParse(json['nearestCinemaCount'])
				: json['nearestCinemaCount'].toInt();
	}
	if (json['nearestShowDay'] != null) {
		data.nearestShowDay = json['nearestShowDay'] is String
				? int.tryParse(json['nearestShowDay'])
				: json['nearestShowDay'].toInt();
	}
	if (json['nearestShowtimeCount'] != null) {
		data.nearestShowtimeCount = json['nearestShowtimeCount'] is String
				? int.tryParse(json['nearestShowtimeCount'])
				: json['nearestShowtimeCount'].toInt();
	}
	return data;
}

Map<String, dynamic> mTHotMovieMoviesNearestShowtimeToJson(MTHotMovieMoviesNearestShowtime entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['isTicket'] = entity.isTicket;
	data['nearestCinemaCount'] = entity.nearestCinemaCount;
	data['nearestShowDay'] = entity.nearestShowDay;
	data['nearestShowtimeCount'] = entity.nearestShowtimeCount;
	return data;
}