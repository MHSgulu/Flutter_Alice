import 'package:alice/generated/json/base/json_convert_content.dart';

class MTMovieDetailEntity with JsonConvert<MTMovieDetailEntity> {
	String image;
	String titleCn;
	String titleEn;
	String rating;
	String scoreCount;
	String year;
	String content;
	List<String> type;
	String runTime;
	String url;
	String wapUrl;
	bool isEggHunt;
	String commonSpecial;
	int hotRanking;
	String weekBoxOffice;
	String totalBoxOffice;
	String weekBoxOfficeUnit;
	String totalBoxOfficeUnit;
	MTMovieDetailDirector director;
	List<MTMovieDetailActorList> actorList;
	bool isTicket;
	int showCinemaCount;
	int showtimeCount;
	int showDay;
	MTMovieDetailStyle style;
	bool is3D;
	bool isIMAX;
	bool isIMAX3D;
	bool isDMAX;
	List<dynamic> festivals;
	List<dynamic> awards;
	int totalWinAward;
	int totalNominateAward;
	List<String> directors;
	List<String> actors;
	MTMovieDetailRelease release;
	int imageCount;
	List<String> images;
	String video;
	int videoId;
	int videoCount;
	List<MTMovieDetailVideo> videos;
	int personCount;
}

class MTMovieDetailDirector with JsonConvert<MTMovieDetailDirector> {
	int directorId;
	String directorName;
	String directorNameEn;
	String directorImg;
}

class MTMovieDetailActorList with JsonConvert<MTMovieDetailActorList> {
	int actorId;
	String actor;
	String actorEn;
	String actorImg;
	String roleName;
	String roleImg;
}

class MTMovieDetailStyle with JsonConvert<MTMovieDetailStyle> {
	int ifLeadPage;
	String leadUrl;
	String leadImag;
}

class MTMovieDetailRelease with JsonConvert<MTMovieDetailRelease> {
	String location;
	String date;
}

class MTMovieDetailVideo with JsonConvert<MTMovieDetailVideo> {
	String url;
	String image;
	int length;
	String title;
	int videoId;
}
