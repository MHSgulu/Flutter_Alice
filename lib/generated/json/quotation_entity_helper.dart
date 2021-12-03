import 'package:alice/model/quotation_entity.dart';

quotationEntityFromJson(QuotationEntity data, Map<String, dynamic> json) {
	if (json['showapi_res_error'] != null) {
		data.showapiResError = json['showapi_res_error'].toString();
	}
	if (json['showapi_res_id'] != null) {
		data.showapiResId = json['showapi_res_id'].toString();
	}
	if (json['showapi_res_code'] != null) {
		data.showapiResCode = json['showapi_res_code'] is String
				? int.tryParse(json['showapi_res_code'])
				: json['showapi_res_code'].toInt();
	}
	if (json['showapi_res_body'] != null) {
		data.showapiResBody = new QuotationShowapiResBody().fromJson(json['showapi_res_body']);
	}
	return data;
}

Map<String, dynamic> quotationEntityToJson(QuotationEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_id'] = entity.showapiResId;
	data['showapi_res_code'] = entity.showapiResCode;
	if (entity.showapiResBody != null) {
		data['showapi_res_body'] = entity.showapiResBody.toJson();
	}
	return data;
}

quotationShowapiResBodyFromJson(QuotationShowapiResBody data, Map<String, dynamic> json) {
	if (json['ret_code'] != null) {
		data.retCode = json['ret_code'] is String
				? int.tryParse(json['ret_code'])
				: json['ret_code'].toInt();
	}
	if (json['ret_message'] != null) {
		data.retMessage = json['ret_message'].toString();
	}
	if (json['data'] != null) {
		data.data = <QuotationShowapiResBodyData>[];
		(json['data'] as List).forEach((v) {
			data.data.add(new QuotationShowapiResBodyData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> quotationShowapiResBodyToJson(QuotationShowapiResBody entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ret_code'] = entity.retCode;
	data['ret_message'] = entity.retMessage;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

quotationShowapiResBodyDataFromJson(QuotationShowapiResBodyData data, Map<String, dynamic> json) {
	if (json['english'] != null) {
		data.english = json['english'].toString();
	}
	if (json['chinese'] != null) {
		data.chinese = json['chinese'].toString();
	}
	return data;
}

Map<String, dynamic> quotationShowapiResBodyDataToJson(QuotationShowapiResBodyData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['english'] = entity.english;
	data['chinese'] = entity.chinese;
	return data;
}