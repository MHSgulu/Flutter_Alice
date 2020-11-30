import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class GarbageCAIEntity with JsonConvert<GarbageCAIEntity> {
	String code;
	bool charge;
	String msg;
	GarbageCAIResult result;
}

class GarbageCAIResult with JsonConvert<GarbageCAIResult> {
	String code;
	bool charge;
	int remain;
	int remainTimes;
	int remainSeconds;
	String msg;
	GarbageCAIResultResult result;
}

class GarbageCAIResultResult with JsonConvert<GarbageCAIResultResult> {
	int status;
	String message;
	@JSONField(name: "garbage_info")
	List<GarbageCAIResultResultGarbageInfo> garbageInfo;
}

class GarbageCAIResultResultGarbageInfo with JsonConvert<GarbageCAIResultResultGarbageInfo> {
	@JSONField(name: "cate_name")
	String cateName;
	@JSONField(name: "city_id")
	String cityId;
	@JSONField(name: "city_name")
	String cityName;
	int confidence;
	@JSONField(name: "garbage_name")
	String garbageName;
	String ps;
}
