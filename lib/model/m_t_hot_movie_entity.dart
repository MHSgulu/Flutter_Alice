import 'package:alice/generated/json/base/json_convert_content.dart';

class MTHotMovieEntity with JsonConvert<MTHotMovieEntity> {
	int count;
	List<MTHotMovieMovie> movies;
	int totalCinemaCount;
	int totalComingMovie;
	int totalHotMovie;
}

class MTHotMovieMovie with JsonConvert<MTHotMovieMovie> {
	String actorName1;
	String actorName2;
	String btnText;
	String commonSpecial;
	String directorName;
	String img;
	bool is3D;
	bool isDMAX;
	bool isFilter;
	bool isHot;
	bool isIMAX;
	bool isIMAX3D;
	bool isNew;
	int length;
	int movieId;
	MTHotMovieMoviesNearestShowtime nearestShowtime;
	bool preferentialFlag;
	int rDay;
	int rMonth;
	int rYear;
	double ratingFinal;
	String titleCn;
	String titleEn;
	String type;
	int wantedCount;
}

class MTHotMovieMoviesNearestShowtime with JsonConvert<MTHotMovieMoviesNearestShowtime> {
	bool isTicket;
	int nearestCinemaCount;
	int nearestShowDay;
	int nearestShowtimeCount;
}
