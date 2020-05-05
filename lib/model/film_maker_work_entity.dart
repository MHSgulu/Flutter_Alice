import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class FilmMakerWorkEntity with JsonConvert<FilmMakerWorkEntity> {
	int count;
	int start;
	FilmMakerWorkCelebrity celebrity;
	int total;
	List<FilmMakerWorkWork> works;
}

class FilmMakerWorkCelebrity with JsonConvert<FilmMakerWorkCelebrity> {
	FilmMakerWorkCelebrityAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerWorkCelebrityAvatars with JsonConvert<FilmMakerWorkCelebrityAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerWorkWork with JsonConvert<FilmMakerWorkWork> {
	List<String> roles;
	FilmMakerWorkWorksSubject subject;
}

class FilmMakerWorkWorksSubject with JsonConvert<FilmMakerWorkWorksSubject> {
	FilmMakerWorkWorksSubjectRating rating;
	List<String> genres;
	String title;
	List<FilmMakerWorkWorksSubjectCast> casts;
	List<String> durations;
	@JSONField(name: "collect_count")
	int collectCount;
	@JSONField(name: "mainland_pubdate")
	String mainlandPubdate;
	@JSONField(name: "has_video")
	bool hasVideo;
	@JSONField(name: "original_title")
	String originalTitle;
	String subtype;
	List<FilmMakerWorkWorksSubjectDirector> directors;
	List<String> pubdates;
	String year;
	FilmMakerWorkWorksSubjectImages images;
	String alt;
	String id;
}

class FilmMakerWorkWorksSubjectRating with JsonConvert<FilmMakerWorkWorksSubjectRating> {
	int max;
	double average;
	FilmMakerWorkWorksSubjectRatingDetails details;
	String stars;
	int min;
}

class FilmMakerWorkWorksSubjectRatingDetails with JsonConvert<FilmMakerWorkWorksSubjectRatingDetails> {
	@JSONField(name: "1")
	double x1;
	@JSONField(name: "3")
	double x3;
	@JSONField(name: "2")
	double x2;
	@JSONField(name: "5")
	double x5;
	@JSONField(name: "4")
	double x4;
}

class FilmMakerWorkWorksSubjectCast with JsonConvert<FilmMakerWorkWorksSubjectCast> {
	FilmMakerWorkWorksSubjectCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerWorkWorksSubjectCastsAvatars with JsonConvert<FilmMakerWorkWorksSubjectCastsAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerWorkWorksSubjectDirector with JsonConvert<FilmMakerWorkWorksSubjectDirector> {
	FilmMakerWorkWorksSubjectDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerWorkWorksSubjectDirectorsAvatars with JsonConvert<FilmMakerWorkWorksSubjectDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerWorkWorksSubjectImages with JsonConvert<FilmMakerWorkWorksSubjectImages> {
	String small;
	String large;
	String medium;
}
