import 'package:alice/model/garbage_c_a_i_entity.dart';

garbageCAIEntityFromJson(GarbageCAIEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['charge'] != null) {
		data.charge = json['charge'];
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['result'] != null) {
		data.result = new GarbageCAIResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> garbageCAIEntityToJson(GarbageCAIEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

garbageCAIResultFromJson(GarbageCAIResult data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['charge'] != null) {
		data.charge = json['charge'];
	}
	if (json['remain'] != null) {
		data.remain = json['remain'] is String
				? int.tryParse(json['remain'])
				: json['remain'].toInt();
	}
	if (json['remainTimes'] != null) {
		data.remainTimes = json['remainTimes'] is String
				? int.tryParse(json['remainTimes'])
				: json['remainTimes'].toInt();
	}
	if (json['remainSeconds'] != null) {
		data.remainSeconds = json['remainSeconds'] is String
				? int.tryParse(json['remainSeconds'])
				: json['remainSeconds'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['result'] != null) {
		data.result = new GarbageCAIResultResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> garbageCAIResultToJson(GarbageCAIResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['remain'] = entity.remain;
	data['remainTimes'] = entity.remainTimes;
	data['remainSeconds'] = entity.remainSeconds;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

garbageCAIResultResultFromJson(GarbageCAIResultResult data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['garbage_info'] != null) {
		data.garbageInfo = new List<GarbageCAIResultResultGarbageInfo>();
		(json['garbage_info'] as List).forEach((v) {
			data.garbageInfo.add(new GarbageCAIResultResultGarbageInfo().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> garbageCAIResultResultToJson(GarbageCAIResultResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['message'] = entity.message;
	if (entity.garbageInfo != null) {
		data['garbage_info'] =  entity.garbageInfo.map((v) => v.toJson()).toList();
	}
	return data;
}

garbageCAIResultResultGarbageInfoFromJson(GarbageCAIResultResultGarbageInfo data, Map<String, dynamic> json) {
	if (json['cate_name'] != null) {
		data.cateName = json['cate_name'].toString();
	}
	if (json['city_id'] != null) {
		data.cityId = json['city_id'].toString();
	}
	if (json['city_name'] != null) {
		data.cityName = json['city_name'].toString();
	}
	if (json['confidence'] != null) {
		data.confidence = json['confidence'] is String
				? int.tryParse(json['confidence'])
				: json['confidence'].toInt();
	}
	if (json['garbage_name'] != null) {
		data.garbageName = json['garbage_name'].toString();
	}
	if (json['ps'] != null) {
		data.ps = json['ps'].toString();
	}
	return data;
}

Map<String, dynamic> garbageCAIResultResultGarbageInfoToJson(GarbageCAIResultResultGarbageInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cate_name'] = entity.cateName;
	data['city_id'] = entity.cityId;
	data['city_name'] = entity.cityName;
	data['confidence'] = entity.confidence;
	data['garbage_name'] = entity.garbageName;
	data['ps'] = entity.ps;
	return data;
}