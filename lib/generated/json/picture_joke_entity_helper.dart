import 'package:alice/model/picture_joke_entity.dart';
import 'package:alice/generated/json/base/json_filed.dart';

pictureJokeEntityFromJson(PictureJokeEntity data, Map<String, dynamic> json) {
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
		data.result = new PictureJokeResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> pictureJokeEntityToJson(PictureJokeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

pictureJokeResultFromJson(PictureJokeResult data, Map<String, dynamic> json) {
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
		data.showapiResBody = new PictureJokeResultShowapiResBody().fromJson(json['showapi_res_body']);
	}
	return data;
}

Map<String, dynamic> pictureJokeResultToJson(PictureJokeResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_id'] = entity.showapiResId;
	data['showapi_res_code'] = entity.showapiResCode;
	if (entity.showapiResBody != null) {
		data['showapi_res_body'] = entity.showapiResBody.toJson();
	}
	return data;
}

pictureJokeResultShowapiResBodyFromJson(PictureJokeResultShowapiResBody data, Map<String, dynamic> json) {
	if (json['allPages'] != null) {
		data.allPages = json['allPages']?.toInt();
	}
	if (json['ret_code'] != null) {
		data.retCode = json['ret_code']?.toInt();
	}
	if (json['contentlist'] != null) {
		data.contentlist = new List<PictureJokeResultShowapiResBodyContentlist>();
		(json['contentlist'] as List).forEach((v) {
			data.contentlist.add(new PictureJokeResultShowapiResBodyContentlist().fromJson(v));
		});
	}
	if (json['currentPage'] != null) {
		data.currentPage = json['currentPage']?.toInt();
	}
	if (json['allNum'] != null) {
		data.allNum = json['allNum']?.toInt();
	}
	if (json['maxResult'] != null) {
		data.maxResult = json['maxResult']?.toInt();
	}
	return data;
}

Map<String, dynamic> pictureJokeResultShowapiResBodyToJson(PictureJokeResultShowapiResBody entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['allPages'] = entity.allPages;
	data['ret_code'] = entity.retCode;
	if (entity.contentlist != null) {
		data['contentlist'] =  entity.contentlist.map((v) => v.toJson()).toList();
	}
	data['currentPage'] = entity.currentPage;
	data['allNum'] = entity.allNum;
	data['maxResult'] = entity.maxResult;
	return data;
}

pictureJokeResultShowapiResBodyContentlistFromJson(PictureJokeResultShowapiResBodyContentlist data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['img'] != null) {
		data.img = json['img']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['ct'] != null) {
		data.ct = json['ct']?.toString();
	}
	return data;
}

Map<String, dynamic> pictureJokeResultShowapiResBodyContentlistToJson(PictureJokeResultShowapiResBodyContentlist entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['img'] = entity.img;
	data['type'] = entity.type;
	data['ct'] = entity.ct;
	return data;
}