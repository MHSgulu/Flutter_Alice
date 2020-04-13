import 'package:alice/generated/json/base/json_convert_content.dart';

class MobiePhoneEntity with JsonConvert<MobiePhoneEntity> {
	String code;
	bool charge;
	String msg;
	MobiePhoneResult result;
}

class MobiePhoneResult with JsonConvert<MobiePhoneResult> {
	int status;
	String msg;
	MobiePhoneResultResult result;
}

class MobiePhoneResultResult with JsonConvert<MobiePhoneResultResult> {
	String shouji;
	String province;
	String city;
	String company;
	String cardtype;
	String areacode;
}
