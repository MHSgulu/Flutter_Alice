import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class TodayEpidemicDataEntity with JsonConvert<TodayEpidemicDataEntity> {
	@JSONField(name: "showapi_res_error")
	String showapiResError;
	@JSONField(name: "showapi_res_id")
	String showapiResId;
	@JSONField(name: "showapi_res_code")
	int showapiResCode;
	@JSONField(name: "showapi_res_body")
	TodayEpidemicDataShowapiResBody showapiResBody;
}

class TodayEpidemicDataShowapiResBody with JsonConvert<TodayEpidemicDataShowapiResBody> {
	@JSONField(name: "ret_code")
	int retCode;
	List<TodayEpidemicDataShowapiResBodyTodayDetailList> todayDetailList;
	String updateTime;
	TodayEpidemicDataShowapiResBodyTodayStatictic todayStatictic;
}

class TodayEpidemicDataShowapiResBodyTodayDetailList with JsonConvert<TodayEpidemicDataShowapiResBodyTodayDetailList> {
	List<TodayEpidemicDataShowapiResBodyTodayDetailListCityList> cityList;
	int highDangerNum;
	int locationId;
	int suspectedNum;
	int deadNum;
	String provinceName;
	int curedNum;
	String statisticsData;
	List<TodayEpidemicDataShowapiResBodyTodayDetailListDangerArea> dangerAreas;
	int confirmedNum;
	int midDangerNum;
	int currentConfirmedNum;
}

class TodayEpidemicDataShowapiResBodyTodayDetailListCityList with JsonConvert<TodayEpidemicDataShowapiResBodyTodayDetailListCityList> {
	int highDangerNum;
	String cityName;
	int locationId;
	int suspectedNum;
	int deadNum;
	int curedNum;
	int confirmedNum;
	int midDangerNum;
	int currentConfirmedNum;
}

class TodayEpidemicDataShowapiResBodyTodayDetailListDangerArea with JsonConvert<TodayEpidemicDataShowapiResBodyTodayDetailListDangerArea> {
	String areaName;
	String cityName;
	int dangerLevel;
}

class TodayEpidemicDataShowapiResBodyTodayStatictic with JsonConvert<TodayEpidemicDataShowapiResBodyTodayStatictic> {
	int suspectedIncr;
	int confirmedIncr;
	int curedIncr;
	int deadIncr;
	int seriousIncr;
	int externalConfirmedIncr;
	int asymptomaticIncr;
	int suspectedNum;
	int curedNum;
	int deadNum;
	int seriousNum;
	int confirmedNum;
	int externalConfirmedNum;
	int asymptomaticNum;
}
