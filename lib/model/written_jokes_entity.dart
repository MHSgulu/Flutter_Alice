import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class WrittenJokesEntity with JsonConvert<WrittenJokesEntity> {
	String code;
	bool charge;
	String msg;
	WrittenJokesResult result;
}

class WrittenJokesResult with JsonConvert<WrittenJokesResult> {
	@JSONField(name: "showapi_res_error")
	String showapiResError;
	@JSONField(name: "showapi_res_id")
	String showapiResId;
	@JSONField(name: "showapi_res_code")
	int showapiResCode;
	@JSONField(name: "showapi_res_body")
	WrittenJokesResultShowapiResBody showapiResBody;
}

class WrittenJokesResultShowapiResBody with JsonConvert<WrittenJokesResultShowapiResBody> {
	List<WrittenJokesResultShowapiResBodyContentlist> contentlist;
	int maxResult;
	int allNum;
	int allPages;
	int currentPage;
	@JSONField(name: "ret_code")
	int retCode;
}

class WrittenJokesResultShowapiResBodyContentlist with JsonConvert<WrittenJokesResultShowapiResBodyContentlist> {
	String ct;
	String id;
	String text;
	String title;
	int type;
}
