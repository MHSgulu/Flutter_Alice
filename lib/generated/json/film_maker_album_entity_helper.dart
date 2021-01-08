import 'package:alice/model/film_maker_album_entity.dart';
import 'package:alice/generated/json/base/json_filed.dart';

filmMakerAlbumEntityFromJson(FilmMakerAlbumEntity data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count'] is String
				? int.tryParse(json['count'])
				: json['count'].toInt();
	}
	if (json['photos'] != null) {
		data.photos = new List<FilmMakerAlbumPhoto>();
		(json['photos'] as List).forEach((v) {
			data.photos.add(new FilmMakerAlbumPhoto().fromJson(v));
		});
	}
	if (json['celebrity'] != null) {
		data.celebrity = new FilmMakerAlbumCelebrity().fromJson(json['celebrity']);
	}
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	if (json['start'] != null) {
		data.start = json['start'] is String
				? int.tryParse(json['start'])
				: json['start'].toInt();
	}
	return data;
}

Map<String, dynamic> filmMakerAlbumEntityToJson(FilmMakerAlbumEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	if (entity.photos != null) {
		data['photos'] =  entity.photos.map((v) => v.toJson()).toList();
	}
	if (entity.celebrity != null) {
		data['celebrity'] = entity.celebrity.toJson();
	}
	data['total'] = entity.total;
	data['start'] = entity.start;
	return data;
}

filmMakerAlbumPhotoFromJson(FilmMakerAlbumPhoto data, Map<String, dynamic> json) {
	if (json['photos_count'] != null) {
		data.photosCount = json['photos_count'] is String
				? int.tryParse(json['photos_count'])
				: json['photos_count'].toInt();
	}
	if (json['thumb'] != null) {
		data.thumb = json['thumb'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['author'] != null) {
		data.author = new FilmMakerAlbumPhotosAuthor().fromJson(json['author']);
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at'].toString();
	}
	if (json['album_id'] != null) {
		data.albumId = json['album_id'].toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['prev_photo'] != null) {
		data.prevPhoto = json['prev_photo'].toString();
	}
	if (json['album_url'] != null) {
		data.albumUrl = json['album_url'].toString();
	}
	if (json['comments_count'] != null) {
		data.commentsCount = json['comments_count'] is String
				? int.tryParse(json['comments_count'])
				: json['comments_count'].toInt();
	}
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['recs_count'] != null) {
		data.recsCount = json['recs_count'] is String
				? int.tryParse(json['recs_count'])
				: json['recs_count'].toInt();
	}
	if (json['position'] != null) {
		data.position = json['position'] is String
				? int.tryParse(json['position'])
				: json['position'].toInt();
	}
	if (json['alt'] != null) {
		data.alt = json['alt'].toString();
	}
	if (json['album_title'] != null) {
		data.albumTitle = json['album_title'].toString();
	}
	if (json['next_photo'] != null) {
		data.nextPhoto = json['next_photo'].toString();
	}
	if (json['subject_id'] != null) {
		data.subjectId = json['subject_id'].toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc'].toString();
	}
	return data;
}

Map<String, dynamic> filmMakerAlbumPhotoToJson(FilmMakerAlbumPhoto entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['photos_count'] = entity.photosCount;
	data['thumb'] = entity.thumb;
	data['icon'] = entity.icon;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	data['created_at'] = entity.createdAt;
	data['album_id'] = entity.albumId;
	data['cover'] = entity.cover;
	data['id'] = entity.id;
	data['prev_photo'] = entity.prevPhoto;
	data['album_url'] = entity.albumUrl;
	data['comments_count'] = entity.commentsCount;
	data['image'] = entity.image;
	data['recs_count'] = entity.recsCount;
	data['position'] = entity.position;
	data['alt'] = entity.alt;
	data['album_title'] = entity.albumTitle;
	data['next_photo'] = entity.nextPhoto;
	data['subject_id'] = entity.subjectId;
	data['desc'] = entity.desc;
	return data;
}

filmMakerAlbumPhotosAuthorFromJson(FilmMakerAlbumPhotosAuthor data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerAlbumPhotosAuthorToJson(FilmMakerAlbumPhotosAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uid'] = entity.uid;
	data['avatar'] = entity.avatar;
	data['signature'] = entity.signature;
	data['alt'] = entity.alt;
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}

filmMakerAlbumCelebrityFromJson(FilmMakerAlbumCelebrity data, Map<String, dynamic> json) {
	if (json['avatars'] != null) {
		data.avatars = new FilmMakerAlbumCelebrityAvatars().fromJson(json['avatars']);
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

Map<String, dynamic> filmMakerAlbumCelebrityToJson(FilmMakerAlbumCelebrity entity) {
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

filmMakerAlbumCelebrityAvatarsFromJson(FilmMakerAlbumCelebrityAvatars data, Map<String, dynamic> json) {
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

Map<String, dynamic> filmMakerAlbumCelebrityAvatarsToJson(FilmMakerAlbumCelebrityAvatars entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['small'] = entity.small;
	data['large'] = entity.large;
	data['medium'] = entity.medium;
	return data;
}