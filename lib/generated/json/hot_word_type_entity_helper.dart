import 'package:alice/model/hot_word_type_entity.dart';

hotWordTypeEntityFromJson(HotWordTypeEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['charge'] != null) {
		data.charge = json['charge'];
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['result'] != null) {
		data.result = new HotWordTypeResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> hotWordTypeEntityToJson(HotWordTypeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

hotWordTypeResultFromJson(HotWordTypeResult data, Map<String, dynamic> json) {
	if (json['showapi_res_error'] != null) {
		data.showapiResError = json['showapi_res_error']?.toString();
	}
	if (json['showapi_res_id'] != null) {
		data.showapiResId = json['showapi_res_id']?.toString();
	}
	if (json['showapi_res_code'] != null) {
		data.showapiResCode = json['showapi_res_code']?.toInt();
	}
	if (json['showapi_res_body'] != null) {
		data.showapiResBody = new HotWordTypeResultShowapiResBody().fromJson(json['showapi_res_body']);
	}
	return data;
}

Map<String, dynamic> hotWordTypeResultToJson(HotWordTypeResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_id'] = entity.showapiResId;
	data['showapi_res_code'] = entity.showapiResCode;
	if (entity.showapiResBody != null) {
		data['showapi_res_body'] = entity.showapiResBody.toJson();
	}
	return data;
}

hotWordTypeResultShowapiResBodyFromJson(HotWordTypeResultShowapiResBody data, Map<String, dynamic> json) {
	if (json['ret_code'] != null) {
		data.retCode = json['ret_code']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<HotWordTypeResultShowapiResBodyList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HotWordTypeResultShowapiResBodyList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> hotWordTypeResultShowapiResBodyToJson(HotWordTypeResultShowapiResBody entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ret_code'] = entity.retCode;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

hotWordTypeResultShowapiResBodyListFromJson(HotWordTypeResultShowapiResBodyList data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['childList'] != null) {
		data.childList = new List<HotWordTypeResultShowapiResBodyListChildList>();
		(json['childList'] as List).forEach((v) {
			data.childList.add(new HotWordTypeResultShowapiResBodyListChildList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> hotWordTypeResultShowapiResBodyListToJson(HotWordTypeResultShowapiResBodyList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	if (entity.childList != null) {
		data['childList'] =  entity.childList.map((v) => v.toJson()).toList();
	}
	return data;
}

hotWordTypeResultShowapiResBodyListChildListFromJson(HotWordTypeResultShowapiResBodyListChildList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> hotWordTypeResultShowapiResBodyListChildListToJson(HotWordTypeResultShowapiResBodyListChildList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}