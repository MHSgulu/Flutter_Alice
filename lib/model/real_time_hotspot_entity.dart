import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class RealTimeHotspotEntity with JsonConvert<RealTimeHotspotEntity> {
	String code;
	bool charge;
	String msg;
	RealTimeHotspotResult result;
}

class RealTimeHotspotResult with JsonConvert<RealTimeHotspotResult> {
	@JSONField(name: "showapi_res_error")
	String showapiResError;
	@JSONField(name: "showapi_res_id")
	String showapiResId;
	@JSONField(name: "showapi_res_code")
	int showapiResCode;
	@JSONField(name: "showapi_res_body")
	RealTimeHotspotResultShowapiResBody showapiResBody;
}

class RealTimeHotspotResultShowapiResBody with JsonConvert<RealTimeHotspotResultShowapiResBody> {
	@JSONField(name: "ret_code")
	int retCode;
	@JSONField(name: "list")
	List<RealTimeHotspotResultShowapiResBodyList> xList;
}

class RealTimeHotspotResultShowapiResBodyList with JsonConvert<RealTimeHotspotResultShowapiResBodyList> {
	String num;
	String level;
	String trend;
	String name;
}
