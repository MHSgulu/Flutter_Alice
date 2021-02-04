import 'package:alice/model/epidemics_abroad_data_entity.dart';

epidemicsAbroadDataEntityFromJson(EpidemicsAbroadDataEntity data, Map<String, dynamic> json) {
	if (json['showapi_res_error'] != null) {
		data.showapiResError = json['showapi_res_error'].toString();
	}
	if (json['showapi_res_code'] != null) {
		data.showapiResCode = json['showapi_res_code'] is String
				? int.tryParse(json['showapi_res_code'])
				: json['showapi_res_code'].toInt();
	}
	if (json['showapi_res_id'] != null) {
		data.showapiResId = json['showapi_res_id'].toString();
	}
	if (json['showapi_res_body'] != null) {
		data.showapiResBody = new EpidemicsAbroadDataShowapiResBody().fromJson(json['showapi_res_body']);
	}
	return data;
}

Map<String, dynamic> epidemicsAbroadDataEntityToJson(EpidemicsAbroadDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_code'] = entity.showapiResCode;
	data['showapi_res_id'] = entity.showapiResId;
	if (entity.showapiResBody != null) {
		data['showapi_res_body'] = entity.showapiResBody.toJson();
	}
	return data;
}

epidemicsAbroadDataShowapiResBodyFromJson(EpidemicsAbroadDataShowapiResBody data, Map<String, dynamic> json) {
	if (json['ret_code'] != null) {
		data.retCode = json['ret_code'] is String
				? int.tryParse(json['ret_code'])
				: json['ret_code'].toInt();
	}
	if (json['foreignList'] != null) {
		data.foreignList = new List<EpidemicsAbroadDataShowapiResBodyForeignList>();
		(json['foreignList'] as List).forEach((v) {
			data.foreignList.add(new EpidemicsAbroadDataShowapiResBodyForeignList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> epidemicsAbroadDataShowapiResBodyToJson(EpidemicsAbroadDataShowapiResBody entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ret_code'] = entity.retCode;
	if (entity.foreignList != null) {
		data['foreignList'] =  entity.foreignList.map((v) => v.toJson()).toList();
	}
	return data;
}

epidemicsAbroadDataShowapiResBodyForeignListFromJson(EpidemicsAbroadDataShowapiResBodyForeignList data, Map<String, dynamic> json) {
	if (json['countryFullName'] != null) {
		data.countryFullName = json['countryFullName'].toString();
	}
	if (json['confirmedNum'] != null) {
		data.confirmedNum = json['confirmedNum'] is String
				? int.tryParse(json['confirmedNum'])
				: json['confirmedNum'].toInt();
	}
	if (json['yesterday_inc_info'] != null) {
		data.yesterdayIncInfo = new EpidemicsAbroadDataShowapiResBodyForeignListYesterdayIncInfo().fromJson(json['yesterday_inc_info']);
	}
	if (json['areaName'] != null) {
		data.areaName = json['areaName'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'].toString();
	}
	if (json['continents'] != null) {
		data.continents = json['continents'].toString();
	}
	if (json['deadNum'] != null) {
		data.deadNum = json['deadNum'] is String
				? int.tryParse(json['deadNum'])
				: json['deadNum'].toInt();
	}
	if (json['inc_info'] != null) {
		data.incInfo = new EpidemicsAbroadDataShowapiResBodyForeignListIncInfo().fromJson(json['inc_info']);
	}
	if (json['curedNum'] != null) {
		data.curedNum = json['curedNum'] is String
				? int.tryParse(json['curedNum'])
				: json['curedNum'].toInt();
	}
	if (json['currentConfirmedNum'] != null) {
		data.currentConfirmedNum = json['currentConfirmedNum'] is String
				? int.tryParse(json['currentConfirmedNum'])
				: json['currentConfirmedNum'].toInt();
	}
	if (json['suspectedNum'] != null) {
		data.suspectedNum = json['suspectedNum'] is String
				? int.tryParse(json['suspectedNum'])
				: json['suspectedNum'].toInt();
	}
	return data;
}

Map<String, dynamic> epidemicsAbroadDataShowapiResBodyForeignListToJson(EpidemicsAbroadDataShowapiResBodyForeignList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['countryFullName'] = entity.countryFullName;
	data['confirmedNum'] = entity.confirmedNum;
	if (entity.yesterdayIncInfo != null) {
		data['yesterday_inc_info'] = entity.yesterdayIncInfo.toJson();
	}
	data['areaName'] = entity.areaName;
	data['updateTime'] = entity.updateTime;
	data['continents'] = entity.continents;
	data['deadNum'] = entity.deadNum;
	if (entity.incInfo != null) {
		data['inc_info'] = entity.incInfo.toJson();
	}
	data['curedNum'] = entity.curedNum;
	data['currentConfirmedNum'] = entity.currentConfirmedNum;
	data['suspectedNum'] = entity.suspectedNum;
	return data;
}

epidemicsAbroadDataShowapiResBodyForeignListYesterdayIncInfoFromJson(EpidemicsAbroadDataShowapiResBodyForeignListYesterdayIncInfo data, Map<String, dynamic> json) {
	if (json['confirmed_inc'] != null) {
		data.confirmedInc = json['confirmed_inc'] is String
				? int.tryParse(json['confirmed_inc'])
				: json['confirmed_inc'].toInt();
	}
	if (json['dead_inc'] != null) {
		data.deadInc = json['dead_inc'] is String
				? int.tryParse(json['dead_inc'])
				: json['dead_inc'].toInt();
	}
	if (json['cured_inc'] != null) {
		data.curedInc = json['cured_inc'] is String
				? int.tryParse(json['cured_inc'])
				: json['cured_inc'].toInt();
	}
	return data;
}

Map<String, dynamic> epidemicsAbroadDataShowapiResBodyForeignListYesterdayIncInfoToJson(EpidemicsAbroadDataShowapiResBodyForeignListYesterdayIncInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['confirmed_inc'] = entity.confirmedInc;
	data['dead_inc'] = entity.deadInc;
	data['cured_inc'] = entity.curedInc;
	return data;
}

epidemicsAbroadDataShowapiResBodyForeignListIncInfoFromJson(EpidemicsAbroadDataShowapiResBodyForeignListIncInfo data, Map<String, dynamic> json) {
	if (json['confirmed_inc'] != null) {
		data.confirmedInc = json['confirmed_inc'] is String
				? int.tryParse(json['confirmed_inc'])
				: json['confirmed_inc'].toInt();
	}
	if (json['dead_inc'] != null) {
		data.deadInc = json['dead_inc'] is String
				? int.tryParse(json['dead_inc'])
				: json['dead_inc'].toInt();
	}
	if (json['cured_inc'] != null) {
		data.curedInc = json['cured_inc'] is String
				? int.tryParse(json['cured_inc'])
				: json['cured_inc'].toInt();
	}
	return data;
}

Map<String, dynamic> epidemicsAbroadDataShowapiResBodyForeignListIncInfoToJson(EpidemicsAbroadDataShowapiResBodyForeignListIncInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['confirmed_inc'] = entity.confirmedInc;
	data['dead_inc'] = entity.deadInc;
	data['cured_inc'] = entity.curedInc;
	return data;
}