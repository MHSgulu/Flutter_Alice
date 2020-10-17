import 'package:alice/model/short_film_review_entity.dart';
import 'package:alice/generated/json/base/json_filed.dart';

shortFilmReviewEntityFromJson(ShortFilmReviewEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['comments'] != null) {
		data.comments = new List<ShortFilmReviewCommants>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new ShortFilmReviewCommants().fromJson(v));
		});
	}
	if (json['start'] != null) {
		data.start = json['start']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['next_start'] != null) {
		data.nextStart = json['next_start']?.toInt();
	}
	if (json['subject'] != null) {
		data.subject = new ShortFilmReviewSubject().fromJson(json['subject']);
	}
	return data;
}

Map<String, dynamic> shortFilmReviewEntityToJson(ShortFilmReviewEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	if (entity.comments != null) {
		data['comments'] =  entity.comments.map((v) => v.toJson()).toList();
	}
	data['start'] = entity.start;
	data['total'] = entity.total;
	data['next_start'] = entity.nextStart;
	if (entity.subject != null) {
		data['subject'] = entity.subject.toJson();
	}
	return data;
}

shortFilmReviewCommantsFromJson(ShortFilmReviewCommants data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new ShortFilmReviewCommentsRating().fromJson(json['rating']);
	}
	if (json['useful_count'] != null) {
		data.usefulCount = json['useful_count']?.toInt();
	}
	if (json['author'] != null) {
		data.author = new ShortFilmReviewCommentsAuthor().fromJson(json['author']);
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> shortFilmReviewCommantsToJson(ShortFilmReviewCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['useful_count'] = entity.usefulCount;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	data['subject_id'] = entity.subjectId;
	data['content'] = entity.content;
	data['created_at'] = entity.createdAt;
	data['id'] = entity.id;
	return data;
}

shortFilmReviewCommentsRatingFromJson(ShortFilmReviewCommentsRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> shortFilmReviewCommentsRatingToJson(ShortFilmReviewCommentsRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['max'] = entity.max;
	data['value'] = entity.value;
	data['min'] = entity.min;
	return data;
}

shortFilmReviewCommentsAuthorFromJson(ShortFilmReviewCommentsAuthor data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature']?.toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> shortFilmReviewCommentsAuthorToJson(ShortFilmReviewCommentsAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['avatar'] = entity.avatar;
	data['signature'] = entity.signature;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

shortFilmReviewSubjectFromJson(ShortFilmReviewSubject data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new ShortFilmReviewSubjectRating().fromJson(json['rating']);
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['casts'] != null) {
		data.casts = new List<ShortFilmReviewSubjectCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new ShortFilmReviewSubjectCast().fromJson(v));
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
		data.directors = new List<ShortFilmReviewSubjectDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new ShortFilmReviewSubjectDirector().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['year'] != null) {
		data.year = json['year']?.toString();
	}
	if (json['images'] != null) {
		data.images = new ShortFilmReviewSubjectImages().fromJson(json['images']);
	}
	if (json['alt'] != null) {
		data.alt = json['alt']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	return data;
}

Map<String, dynamic> shortFilmReviewSubjectToJson(ShortFilmReviewSubject entity) {
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

shortFilmReviewSubjectRatingFromJson(ShortFilmReviewSubjectRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max']?.toInt();
	}
	if (json['average'] != null) {
		data.average = json['average']?.toDouble();
	}
	if (json['details'] != null) {
		data.details = new ShortFilmReviewSubjectRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars']?.toString();
	}
	if (json['min'] != null) {
		data.min = json['min']?.toInt();
	}
	return data;
}

Map<String, dynamic> shortFilmReviewSubjectRatingToJson(ShortFilmReviewSubjectRating entity) {
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

shortFilmReviewSubjectRatingDetailsFromJson(ShortFilmReviewSubjectRatingDetails data, Map<String, dynamic> json) {
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

Map<String, dynamic> shortFilmReviewSubjectRatingDetailsToJson(ShortFilmReviewSubjectRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	data['3'] = entity.x3;
	data['2'] = entity.x2;
	data['5'] = entity.x5;
	data['4'] = entity.x4;
	return data;
}

shortFilmReviewSubjectCastFromJson(ShortFilmReviewSubjectCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new ShortFilmReviewSubjectCastsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> shortFilmReviewSubjectCastToJson(ShortFilmReviewSubjectCast entity) {
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

shortFilmReviewSubjectCastsAvatarsFromJson(ShortFilmReviewSubjectCastsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> shortFilmReviewSubjectCastsAvatarsToJson(ShortFilmReviewSubjectCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

shortFilmReviewSubjectDirectorFromJson(ShortFilmReviewSubjectDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new ShortFilmReviewSubjectDirectorsAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> shortFilmReviewSubjectDirectorToJson(ShortFilmReviewSubjectDirector entity) {
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

shortFilmReviewSubjectDirectorsAvatarsFromJson(ShortFilmReviewSubjectDirectorsAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> shortFilmReviewSubjectDirectorsAvatarsToJson(ShortFilmReviewSubjectDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

shortFilmReviewSubjectImagesFromJson(ShortFilmReviewSubjectImages data, Map<String, dynamic> json) {
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

Map<String, dynamic> shortFilmReviewSubjectImagesToJson(ShortFilmReviewSubjectImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}