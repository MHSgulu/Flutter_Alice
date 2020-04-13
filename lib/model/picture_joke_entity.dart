import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class PictureJokeEntity with JsonConvert<PictureJokeEntity> {
	String code;
	bool charge;
	String msg;
	PictureJokeResult result;
}

class PictureJokeResult with JsonConvert<PictureJokeResult> {
	@JSONField(name: "showapi_res_error")
	String showapiResError;
	@JSONField(name: "showapi_res_id")
	String showapiResId;
	@JSONField(name: "showapi_res_code")
	int showapiResCode;
	@JSONField(name: "showapi_res_body")
	PictureJokeResultShowapiResBody showapiResBody;
}

class PictureJokeResultShowapiResBody with JsonConvert<PictureJokeResultShowapiResBody> {
	int allPages;
	@JSONField(name: "ret_code")
	int retCode;
	List<PictureJokeResultShowapiResBodyContentlist> contentlist;
	int currentPage;
	int allNum;
	int maxResult;
}

class PictureJokeResultShowapiResBodyContentlist with JsonConvert<PictureJokeResultShowapiResBodyContentlist> {
	String id;
	String title;
	String img;
	int type;
	String ct;
}
