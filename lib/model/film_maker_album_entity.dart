import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class FilmMakerAlbumEntity with JsonConvert<FilmMakerAlbumEntity> {
	int count;
	List<FilmMakerAlbumPhoto> photos;
	FilmMakerAlbumCelebrity celebrity;
	int total;
	int start;
}

class FilmMakerAlbumPhoto with JsonConvert<FilmMakerAlbumPhoto> {
	@JSONField(name: "photos_count")
	int photosCount;
	String thumb;
	String icon;
	FilmMakerAlbumPhotosAuthor author;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "album_id")
	String albumId;
	String cover;
	String id;
	@JSONField(name: "prev_photo")
	String prevPhoto;
	@JSONField(name: "album_url")
	String albumUrl;
	@JSONField(name: "comments_count")
	int commentsCount;
	String image;
	@JSONField(name: "recs_count")
	int recsCount;
	int position;
	String alt;
	@JSONField(name: "album_title")
	String albumTitle;
	@JSONField(name: "next_photo")
	String nextPhoto;
	@JSONField(name: "subject_id")
	String subjectId;
	String desc;
}

class FilmMakerAlbumPhotosAuthor with JsonConvert<FilmMakerAlbumPhotosAuthor> {
	String uid;
	String avatar;
	String signature;
	String alt;
	String id;
	String name;
}

class FilmMakerAlbumCelebrity with JsonConvert<FilmMakerAlbumCelebrity> {
	FilmMakerAlbumCelebrityAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerAlbumCelebrityAvatars with JsonConvert<FilmMakerAlbumCelebrityAvatars> {
	String small;
	String large;
	String medium;
}
