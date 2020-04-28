import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class FilmMakerEntity with JsonConvert<FilmMakerEntity> {
	String website;
	@JSONField(name: "mobile_url")
	String mobileUrl;
	@JSONField(name: "aka_en")
	List<dynamic> akaEn;
	String name;
	List<FilmMakerWork> works;
	@JSONField(name: "name_en")
	String nameEn;
	String gender;
	List<String> professions;
	FilmMakerAvatars avatars;
	String summary;
	List<FilmMakerPhoto> photos;
	String birthday;
	List<dynamic> aka;
	String alt;
	@JSONField(name: "born_place")
	String bornPlace;
	String constellation;
	String id;
}

class FilmMakerWork with JsonConvert<FilmMakerWork> {
	List<String> roles;
	FilmMakerWorksSubject subject;
}

class FilmMakerWorksSubject with JsonConvert<FilmMakerWorksSubject> {
	FilmMakerWorksSubjectRating rating;
	List<String> genres;
	String title;
	List<FilmMakerWorksSubjectCast> casts;
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
	List<FilmMakerWorksSubjectDirector> directors;
	List<String> pubdates;
	String year;
	FilmMakerWorksSubjectImages images;
	String alt;
	String id;
}

class FilmMakerWorksSubjectRating with JsonConvert<FilmMakerWorksSubjectRating> {
	int max;
	double average;
	FilmMakerWorksSubjectRatingDetails details;
	String stars;
	int min;
}

class FilmMakerWorksSubjectRatingDetails with JsonConvert<FilmMakerWorksSubjectRatingDetails> {
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

class FilmMakerWorksSubjectCast with JsonConvert<FilmMakerWorksSubjectCast> {
	FilmMakerWorksSubjectCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerWorksSubjectCastsAvatars with JsonConvert<FilmMakerWorksSubjectCastsAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerWorksSubjectDirector with JsonConvert<FilmMakerWorksSubjectDirector> {
	FilmMakerWorksSubjectDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class FilmMakerWorksSubjectDirectorsAvatars with JsonConvert<FilmMakerWorksSubjectDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerWorksSubjectImages with JsonConvert<FilmMakerWorksSubjectImages> {
	String small;
	String large;
	String medium;
}

class FilmMakerAvatars with JsonConvert<FilmMakerAvatars> {
	String small;
	String large;
	String medium;
}

class FilmMakerPhoto with JsonConvert<FilmMakerPhoto> {
	String thumb;
	String image;
	String cover;
	String alt;
	String id;
	String icon;
}
