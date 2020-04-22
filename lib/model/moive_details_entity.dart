import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class MoiveDetailsEntity with JsonConvert<MoiveDetailsEntity> {
	MoiveDetailsRating rating;
	@JSONField(name: "reviews_count")
	int reviewsCount;
	List<MoiveDetailsVideo> videos;
	@JSONField(name: "wish_count")
	int wishCount;
	@JSONField(name: "original_title")
	String originalTitle;
	@JSONField(name: "blooper_urls")
	List<String> blooperUrls;
	@JSONField(name: "collect_count")
	int collectCount;
	MoiveDetailsImages images;
	@JSONField(name: "douban_site")
	String doubanSite;
	String year;
	@JSONField(name: "popular_comments")
	List<MoiveDetailsPopularCommants> popularComments;
	String alt;
	String id;
	@JSONField(name: "mobile_url")
	String mobileUrl;
	@JSONField(name: "photos_count")
	int photosCount;
	String pubdate;
	String title;
	@JSONField(name: "do_count")
	dynamic doCount;
	@JSONField(name: "has_video")
	bool hasVideo;
	@JSONField(name: "share_url")
	String shareUrl;
	@JSONField(name: "seasons_count")
	dynamic seasonsCount;
	List<String> languages;
	@JSONField(name: "schedule_url")
	String scheduleUrl;
	List<MoiveDetailsWriter> writers;
	List<String> pubdates;
	String website;
	List<String> tags;
	@JSONField(name: "has_schedule")
	bool hasSchedule;
	List<String> durations;
	List<String> genres;
	dynamic collection;
	List<MoiveDetailsTrailer> trailers;
	@JSONField(name: "episodes_count")
	dynamic episodesCount;
	@JSONField(name: "trailer_urls")
	List<String> trailerUrls;
	@JSONField(name: "has_ticket")
	bool hasTicket;
	List<MoiveDetailsBlooper> bloopers;
	@JSONField(name: "clip_urls")
	List<String> clipUrls;
	@JSONField(name: "current_season")
	dynamic currentSeason;
	List<MoiveDetailsCast> casts;
	List<String> countries;
	@JSONField(name: "mainland_pubdate")
	String mainlandPubdate;
	List<MoiveDetailsPhoto> photos;
	String summary;
	List<MoiveDetailsClip> clips;
	String subtype;
	List<MoiveDetailsDirector> directors;
	@JSONField(name: "comments_count")
	int commentsCount;
	@JSONField(name: "popular_reviews")
	List<MoiveDetailsPopularReview> popularReviews;
	@JSONField(name: "ratings_count")
	int ratingsCount;
	List<String> aka;
}

class MoiveDetailsRating with JsonConvert<MoiveDetailsRating> {
	int max;
	double average;
	MoiveDetailsRatingDetails details;
	String stars;
	int min;
}

class MoiveDetailsRatingDetails with JsonConvert<MoiveDetailsRatingDetails> {
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

class MoiveDetailsVideo with JsonConvert<MoiveDetailsVideo> {
	MoiveDetailsVideosSource source;
	@JSONField(name: "sample_link")
	String sampleLink;
	@JSONField(name: "video_id")
	String videoId;
	@JSONField(name: "need_pay")
	bool needPay;
}

class MoiveDetailsVideosSource with JsonConvert<MoiveDetailsVideosSource> {
	String literal;
	String pic;
	String name;
}

class MoiveDetailsImages with JsonConvert<MoiveDetailsImages> {
	String small;
	String large;
	String medium;
}

class MoiveDetailsPopularCommants with JsonConvert<MoiveDetailsPopularCommants> {
	MoiveDetailsPopularCommentsRating rating;
	@JSONField(name: "useful_count")
	int usefulCount;
	MoiveDetailsPopularCommentsAuthor author;
	@JSONField(name: "subject_id")
	String subjectId;
	String content;
	@JSONField(name: "created_at")
	String createdAt;
	String id;
}

class MoiveDetailsPopularCommentsRating with JsonConvert<MoiveDetailsPopularCommentsRating> {
	int max;
	double value;
	int min;
}

class MoiveDetailsPopularCommentsAuthor with JsonConvert<MoiveDetailsPopularCommentsAuthor> {
	String uid;
	String avatar;
	String signature;
	String alt;
	String id;
	String name;
}

class MoiveDetailsWriter with JsonConvert<MoiveDetailsWriter> {
	MoiveDetailsWritersAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MoiveDetailsWritersAvatars with JsonConvert<MoiveDetailsWritersAvatars> {
	String small;
	String large;
	String medium;
}

class MoiveDetailsTrailer with JsonConvert<MoiveDetailsTrailer> {
	String medium;
	String title;
	@JSONField(name: "subject_id")
	String subjectId;
	String alt;
	String small;
	@JSONField(name: "resource_url")
	String resourceUrl;
	String id;
}

class MoiveDetailsBlooper with JsonConvert<MoiveDetailsBlooper> {
	String medium;
	String title;
	@JSONField(name: "subject_id")
	String subjectId;
	String alt;
	String small;
	@JSONField(name: "resource_url")
	String resourceUrl;
	String id;
}

class MoiveDetailsCast with JsonConvert<MoiveDetailsCast> {
	MoiveDetailsCastsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MoiveDetailsCastsAvatars with JsonConvert<MoiveDetailsCastsAvatars> {
	String small;
	String large;
	String medium;
}

class MoiveDetailsPhoto with JsonConvert<MoiveDetailsPhoto> {
	String thumb;
	String image;
	String cover;
	String alt;
	String id;
	String icon;
}

class MoiveDetailsClip with JsonConvert<MoiveDetailsClip> {
	String medium;
	String title;
	@JSONField(name: "subject_id")
	String subjectId;
	String alt;
	String small;
	@JSONField(name: "resource_url")
	String resourceUrl;
	String id;
}

class MoiveDetailsDirector with JsonConvert<MoiveDetailsDirector> {
	MoiveDetailsDirectorsAvatars avatars;
	@JSONField(name: "name_en")
	String nameEn;
	String name;
	String alt;
	String id;
}

class MoiveDetailsDirectorsAvatars with JsonConvert<MoiveDetailsDirectorsAvatars> {
	String small;
	String large;
	String medium;
}

class MoiveDetailsPopularReview with JsonConvert<MoiveDetailsPopularReview> {
	MoiveDetailsPopularReviewsRating rating;
	String title;
	@JSONField(name: "subject_id")
	String subjectId;
	MoiveDetailsPopularReviewsAuthor author;
	String summary;
	String alt;
	String id;
}

class MoiveDetailsPopularReviewsRating with JsonConvert<MoiveDetailsPopularReviewsRating> {
	int max;
	double value;
	int min;
}

class MoiveDetailsPopularReviewsAuthor with JsonConvert<MoiveDetailsPopularReviewsAuthor> {
	String uid;
	String avatar;
	String signature;
	String alt;
	String id;
	String name;
}
