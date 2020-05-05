import 'package:alice/model/film_maker_works_entity.dart';
/*
* 废弃
*/
filmMakerWorksEntityFromJson(FilmMakerWorksEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['start'] != null) {
		data.start = json['start']?.toInt();
	}
	if (json['celebrity'] != null) {
		data.celebrity = new FilmMakerWorksCelebrity().fromJson(json['celebrity']);
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['works'] != null) {
		data.works = new List<FilmMakerWorksWork>();
		(json['works'] as List).forEach((v) {
			data.works.add(new FilmMakerWorksWork().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> filmMakerWorksEntityToJson(FilmMakerWorksEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	data['start'] = entity.start;
	if (entity.celebrity != null) {
		data['celebrity'] = entity.celebrity.toJson();
	}
	data['total'] = entity.total;
	if (entity.works != null) {
		data['works'] =  entity.works.map((v) => v.toJson()).toList();
	}
	return data;
}

filmMakerWorksCelebrityFromJson(FilmMakerWorksCelebrity data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerWorksCelebrityAvatars().fromJson(json['avatars']);
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksCelebrityToJson(FilmMakerWorksCelebrity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.avatars != null) {
		data['avatars'] = entity.avatars.toJson();
	}
	data['name_en'] = entity.nameEn;
	data['name'] = entity.name;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

filmMakerWorksCelebrityAvatarsFromJson(FilmMakerWorksCelebrityAvatars data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['large'] != null) {
		data.large = json['large']?.toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksCelebrityAvatarsToJson(FilmMakerWorksCelebrityAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerWorksWorkFromJson(FilmMakerWorksWork data, Map<String, dynamic> json) {
	if (json['roles'] != null) {
		data.roles = json['roles']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['subject'] != null) {
		data.subject = new FilmMakerWorksWorksSubject().fromJson(json['subject']);
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorkToJson(FilmMakerWorksWork entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['roles'] = entity.roles;
	if (entity.subject != null) {
		data['subject'] = entity.subject.toJson();
	}
	return data;
}

filmMakerWorksWorksSubjectFromJson(FilmMakerWorksWorksSubject data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new FilmMakerWorksWorksSubjectRating().fromJson(json['rating']);
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['casts'] != null) {
		data.casts = new List<FilmMakerWorksWorksSubjectCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new FilmMakerWorksWorksSubjectCast().fromJson(v));
		});
	}
	if (json['durations'] != null) {
		data.durations = new List<dynamic>();
		data.durations.addAll(json['durations']);
	}
	if (json['collect_count'] != null) {
		data.collectCount = json['collect_count']?.toInt();
	}
	if (json['mainland_pubdate'] != null) {
		data.mainlandPubdate = json['mainland_pubdate']?.toString();
	}
	if (json['has_video'] != null) {
		data.hasVideo = json['has_video'];
	}
	if (json['original_title'] != null) {
		data.originalTitle = json['original_title']?.toString();
	}
	if (json['subtype'] != null) {
		data.subtype = json['subtype']?.toString();
	}
	if (json['directors'] != null) {
		data.directors = new List<FilmMakerWorksWorksSubjectDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new FilmMakerWorksWorksSubjectDirector().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['images'] != null) {
		data.images = new FilmMakerWorksWorksSubjectImages().fromJson(json['images']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorksSubjectToJson(FilmMakerWorksWorksSubject entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['genres'] = entity.genres;
	data['title'] = entity.title;
	if (entity.casts != null) {
		data['casts'] =  entity.casts.map((v) => v.toJson()).toList();
	}
	if (entity.durations != null) {
		data['durations'] =  [];
	}
	data['collect_count'] = entity.collectCount;
	data['mainland_pubdate'] = entity.mainlandPubdate;
	data['has_video'] = entity.hasVideo;
	data['original_title'] = entity.originalTitle;
	data['subtype'] = entity.subtype;
	if (entity.directors != null) {
		data['directors'] =  entity.directors.map((v) => v.toJson()).toList();
	}
	data['pubdates'] = entity.pubdates;
	data['year'] = entity.year;
	if (entity.images != null) {
		data['images'] = entity.images.toJson();
	}
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

filmMakerWorksWorksSubjectRatingFromJson(FilmMakerWorksWorksSubjectRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toInt();
	}
	if (json['details'] != null) {
		data.details = new FilmMakerWorksWorksSubjectRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorksSubjectRatingToJson(FilmMakerWorksWorksSubjectRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['max'] = entity.max;
	data['average'] = entity.average;
	if (entity.details != null) {
		data['details'] = entity.details.toJson();
	}
	data['stars'] = entity.stars;
	data['min'] = entity.min;
	return data;
}

filmMakerWorksWorksSubjectRatingDetailsFromJson(FilmMakerWorksWorksSubjectRatingDetails data, Map<String, dynamic> json) {
	if (json['1'] != null) {
		data.x1 = json['1']?.toInt();
	}
	if (json['3'] != null) {
		data.x3 = json['3']?.toInt();
	}
	if (json['2'] != null) {
		data.x2 = json['2']?.toInt();
	}
	if (json['5'] != null) {
		data.x5 = json['5']?.toInt();
	}
	if (json['4'] != null) {
		data.x4 = json['4']?.toInt();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorksSubjectRatingDetailsToJson(FilmMakerWorksWorksSubjectRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	data['3'] = entity.x3;
	data['2'] = entity.x2;
	data['5'] = entity.x5;
	data['4'] = entity.x4;
	return data;
}

filmMakerWorksWorksSubjectCastFromJson(FilmMakerWorksWorksSubjectCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerWorksWorksSubjectCastsAvatars().fromJson(json['avatars']);
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorksSubjectCastToJson(FilmMakerWorksWorksSubjectCast entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.avatars != null) {
		data['avatars'] = entity.avatars.toJson();
	}
	data['name_en'] = entity.nameEn;
	data['name'] = entity.name;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

filmMakerWorksWorksSubjectCastsAvatarsFromJson(FilmMakerWorksWorksSubjectCastsAvatars data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['large'] != null) {
		data.large = json['large']?.toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorksSubjectCastsAvatarsToJson(FilmMakerWorksWorksSubjectCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerWorksWorksSubjectDirectorFromJson(FilmMakerWorksWorksSubjectDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerWorksWorksSubjectDirectorsAvatars().fromJson(json['avatars']);
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorksSubjectDirectorToJson(FilmMakerWorksWorksSubjectDirector entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.avatars != null) {
		data['avatars'] = entity.avatars.toJson();
	}
	data['name_en'] = entity.nameEn;
	data['name'] = entity.name;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

filmMakerWorksWorksSubjectDirectorsAvatarsFromJson(FilmMakerWorksWorksSubjectDirectorsAvatars data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['large'] != null) {
		data.large = json['large']?.toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorksSubjectDirectorsAvatarsToJson(FilmMakerWorksWorksSubjectDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerWorksWorksSubjectImagesFromJson(FilmMakerWorksWorksSubjectImages data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small']?.toString();
	}
	if (json['large'] != null) {
		data.large = json['large']?.toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksWorksSubjectImagesToJson(FilmMakerWorksWorksSubjectImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}