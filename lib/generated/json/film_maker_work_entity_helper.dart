import 'package:alice/model/film_maker_work_entity.dart';
import 'package:alice/generated/json/base/json_filed.dart';

filmMakerWorkEntityFromJson(FilmMakerWorkEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['start'] != null) {
		data.start = json['start']?.toInt();
	}
	if (json['celebrity'] != null) {
		data.celebrity = new FilmMakerWorkCelebrity().fromJson(json['celebrity']);
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['works'] != null) {
		data.works = new List<FilmMakerWorkWork>();
		(json['works'] as List).forEach((v) {
			data.works.add(new FilmMakerWorkWork().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> filmMakerWorkEntityToJson(FilmMakerWorkEntity entity) {
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

filmMakerWorkCelebrityFromJson(FilmMakerWorkCelebrity data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerWorkCelebrityAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> filmMakerWorkCelebrityToJson(FilmMakerWorkCelebrity entity) {
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

filmMakerWorkCelebrityAvatarsFromJson(FilmMakerWorkCelebrityAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerWorkCelebrityAvatarsToJson(FilmMakerWorkCelebrityAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerWorkWorkFromJson(FilmMakerWorkWork data, Map<String, dynamic> json) {
	if (json['roles'] != null) {
		data.roles = json['roles']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['subject'] != null) {
		data.subject = new FilmMakerWorkWorksSubject().fromJson(json['subject']);
	}
	return data;
}

Map<String, dynamic> filmMakerWorkWorkToJson(FilmMakerWorkWork entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['roles'] = entity.roles;
	if (entity.subject != null) {
		data['subject'] = entity.subject.toJson();
	}
	return data;
}

filmMakerWorkWorksSubjectFromJson(FilmMakerWorkWorksSubject data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new FilmMakerWorkWorksSubjectRating().fromJson(json['rating']);
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['casts'] != null) {
		data.casts = new List<FilmMakerWorkWorksSubjectCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new FilmMakerWorkWorksSubjectCast().fromJson(v));
		});
	}
	if (json['durations'] != null) {
		data.durations = json['durations']?.map((v) => v?.toString())?.toList()?.cast<String>();
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
		data.directors = new List<FilmMakerWorkWorksSubjectDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new FilmMakerWorkWorksSubjectDirector().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['images'] != null) {
		data.images = new FilmMakerWorkWorksSubjectImages().fromJson(json['images']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorkWorksSubjectToJson(FilmMakerWorkWorksSubject entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['genres'] = entity.genres;
	data['title'] = entity.title;
	if (entity.casts != null) {
		data['casts'] =  entity.casts.map((v) => v.toJson()).toList();
	}
	data['durations'] = entity.durations;
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

filmMakerWorkWorksSubjectRatingFromJson(FilmMakerWorkWorksSubjectRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toDouble();
	}
	if (json['details'] != null) {
		data.details = new FilmMakerWorkWorksSubjectRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> filmMakerWorkWorksSubjectRatingToJson(FilmMakerWorkWorksSubjectRating entity) {
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

filmMakerWorkWorksSubjectRatingDetailsFromJson(FilmMakerWorkWorksSubjectRatingDetails data, Map<String, dynamic> json) {
	if (json['1'] != null) {
		data.x1 = json['1']?.toDouble();
	}
	if (json['3'] != null) {
		data.x3 = json['3']?.toDouble();
	}
	if (json['2'] != null) {
		data.x2 = json['2']?.toDouble();
	}
	if (json['5'] != null) {
		data.x5 = json['5']?.toDouble();
	}
	if (json['4'] != null) {
		data.x4 = json['4']?.toDouble();
	}
	return data;
}

Map<String, dynamic> filmMakerWorkWorksSubjectRatingDetailsToJson(FilmMakerWorkWorksSubjectRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	data['3'] = entity.x3;
	data['2'] = entity.x2;
	data['5'] = entity.x5;
	data['4'] = entity.x4;
	return data;
}

filmMakerWorkWorksSubjectCastFromJson(FilmMakerWorkWorksSubjectCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerWorkWorksSubjectCastsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> filmMakerWorkWorksSubjectCastToJson(FilmMakerWorkWorksSubjectCast entity) {
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

filmMakerWorkWorksSubjectCastsAvatarsFromJson(FilmMakerWorkWorksSubjectCastsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerWorkWorksSubjectCastsAvatarsToJson(FilmMakerWorkWorksSubjectCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerWorkWorksSubjectDirectorFromJson(FilmMakerWorkWorksSubjectDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerWorkWorksSubjectDirectorsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> filmMakerWorkWorksSubjectDirectorToJson(FilmMakerWorkWorksSubjectDirector entity) {
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

filmMakerWorkWorksSubjectDirectorsAvatarsFromJson(FilmMakerWorkWorksSubjectDirectorsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerWorkWorksSubjectDirectorsAvatarsToJson(FilmMakerWorkWorksSubjectDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerWorkWorksSubjectImagesFromJson(FilmMakerWorkWorksSubjectImages data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerWorkWorksSubjectImagesToJson(FilmMakerWorkWorksSubjectImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}