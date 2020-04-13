import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class GifPictureJokesEntity with JsonConvert<GifPictureJokesEntity> {
	String code;
	bool charge;
	String msg;
	GifPictureJokesResult result;
}

class GifPictureJokesResult with JsonConvert<GifPictureJokesResult> {
	@JSONField(name: "showapi_res_error")
	String showapiResError;
	@JSONField(name: "showapi_res_id")
	String showapiResId;
	@JSONField(name: "showapi_res_code")
	int showapiResCode;
	@JSONField(name: "showapi_res_body")
	GifPictureJokesResultShowapiResBody showapiResBody;
}

class GifPictureJokesResultShowapiResBody with JsonConvert<GifPictureJokesResultShowapiResBody> {
	int allPages;
	@JSONField(name: "ret_code")
	int retCode;
	List<GifPictureJokesResultShowapiResBodyContentlist> contentlist;
	int currentPage;
	int allNum;
	int maxResult;
}

class GifPictureJokesResultShowapiResBodyContentlist with JsonConvert<GifPictureJokesResultShowapiResBodyContentlist> {
	String id;
	String title;
	String img;
	int type;
	String ct;
}
