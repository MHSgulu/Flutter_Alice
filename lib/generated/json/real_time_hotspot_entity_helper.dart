import 'package:alice/model/real_time_hotspot_entity.dart';

realTimeHotspotEntityFromJson(RealTimeHotspotEntity data, Map<String, dynamic> json) {
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
		data.result = new RealTimeHotspotResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> realTimeHotspotEntityToJson(RealTimeHotspotEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

realTimeHotspotResultFromJson(RealTimeHotspotResult data, Map<String, dynamic> json) {
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
		data.showapiResBody = new RealTimeHotspotResultShowapiResBody().fromJson(json['showapi_res_body']);
	}
	return data;
}

Map<String, dynamic> realTimeHotspotResultToJson(RealTimeHotspotResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_id'] = entity.showapiResId;
	data['showapi_res_code'] = entity.showapiResCode;
	if (entity.showapiResBody != null) {
		data['showapi_res_body'] = entity.showapiResBody.toJson();
	}
	return data;
}

realTimeHotspotResultShowapiResBodyFromJson(RealTimeHotspotResultShowapiResBody data, Map<String, dynamic> json) {
	if (json['ret_code'] != null) {
		data.retCode = json['ret_code']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<RealTimeHotspotResultShowapiResBodyList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new RealTimeHotspotResultShowapiResBodyList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> realTimeHotspotResultShowapiResBodyToJson(RealTimeHotspotResultShowapiResBody entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ret_code'] = entity.retCode;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

realTimeHotspotResultShowapiResBodyListFromJson(RealTimeHotspotResultShowapiResBodyList data, Map<String, dynamic> json) {
	if (json['num'] != null) {
		data.num = json['num']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toString();
	}
	if (json['trend'] != null) {
		data.trend = json['trend']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> realTimeHotspotResultShowapiResBodyListToJson(RealTimeHotspotResultShowapiResBodyList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['num'] = entity.num;
	data['level'] = entity.level;
	data['trend'] = entity.trend;
	data['name'] = entity.name;
	return data;
}