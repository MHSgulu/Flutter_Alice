import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class HotWordTypeEntity with JsonConvert<HotWordTypeEntity> {
	String code;
	bool charge;
	String msg;
	HotWordTypeResult result;
}

class HotWordTypeResult with JsonConvert<HotWordTypeResult> {
	@JSONField(name: "showapi_res_error")
	String showapiResError;
	@JSONField(name: "showapi_res_id")
	String showapiResId;
	@JSONField(name: "showapi_res_code")
	int showapiResCode;
	@JSONField(name: "showapi_res_body")
	HotWordTypeResultShowapiResBody showapiResBody;
}

class HotWordTypeResultShowapiResBody with JsonConvert<HotWordTypeResultShowapiResBody> {
	@JSONField(name: "ret_code")
	int retCode;
	@JSONField(name: "list")
	List<HotWordTypeResultShowapiResBodyList> xList;
}

class HotWordTypeResultShowapiResBodyList with JsonConvert<HotWordTypeResultShowapiResBodyList> {
	String name;
	List<HotWordTypeResultShowapiResBodyListChildList> childList;
}

class HotWordTypeResultShowapiResBodyListChildList with JsonConvert<HotWordTypeResultShowapiResBodyListChildList> {
	String id;
	String name;
}
