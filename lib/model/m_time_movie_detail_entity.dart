import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class MTimeMovieDetailEntity with JsonConvert<MTimeMovieDetailEntity> {
	String code;
	MTimeMovieDetailData data;
	String msg;
	String showMsg;
}

class MTimeMovieDetailData with JsonConvert<MTimeMovieDetailData> {
	MTimeMovieDetailDataAdvertisement advertisement;
	MTimeMovieDetailDataBasic basic;
	MTimeMovieDetailDataBoxOffice boxOffice;
	MTimeMovieDetailDataLive live;
	String playState;
	List<dynamic> playlist;
	MTimeMovieDetailDataRelated related;
}

class MTimeMovieDetailDataAdvertisement with JsonConvert<MTimeMovieDetailDataAdvertisement> {
	List<dynamic> advList;
	int count;
	String error;
	bool success;
}

class MTimeMovieDetailDataBasic with JsonConvert<MTimeMovieDetailDataBasic> {
	List<MTimeMovieDetailDataBasicActor> actors;
	int attitude;
	MTimeMovieDetailDataBasicAward award;
	String bigImage;
	String broadcastDes;
	String commentSpecial;
	MTimeMovieDetailDataBasicCommunity community;
	MTimeMovieDetailDataBasicDirector director;
	String eggDesc;
	String episodeCnt;
	List<dynamic> festivals;
	int hasSeenCount;
	String hasSeenCountShow;
	int hotRanking;
	String img;
	bool is3D;
	bool isDMAX;
	bool isEggHunt;
	int isFavorite;
	bool isFilter;
	bool isIMAX;
	bool isIMAX3D;
	bool isTicket;
	String message;
	String mins;
	int movieId;
	int movieStatus;
	String name;
	String nameEn;
	int overallRating;
	int personCount;
	MTimeMovieDetailDataBasicQuizGame quizGame;
	int ratingCount;
	String ratingCountShow;
	String releaseArea;
	String releaseDate;
	bool sensitiveStatus;
	int showCinemaCount;
	int showDay;
	int showtimeCount;
	MTimeMovieDetailDataBasicStageImg stageImg;
	String story;
	MTimeMovieDetailDataBasicStyle style;
	String summary;
	int totalNominateAward;
	int totalWinAward;
	List<String> type;
	String url;
	String userComment;
	int userCommentId;
	String userImg;
	String userName;
	int userRating;
	MTimeMovieDetailDataBasicVideo video;
	int wantToSeeCount;
	String wantToSeeCountShow;
	String wantToSeeNumberShow;
	String year;
}

class MTimeMovieDetailDataBasicActor with JsonConvert<MTimeMovieDetailDataBasicActor> {
	int actorId;
	String img;
	String name;
	String nameEn;
	String roleImg;
	String roleName;
}

class MTimeMovieDetailDataBasicAward with JsonConvert<MTimeMovieDetailDataBasicAward> {
	List<dynamic> awardList;
	int totalNominateAward;
	int totalWinAward;
}

class MTimeMovieDetailDataBasicCommunity with JsonConvert<MTimeMovieDetailDataBasicCommunity> {

}

class MTimeMovieDetailDataBasicDirector with JsonConvert<MTimeMovieDetailDataBasicDirector> {
	int directorId;
	String img;
	String name;
	String nameEn;
}

class MTimeMovieDetailDataBasicQuizGame with JsonConvert<MTimeMovieDetailDataBasicQuizGame> {

}

class MTimeMovieDetailDataBasicStageImg with JsonConvert<MTimeMovieDetailDataBasicStageImg> {
	int count;
	@JSONField(name: "list")
	List<MTimeMovieDetailDataBasicStageImgList> xList;
}

class MTimeMovieDetailDataBasicStageImgList with JsonConvert<MTimeMovieDetailDataBasicStageImgList> {
	int imgId;
	String imgUrl;
}

class MTimeMovieDetailDataBasicStyle with JsonConvert<MTimeMovieDetailDataBasicStyle> {
	int isLeadPage;
	String leadImg;
	String leadUrl;
}

class MTimeMovieDetailDataBasicVideo with JsonConvert<MTimeMovieDetailDataBasicVideo> {
	int count;
	String hightUrl;
	String img;
	String title;
	String url;
	int videoId;
	int videoSourceType;
}

class MTimeMovieDetailDataBoxOffice with JsonConvert<MTimeMovieDetailDataBoxOffice> {

}

class MTimeMovieDetailDataLive with JsonConvert<MTimeMovieDetailDataLive> {
	int count;
	String img;
	bool isSubscribe;
	int liveId;
	String playNumTag;
	String playTag;
	int status;
	String title;
}

class MTimeMovieDetailDataRelated with JsonConvert<MTimeMovieDetailDataRelated> {
	int goodsCount;
	List<dynamic> goodsList;
	int relateId;
	String relatedUrl;
	int type;
}
