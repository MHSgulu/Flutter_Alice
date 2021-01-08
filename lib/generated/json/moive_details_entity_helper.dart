import 'package:alice/model/moive_details_entity.dart';
import 'package:alice/generated/json/base/json_filed.dart';

moiveDetailsEntityFromJson(MoiveDetailsEntity data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MoiveDetailsRating().fromJson(json['rating']);
	}
	if (json['reviews_count'] != null) {
		data.reviewsCount = json['reviews_count'] is String
				? int.tryParse(json['reviews_count'])
				: json['reviews_count'].toInt();
	}
	if (json['videos'] != null) {
		data.videos = new List<MoiveDetailsVideo>();
		(json['videos'] as List).forEach((v) {
			data.videos.add(new MoiveDetailsVideo().fromJson(v));
		});
	}
	if (json['wish_count'] != null) {
		data.wishCount = json['wish_count'] is String
				? int.tryParse(json['wish_count'])
				: json['wish_count'].toInt();
	}
	if (json['original_title'] != null) {
		data.originalTitle = json['original_title'].toString();
	}
	if (json['blooper_urls'] != null) {
		data.blooperUrls = json['blooper_urls']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['collect_count'] != null) {
		data.collectCount = json['collect_count'] is String
				? int.tryParse(json['collect_count'])
				: json['collect_count'].toInt();
	}
	if (json['images'] != null) {
		data.images = new MoiveDetailsImages().fromJson(json['images']);
	}
	if (json['douban_site'] != null) {
		data.doubanSite = json['douban_site'].toString();
	}
	if (json['year'] != null) {
		data.year = json['year'].toString();
	}
	if (json['popular_comments'] != null) {
		data.popularComments = new List<MoiveDetailsPopularCommants>();
		(json['popular_comments'] as List).forEach((v) {
			data.popularComments.add(new MoiveDetailsPopularCommants().fromJson(v));
		});
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['mobile_url'] != null) {
		data.mobileUrl = json['mobile_url'].toString();
	}
	if (json['photos_count'] != null) {
		data.photosCount = json['photos_count'] is String
				? int.tryParse(json['photos_count'])
				: json['photos_count'].toInt();
	}
	if (json['pubdate'] != null) {
		data.pubdate = json['pubdate'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['do_count'] != null) {
		data.doCount = json['do_count'];
	}
	if (json['has_video'] != null) {
		data.hasVideo = json['has_video'];
	}
	if (json['share_url'] != null) {
		data.shareUrl = json['share_url'].toString();
	}
	if (json['seasons_count'] != null) {
		data.seasonsCount = json['seasons_count'];
	}
	if (json['languages'] != null) {
		data.languages = json['languages']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['schedule_url'] != null) {
		data.scheduleUrl = json['schedule_url'].toString();
	}
	if (json['writers'] != null) {
		data.writers = new List<MoiveDetailsWriter>();
		(json['writers'] as List).forEach((v) {
			data.writers.add(new MoiveDetailsWriter().fromJson(v));
		});
	}
	if (json['pubdates'] != null) {
		data.pubdates = json['pubdates']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['website'] != null) {
		data.website = json['website'].toString();
	}
	if (json['tags'] != null) {
		data.tags = json['tags']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['has_schedule'] != null) {
		data.hasSchedule = json['has_schedule'];
	}
	if (json['durations'] != null) {
		data.durations = json['durations']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['genres'] != null) {
		data.genres = json['genres']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['collection'] != null) {
		data.collection = json['collection'];
	}
	if (json['trailers'] != null) {
		data.trailers = new List<MoiveDetailsTrailer>();
		(json['trailers'] as List).forEach((v) {
			data.trailers.add(new MoiveDetailsTrailer().fromJson(v));
		});
	}
	if (json['episodes_count'] != null) {
		data.episodesCount = json['episodes_count'];
	}
	if (json['trailer_urls'] != null) {
		data.trailerUrls = json['trailer_urls']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['has_ticket'] != null) {
		data.hasTicket = json['has_ticket'];
	}
	if (json['bloopers'] != null) {
		data.bloopers = new List<MoiveDetailsBlooper>();
		(json['bloopers'] as List).forEach((v) {
			data.bloopers.add(new MoiveDetailsBlooper().fromJson(v));
		});
	}
	if (json['clip_urls'] != null) {
		data.clipUrls = json['clip_urls']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['current_season'] != null) {
		data.currentSeason = json['current_season'];
	}
	if (json['casts'] != null) {
		data.casts = new List<MoiveDetailsCast>();
		(json['casts'] as List).forEach((v) {
			data.casts.add(new MoiveDetailsCast().fromJson(v));
		});
	}
	if (json['countries'] != null) {
		data.countries = json['countries']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['mainland_pubdate'] != null) {
		data.mainlandPubdate = json['mainland_pubdate'].toString();
	}
	if (json['photos'] != null) {
		data.photos = new List<MoiveDetailsPhoto>();
		(json['photos'] as List).forEach((v) {
			data.photos.add(new MoiveDetailsPhoto().fromJson(v));
		});
	}
	if (json['summary'] != null) {
		data.summary = json['summary'].toString();
	}
	if (json['clips'] != null) {
		data.clips = new List<MoiveDetailsClip>();
		(json['clips'] as List).forEach((v) {
			data.clips.add(new MoiveDetailsClip().fromJson(v));
		});
	}
	if (json['subtype'] != null) {
		data.subtype = json['subtype'].toString();
	}
	if (json['directors'] != null) {
		data.directors = new List<MoiveDetailsDirector>();
		(json['directors'] as List).forEach((v) {
			data.directors.add(new MoiveDetailsDirector().fromJson(v));
		});
	}
	if (json['comments_count'] != null) {
		data.commentsCount = json['comments_count'] is String
				? int.tryParse(json['comments_count'])
				: json['comments_count'].toInt();
	}
	if (json['popular_reviews'] != null) {
		data.popularReviews = new List<MoiveDetailsPopularReview>();
		(json['popular_reviews'] as List).forEach((v) {
			data.popularReviews.add(new MoiveDetailsPopularReview().fromJson(v));
		});
	}
	if (json['ratings_count'] != null) {
		data.ratingsCount = json['ratings_count'] is String
				? int.tryParse(json['ratings_count'])
				: json['ratings_count'].toInt();
	}
	if (json['aka'] != null) {
		data.aka = json['aka']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> moiveDetailsEntityToJson(MoiveDetailsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['reviews_count'] = entity.reviewsCount;
	if (entity.videos != null) {
		data['videos'] =  entity.videos.map((v) => v.toJson()).toList();
	}
	data['wish_count'] = entity.wishCount;
	data['original_title'] = entity.originalTitle;
	data['blooper_urls'] = entity.blooperUrls;
	data['collect_count'] = entity.collectCount;
	if (entity.images != null) {
		data['images'] = entity.images.toJson();
	}
	data['douban_site'] = entity.doubanSite;
	data['year'] = entity.year;
	if (entity.popularComments != null) {
		data['popular_comments'] =  entity.popularComments.map((v) => v.toJson()).toList();
	}
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['mobile_url'] = entity.mobileUrl;
	data['photos_count'] = entity.photosCount;
	data['pubdate'] = entity.pubdate;
	data['title'] = entity.title;
	data['do_count'] = entity.doCount;
	data['has_video'] = entity.hasVideo;
	data['share_url'] = entity.shareUrl;
	data['seasons_count'] = entity.seasonsCount;
	data['languages'] = entity.languages;
	data['schedule_url'] = entity.scheduleUrl;
	if (entity.writers != null) {
		data['writers'] =  entity.writers.map((v) => v.toJson()).toList();
	}
	data['pubdates'] = entity.pubdates;
	data['website'] = entity.website;
	data['tags'] = entity.tags;
	data['has_schedule'] = entity.hasSchedule;
	data['durations'] = entity.durations;
	data['genres'] = entity.genres;
	data['collection'] = entity.collection;
	if (entity.trailers != null) {
		data['trailers'] =  entity.trailers.map((v) => v.toJson()).toList();
	}
	data['episodes_count'] = entity.episodesCount;
	data['trailer_urls'] = entity.trailerUrls;
	data['has_ticket'] = entity.hasTicket;
	if (entity.bloopers != null) {
		data['bloopers'] =  entity.bloopers.map((v) => v.toJson()).toList();
	}
	data['clip_urls'] = entity.clipUrls;
	data['current_season'] = entity.currentSeason;
	if (entity.casts != null) {
		data['casts'] =  entity.casts.map((v) => v.toJson()).toList();
	}
	data['countries'] = entity.countries;
	data['mainland_pubdate'] = entity.mainlandPubdate;
	if (entity.photos != null) {
		data['photos'] =  entity.photos.map((v) => v.toJson()).toList();
	}
	data['summary'] = entity.summary;
	if (entity.clips != null) {
		data['clips'] =  entity.clips.map((v) => v.toJson()).toList();
	}
	data['subtype'] = entity.subtype;
	if (entity.directors != null) {
		data['directors'] =  entity.directors.map((v) => v.toJson()).toList();
	}
	data['comments_count'] = entity.commentsCount;
	if (entity.popularReviews != null) {
		data['popular_reviews'] =  entity.popularReviews.map((v) => v.toJson()).toList();
	}
	data['ratings_count'] = entity.ratingsCount;
	data['aka'] = entity.aka;
	return data;
}

moiveDetailsRatingFromJson(MoiveDetailsRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max'] is String
				? int.tryParse(json['max'])
				: json['max'].toInt();
	}
	if (json['average'] != null) {
		data.average = json['average'] is String
				? double.tryParse(json['average'])
				: json['average'].toDouble();
	}
	if (json['details'] != null) {
		data.details = new MoiveDetailsRatingDetails().fromJson(json['details']);
	}
	if (json['stars'] != null) {
		data.stars = json['stars'].toString();
	}
	if (json['min'] != null) {
		data.min = json['min'] is String
				? int.tryParse(json['min'])
				: json['min'].toInt();
	}
	return data;
}

Map<String, dynamic> moiveDetailsRatingToJson(MoiveDetailsRating entity) {
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

moiveDetailsRatingDetailsFromJson(MoiveDetailsRatingDetails data, Map<String, dynamic> json) {
	if (json['1'] != null) {
		data.x1 = json['1'] is String
				? double.tryParse(json['1'])
				: json['1'].toDouble();
	}
	if (json['3'] != null) {
		data.x3 = json['3'] is String
				? double.tryParse(json['3'])
				: json['3'].toDouble();
	}
	if (json['2'] != null) {
		data.x2 = json['2'] is String
				? double.tryParse(json['2'])
				: json['2'].toDouble();
	}
	if (json['5'] != null) {
		data.x5 = json['5'] is String
				? double.tryParse(json['5'])
				: json['5'].toDouble();
	}
	if (json['4'] != null) {
		data.x4 = json['4'] is String
				? double.tryParse(json['4'])
				: json['4'].toDouble();
	}
	return data;
}

Map<String, dynamic> moiveDetailsRatingDetailsToJson(MoiveDetailsRatingDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	data['3'] = entity.x3;
	data['2'] = entity.x2;
	data['5'] = entity.x5;
	data['4'] = entity.x4;
	return data;
}

moiveDetailsVideoFromJson(MoiveDetailsVideo data, Map<String, dynamic> json) {
	if (json['source'] != null) {
		data.source = new MoiveDetailsVideosSource().fromJson(json['source']);
	}
	if (json['sample_link'] != null) {
		data.sampleLink = json['sample_link'].toString();
	}
	if (json['video_id'] != null) {
		data.videoId = json['video_id'].toString();
	}
	if (json['need_pay'] != null) {
		data.needPay = json['need_pay'];
	}
	return data;
}

Map<String, dynamic> moiveDetailsVideoToJson(MoiveDetailsVideo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.source != null) {
		data['source'] = entity.source.toJson();
	}
	data['sample_link'] = entity.sampleLink;
	data['video_id'] = entity.videoId;
	data['need_pay'] = entity.needPay;
	return data;
}

moiveDetailsVideosSourceFromJson(MoiveDetailsVideosSource data, Map<String, dynamic> json) {
	if (json['literal'] != null) {
		data.literal = json['literal'].toString();
	}
	if (json['pic'] != null) {
		data.pic = json['pic'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsVideosSourceToJson(MoiveDetailsVideosSource entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['literal'] = entity.literal;
	data['pic'] = entity.pic;
	data['name'] = entity.name;
	return data;
}

moiveDetailsImagesFromJson(MoiveDetailsImages data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small'].toString();
	}
	if (json['large'] != null) {
		data.large = json['large'].toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsImagesToJson(MoiveDetailsImages entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

moiveDetailsPopularCommantsFromJson(MoiveDetailsPopularCommants data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MoiveDetailsPopularCommentsRating().fromJson(json['rating']);
	}
	if (json['useful_count'] != null) {
		data.usefulCount = json['useful_count'] is String
				? int.tryParse(json['useful_count'])
				: json['useful_count'].toInt();
	}
	if (json['author'] != null) {
		data.author = new MoiveDetailsPopularCommentsAuthor().fromJson(json['author']);
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsPopularCommantsToJson(MoiveDetailsPopularCommants entity) {
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

moiveDetailsPopularCommentsRatingFromJson(MoiveDetailsPopularCommentsRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max'] is String
				? int.tryParse(json['max'])
				: json['max'].toInt();
	}
	if (json['value'] != null) {
		data.value = json['value'] is String
				? double.tryParse(json['value'])
				: json['value'].toDouble();
	}
	if (json['min'] != null) {
		data.min = json['min'] is String
				? int.tryParse(json['min'])
				: json['min'].toInt();
	}
	return data;
}

Map<String, dynamic> moiveDetailsPopularCommentsRatingToJson(MoiveDetailsPopularCommentsRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['max'] = entity.max;
	data['value'] = entity.value;
	data['min'] = entity.min;
	return data;
}

moiveDetailsPopularCommentsAuthorFromJson(MoiveDetailsPopularCommentsAuthor data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsPopularCommentsAuthorToJson(MoiveDetailsPopularCommentsAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['avatar'] = entity.avatar;
	data['signature'] = entity.signature;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

moiveDetailsWriterFromJson(MoiveDetailsWriter data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MoiveDetailsWritersAvatars().fromJson(json['avatars']);
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsWriterToJson(MoiveDetailsWriter entity) {
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

moiveDetailsWritersAvatarsFromJson(MoiveDetailsWritersAvatars data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small'].toString();
	}
	if (json['large'] != null) {
		data.large = json['large'].toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsWritersAvatarsToJson(MoiveDetailsWritersAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

moiveDetailsTrailerFromJson(MoiveDetailsTrailer data, Map<String, dynamic> json) {
	if (json['medium'] != null) {
		data.medium = json['medium'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['small'] != null) {
		data.small = json['small'].toString();
	}
	if (json['resource_url'] != null) {
		data.resourceUrl = json['resource_url'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsTrailerToJson(MoiveDetailsTrailer entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['medium'] = entity.medium;
	data['title'] = entity.title;
	data['subject_id'] = entity.subjectId;
	data['alt'] = entity.alt;
	data['small'] = entity.small;
	data['resource_url'] = entity.resourceUrl;
	data['id'] = entity.id;
	return data;
}

moiveDetailsBlooperFromJson(MoiveDetailsBlooper data, Map<String, dynamic> json) {
	if (json['medium'] != null) {
		data.medium = json['medium'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['small'] != null) {
		data.small = json['small'].toString();
	}
	if (json['resource_url'] != null) {
		data.resourceUrl = json['resource_url'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsBlooperToJson(MoiveDetailsBlooper entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['medium'] = entity.medium;
	data['title'] = entity.title;
	data['subject_id'] = entity.subjectId;
	data['alt'] = entity.alt;
	data['small'] = entity.small;
	data['resource_url'] = entity.resourceUrl;
	data['id'] = entity.id;
	return data;
}

moiveDetailsCastFromJson(MoiveDetailsCast data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MoiveDetailsCastsAvatars().fromJson(json['avatars']);
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsCastToJson(MoiveDetailsCast entity) {
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

moiveDetailsCastsAvatarsFromJson(MoiveDetailsCastsAvatars data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small'].toString();
	}
	if (json['large'] != null) {
		data.large = json['large'].toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsCastsAvatarsToJson(MoiveDetailsCastsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

moiveDetailsPhotoFromJson(MoiveDetailsPhoto data, Map<String, dynamic> json) {
	if (json['thumb'] != null) {
		data.thumb = json['thumb'].toString();
	}
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsPhotoToJson(MoiveDetailsPhoto entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['thumb'] = entity.thumb;
	data['image'] = entity.image;
	data['cover'] = entity.cover;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['icon'] = entity.icon;
	return data;
}

moiveDetailsClipFromJson(MoiveDetailsClip data, Map<String, dynamic> json) {
	if (json['medium'] != null) {
		data.medium = json['medium'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['small'] != null) {
		data.small = json['small'].toString();
	}
	if (json['resource_url'] != null) {
		data.resourceUrl = json['resource_url'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsClipToJson(MoiveDetailsClip entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['medium'] = entity.medium;
	data['title'] = entity.title;
	data['subject_id'] = entity.subjectId;
	data['alt'] = entity.alt;
	data['small'] = entity.small;
	data['resource_url'] = entity.resourceUrl;
	data['id'] = entity.id;
	return data;
}

moiveDetailsDirectorFromJson(MoiveDetailsDirector data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new MoiveDetailsDirectorsAvatars().fromJson(json['avatars']);
	}
	if (json['name_en'] != null) {
		data.nameEn = json['name_en'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsDirectorToJson(MoiveDetailsDirector entity) {
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

moiveDetailsDirectorsAvatarsFromJson(MoiveDetailsDirectorsAvatars data, Map<String, dynamic> json) {
	if (json['small'] != null) {
		data.small = json['small'].toString();
	}
	if (json['large'] != null) {
		data.large = json['large'].toString();
	}
	if (json['medium'] != null) {
		data.medium = json['medium'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsDirectorsAvatarsToJson(MoiveDetailsDirectorsAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}

moiveDetailsPopularReviewFromJson(MoiveDetailsPopularReview data, Map<String, dynamic> json) {
	if (json['rating'] != null) {
		data.rating = new MoiveDetailsPopularReviewsRating().fromJson(json['rating']);
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id'].toString();
	}
	if (json['author'] != null) {
		data.author = new MoiveDetailsPopularReviewsAuthor().fromJson(json['author']);
	}
	if (json['summary'] != null) {
		data.summary = json['summary'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsPopularReviewToJson(MoiveDetailsPopularReview entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.rating != null) {
		data['rating'] = entity.rating.toJson();
	}
	data['title'] = entity.title;
	data['subject_id'] = entity.subjectId;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	data['summary'] = entity.summary;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	return data;
}

moiveDetailsPopularReviewsRatingFromJson(MoiveDetailsPopularReviewsRating data, Map<String, dynamic> json) {
	if (json['max'] != null) {
		data.max = json['max'] is String
				? int.tryParse(json['max'])
				: json['max'].toInt();
	}
	if (json['value'] != null) {
		data.value = json['value'] is String
				? double.tryParse(json['value'])
				: json['value'].toDouble();
	}
	if (json['min'] != null) {
		data.min = json['min'] is String
				? int.tryParse(json['min'])
				: json['min'].toInt();
	}
	return data;
}

Map<String, dynamic> moiveDetailsPopularReviewsRatingToJson(MoiveDetailsPopularReviewsRating entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['max'] = entity.max;
	data['value'] = entity.value;
	data['min'] = entity.min;
	return data;
}

moiveDetailsPopularReviewsAuthorFromJson(MoiveDetailsPopularReviewsAuthor data, Map<String, dynamic> json) {
	if (json['uid'] != null) {
		data.uid = json['uid'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	if (json['signature'] != null) {
		data.signature = json['signature'].toString();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> moiveDetailsPopularReviewsAuthorToJson(MoiveDetailsPopularReviewsAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['avatar'] = entity.avatar;
	data['signature'] = entity.signature;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}