import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class FilmMakerWorksEntity with JsonConvert<FilmMakerWorksEntity> {
	int count;
	int start;
	FilmMakerWorksCelebrity celebrity;
	int total;
	List<FilmMakerWorksWork> works;
}

class FilmMakerWorksCelebrity with JsonConvert<FilmMakerWorksCelebrity> {
	FilmMakerWorksCelebrityAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerWorksCelebrityAvatars with JsonConvert<FilmMakerWorksCelebrityAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerWorksWork with JsonConvert<FilmMakerWorksWork> {
	List<String> roles;
	FilmMakerWorksWorksSubject subject;
}

class FilmMakerWorksWorksSubject with JsonConvert<FilmMakerWorksWorksSubject> {
	FilmMakerWorksWorksSubjectRating rating;
	List<String> genres;
	String title;
	List<FilmMakerWorksWorksSubjectCast> casts;
	List<dynamic> durations;
	@JSONField(name: "collect_count")
	int collectCount;
	@JSONField(name: "mainland_pubdate")
	String mainlandPubdate;
	@JSONField(name: "has_video")
	bool hasVideo;
	@JSONField(name: "original_title")
	String originalTitle;
	String subtype;
	List<FilmMakerWorksWorksSubjectDirector> directors;
	List<String> pubdates;
	String year;
	FilmMakerWorksWorksSubjectImages images;
	String alt;
	String id;
}

class FilmMakerWorksWorksSubjectRating with JsonConvert<FilmMakerWorksWorksSubjectRating> {
	int max;
	int average;
	FilmMakerWorksWorksSubjectRatingDetails details;
	String stars;
	int min;
}

class FilmMakerWorksWorksSubjectRatingDetails with JsonConvert<FilmMakerWorksWorksSubjectRatingDetails> {
	@JSONField(name: "1")
	int x1;
	@JSONField(name: "3")
	int x3;
	@JSONField(name: "2")
	int x2;
	@JSONField(name: "5")
	int x5;
	@JSONField(name: "4")
	int x4;
}

class FilmMakerWorksWorksSubjectCast with JsonConvert<FilmMakerWorksWorksSubjectCast> {
	FilmMakerWorksWorksSubjectCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerWorksWorksSubjectCastsAvatars with JsonConvert<FilmMakerWorksWorksSubjectCastsAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerWorksWorksSubjectDirector with JsonConvert<FilmMakerWorksWorksSubjectDirector> {
	FilmMakerWorksWorksSubjectDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerWorksWorksSubjectDirectorsAvatars with JsonConvert<FilmMakerWorksWorksSubjectDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerWorksWorksSubjectImages with JsonConvert<FilmMakerWorksWorksSubjectImages> {
	String small;
	String large;
	String medium;
}
