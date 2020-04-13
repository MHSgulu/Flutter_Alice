import 'package:alice/model/written_jokes_entity.dart';

writtenJokesEntityFromJson(WrittenJokesEntity data, Map<String, dynamic> json) {
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
		data.result = new WrittenJokesResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> writtenJokesEntityToJson(WrittenJokesEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

writtenJokesResultFromJson(WrittenJokesResult data, Map<String, dynamic> json) {
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
		data.showapiResBody = new WrittenJokesResultShowapiResBody().fromJson(json['showapi_res_body']);
	}
	return data;
}

Map<String, dynamic> writtenJokesResultToJson(WrittenJokesResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_id'] = entity.showapiResId;
	data['showapi_res_code'] = entity.showapiResCode;
	if (entity.showapiResBody != null) {
		data['showapi_res_body'] = entity.showapiResBody.toJson();
	}
	return data;
}

writtenJokesResultShowapiResBodyFromJson(WrittenJokesResultShowapiResBody data, Map<String, dynamic> json) {
	if (json['contentlist'] != null) {
		data.contentlist = new List<WrittenJokesResultShowapiResBodyContentlist>();
		(json['contentlist'] as List).forEach((v) {
			data.contentlist.add(new WrittenJokesResultShowapiResBodyContentlist().fromJson(v));
		});
	}
	if (json['maxResult'] != null) {
		data.maxResult = json['maxResult']?.toInt();
	}
	if (json['allNum'] != null) {
		data.allNum = json['allNum']?.toInt();
	}
	if (json['allPages'] != null) {
		data.allPages = json['allPages']?.toInt();
	}
	if (json['currentPage'] != null) {
		data.currentPage = json['currentPage']?.toInt();
	}
	if (json['ret_code'] != null) {
		data.retCode = json['ret_code']?.toInt();
	}
	return data;
}

Map<String, dynamic> writtenJokesResultShowapiResBodyToJson(WrittenJokesResultShowapiResBody entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.contentlist != null) {
		data['contentlist'] =  entity.contentlist.map((v) => v.toJson()).toList();
	}
	data['maxResult'] = entity.maxResult;
	data['allNum'] = entity.allNum;
	data['allPages'] = entity.allPages;
	data['currentPage'] = entity.currentPage;
	data['ret_code'] = entity.retCode;
	return data;
}

writtenJokesResultShowapiResBodyContentlistFromJson(WrittenJokesResultShowapiResBodyContentlist data, Map<String, dynamic> json) {
	if (json['ct'] != null) {
		data.ct = json['ct']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	return data;
}

Map<String, dynamic> writtenJokesResultShowapiResBodyContentlistToJson(WrittenJokesResultShowapiResBodyContentlist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ct'] = entity.ct;
	data['id'] = entity.id;
	data['text'] = entity.text;
	data['title'] = entity.title;
	data['type'] = entity.type;
	return data;
}