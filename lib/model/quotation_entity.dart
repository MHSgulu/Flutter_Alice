import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class QuotationEntity with JsonConvert<QuotationEntity> {
	@JSONField(name: "showapi_res_error")
	String showapiResError;
	@JSONField(name: "showapi_res_id")
	String showapiResId;
	@JSONField(name: "showapi_res_code")
	int showapiResCode;
	@JSONField(name: "showapi_res_body")
	QuotationShowapiResBody showapiResBody;
}

class QuotationShowapiResBody with JsonConvert<QuotationShowapiResBody> {
	@JSONField(name: "ret_code")
	int retCode;
	@JSONField(name: "ret_message")
	String retMessage;
	List<QuotationShowapiResBodyData> data;
}

class QuotationShowapiResBodyData with JsonConvert<QuotationShowapiResBodyData> {
	String english;
	String chinese;
}
