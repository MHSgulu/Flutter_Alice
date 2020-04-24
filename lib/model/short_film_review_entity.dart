import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class ShortFilmReviewEntity with JsonConvert<ShortFilmReviewEntity> {
	int count;
	List<ShortFilmReviewCommants> comments;
	int start;
	int total;
	@JSONField(name: "next_start")
	int nextStart;
	ShortFilmReviewSubject subject;
}

class ShortFilmReviewCommants with JsonConvert<ShortFilmReviewCommants> {
	ShortFilmReviewCommentsRating rating;
	@JSONField(name: "useful_count")
	int usefulCount;
	ShortFilmReviewCommentsAuthor author;
	@JSONField(name: "subject_id")
	String subjectId;
	String content;
	@JSONField(name: "created_at")
	String createdAt;
	String id;
}

class ShortFilmReviewCommentsRating with JsonConvert<ShortFilmReviewCommentsRating> {
	int max;
	double value;
	int min;
}

class ShortFilmReviewCommentsAuthor with JsonConvert<ShortFilmReviewCommentsAuthor> {
	String uid;
	String avatar;
	String signature;
	String alt;
	String id;
	String name;
}

class ShortFilmReviewSubject with JsonConvert<ShortFilmReviewSubject> {
	ShortFilmReviewSubjectRating rating;
	List<String> genres;
	String title;
	List<ShortFilmReviewSubjectCast> casts;
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
	List<ShortFilmReviewSubjectDirector> directors;
	List<String> pubdates;
	String year;
	ShortFilmReviewSubjectImages images;
	String alt;
	String id;
}

class ShortFilmReviewSubjectRating with JsonConvert<ShortFilmReviewSubjectRating> {
	int max;
	double average;
	ShortFilmReviewSubjectRatingDetails details;
	String stars;
	int min;
}

class ShortFilmReviewSubjectRatingDetails with JsonConvert<ShortFilmReviewSubjectRatingDetails> {
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

class ShortFilmReviewSubjectCast with JsonConvert<ShortFilmReviewSubjectCast> {
	ShortFilmReviewSubjectCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class ShortFilmReviewSubjectCastsAvatars with JsonConvert<ShortFilmReviewSubjectCastsAvatars> {
	String small;
	String large;
	String medium;
}

class ShortFilmReviewSubjectDirector with JsonConvert<ShortFilmReviewSubjectDirector> {
	ShortFilmReviewSubjectDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class ShortFilmReviewSubjectDirectorsAvatars with JsonConvert<ShortFilmReviewSubjectDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class ShortFilmReviewSubjectImages with JsonConvert<ShortFilmReviewSubjectImages> {
	String small;
	String large;
	String medium;
}
