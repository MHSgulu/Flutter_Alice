import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class EpidemicsAbroadDataEntity with JsonConvert<EpidemicsAbroadDataEntity> {
	@JSONField(name: "showapi_res_error")
	String showapiResError;
	@JSONField(name: "showapi_res_code")
	int showapiResCode;
	@JSONField(name: "showapi_res_id")
	String showapiResId;
	@JSONField(name: "showapi_res_body")
	EpidemicsAbroadDataShowapiResBody showapiResBody;
}

class EpidemicsAbroadDataShowapiResBody with JsonConvert<EpidemicsAbroadDataShowapiResBody> {
	@JSONField(name: "ret_code")
	int retCode;
	List<EpidemicsAbroadDataShowapiResBodyForeignList> foreignList;
}

class EpidemicsAbroadDataShowapiResBodyForeignList with JsonConvert<EpidemicsAbroadDataShowapiResBodyForeignList> {
	String countryFullName;
	int confirmedNum;
	@JSONField(name: "yesterday_inc_info")
	EpidemicsAbroadDataShowapiResBodyForeignListYesterdayIncInfo yesterdayIncInfo;
	String areaName;
	String updateTime;
	String continents;
	int deadNum;
	@JSONField(name: "inc_info")
	EpidemicsAbroadDataShowapiResBodyForeignListIncInfo incInfo;
	int curedNum;
	int currentConfirmedNum;
	int suspectedNum;
}

class EpidemicsAbroadDataShowapiResBodyForeignListYesterdayIncInfo with JsonConvert<EpidemicsAbroadDataShowapiResBodyForeignListYesterdayIncInfo> {
	@JSONField(name: "confirmed_inc")
	int confirmedInc;
	@JSONField(name: "dead_inc")
	int deadInc;
	@JSONField(name: "cured_inc")
	int curedInc;
}

class EpidemicsAbroadDataShowapiResBodyForeignListIncInfo with JsonConvert<EpidemicsAbroadDataShowapiResBodyForeignListIncInfo> {
	@JSONField(name: "confirmed_inc")
	int confirmedInc;
	@JSONField(name: "dead_inc")
	int deadInc;
	@JSONField(name: "cured_inc")
	int curedInc;
}
