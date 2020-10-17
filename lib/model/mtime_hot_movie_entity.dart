import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class MtimeHotMovieEntity with JsonConvert<MtimeHotMovieEntity> {
	String bImg;
	String date;
	bool hasPromo;
	int lid;
	List<MtimeHotMovieM> ms;
	int newActivitiesTime;
	MtimeHotMoviePromo promo;
	int totalComingMovie;
	String voucherMsg;
}

class MtimeHotMovieM with JsonConvert<MtimeHotMovieM> {
	@JSONField(name: "NearestCinemaCount")
	int nearestCinemaCount;
	@JSONField(name: "NearestDay")
	int nearestDay;
	@JSONField(name: "NearestShowtimeCount")
	int nearestShowtimeCount;
	String aN1;
	String aN2;
	String actors;
	int cC;
	String commonSpecial;
	String d;
	String dN;
	int def;
	int id;
	String img;
	bool is3D;
	bool isDMAX;
	bool isFilter;
	bool isHasTrailer;
	bool isHot;
	bool isIMAX;
	bool isIMAX3D;
	bool isNew;
	bool isTicket;
	String m;
	int movieId;
	String movieType;
	List<String> p;
	bool preferentialFlag;
	double r;
	int rc;
	String rd;
	int rsC;
	int sC;
	String t;
	String tCn;
	String tEn;
	int ua;
	List<MtimeHotMovieMsVersion> versions;
	int wantedCount;
	String year;
}

class MtimeHotMovieMsVersion with JsonConvert<MtimeHotMovieMsVersion> {
	@JSONField(name: "enum")
	int xEnum;
	String version;
}

class MtimeHotMoviePromo with JsonConvert<MtimeHotMoviePromo> {

}
