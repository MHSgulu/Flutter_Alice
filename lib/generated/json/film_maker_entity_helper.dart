import 'package:alice/model/film_maker_entity.dart';

filmMakerEntityFromJson(FilmMakerEntity data, Map<String, dynamic> json) {
	if (json['website'] != null) {
		data.website = json['website']?.toString();
	}
	if (json['mobile_url'] != null) {
		data.mobileUrl = json['mobile_url']?.toString();
	}
	if (json['aka_en'] != null) {
		data.akaEn = new List<dynamic>();
		data.akaEn.addAll(json['aka_en']);
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['works'] != null) {
		data.works = new List<FilmMakerWork>();
		(json['works'] as List).forEach((v) {
			data.works.add(new FilmMakerWork().fromJson(v));
		});
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en']?.toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toString();
	}
	if (json['professions'] != null) {
		data.professions = json['professions']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerAvatars().fromJson(json['avatars']);
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['photos'] != null) {
		data.photos = new List<FilmMakerPhoto>();
		(json['photos'] as List).forEach((v) {
			data.photos.add(new FilmMakerPhoto().fromJson(v));
		});
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toString();
	}
	if (json['aka'] != null) {
		data.aka = new List<dynamic>();
		data.aka.addAll(json['aka']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['born_place'] != null) {
		data.bornPlace = json['born_place']?.toString();
	}
	if (json['constellation'] != null) {
		data.constellation = json['constellation']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerEntityToJson(FilmMakerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['website'] = entity.website;
	data['mobile_url'] = entity.mobileUrl;
	if (entity.akaEn != null) {
		data['aka_en'] =  [];
	}
	data['name'] = entity.name;
	if (entity.works != null) {
		data['works'] =  entity.works.map((v) => v.toJson()).toList();
	}
	data['name_en'] = entity.nameEn;
	data['gender'] = entity.gender;
	data['professions'] = entity.professions;
	if (entity.avatars != null) {
		data['avatars'] = entity.avatars.toJson();
	}
	data['summary'] = entity.summary;
	if (entity.photos != null) {
		data['photos'] =  entity.photos.map((v) => v.toJson()).toList();
	}
	data['birthday'] = entity.birthday;
	if (entity.aka != null) {
		data['aka'] =  [];
	}
	data['alt'] = entity.alt;
	data['born_place'] = entity.bornPlace;
	data['constellation'] = entity.constellation;
	data['id'] = entity.id;
	return data;
}

filmMakerWorkFromJson(FilmMakerWork data, Map<String, dynamic> json) {
	if (json['roles'] != null) {
		data.roles = json['roles']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['subject'] != null) {
		data.subject = new FilmMakerWorksSubject().fromJson(json['subject']);
	}
	return data;
}

Map<String, dynamic> filmMakerWorkToJson(FilmMakerWork entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['roles'] = entity.roles;
	if (entity.subject != null) {
		data['subject'] = entity.subject.toJson();
	}
	return data;
}

filmMakerWorksSubjectFromJson(FilmMakerWorksSubject data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new FilmMakerWorksSubjectRating().fromJson(json['rating']);
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['casts'] != null) {
		data.casts = new List<FilmMakerWorksSubjectCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new FilmMakerWorksSubjectCast().fromJson(v));
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
		data.directors = new List<FilmMakerWorksSubjectDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new FilmMakerWorksSubjectDirector().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['images'] != null) {
		data.images = new FilmMakerWorksSubjectImages().fromJson(json['images']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksSubjectToJson(FilmMakerWorksSubject entity) {
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

filmMakerWorksSubjectRatingFromJson(FilmMakerWorksSubjectRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toDouble();
	}
	if (json['details'] != null) {
		data.details = new FilmMakerWorksSubjectRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> filmMakerWorksSubjectRatingToJson(FilmMakerWorksSubjectRating entity) {
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

filmMakerWorksSubjectRatingDetailsFromJson(FilmMakerWorksSubjectRatingDetails data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerWorksSubjectRatingDetailsToJson(FilmMakerWorksSubjectRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	data['3'] = entity.x3;
	data['2'] = entity.x2;
	data['5'] = entity.x5;
	data['4'] = entity.x4;
	return data;
}

filmMakerWorksSubjectCastFromJson(FilmMakerWorksSubjectCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerWorksSubjectCastsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> filmMakerWorksSubjectCastToJson(FilmMakerWorksSubjectCast entity) {
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

filmMakerWorksSubjectCastsAvatarsFromJson(FilmMakerWorksSubjectCastsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerWorksSubjectCastsAvatarsToJson(FilmMakerWorksSubjectCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerWorksSubjectDirectorFromJson(FilmMakerWorksSubjectDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerWorksSubjectDirectorsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> filmMakerWorksSubjectDirectorToJson(FilmMakerWorksSubjectDirector entity) {
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

filmMakerWorksSubjectDirectorsAvatarsFromJson(FilmMakerWorksSubjectDirectorsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerWorksSubjectDirectorsAvatarsToJson(FilmMakerWorksSubjectDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerWorksSubjectImagesFromJson(FilmMakerWorksSubjectImages data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerWorksSubjectImagesToJson(FilmMakerWorksSubjectImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerAvatarsFromJson(FilmMakerAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerAvatarsToJson(FilmMakerAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

filmMakerPhotoFromJson(FilmMakerPhoto data, Map<String, dynamic> json) {
	if (json['thumb'] != null) {
		data.thumb = json['thumb']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	return data;
}

Map<String, dynamic> filmMakerPhotoToJson(FilmMakerPhoto entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['thumb'] = entity.thumb;
	data['image'] = entity.image;
	data['cover'] = entity.cover;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['icon'] = entity.icon;
	return data;
}