import 'package:alice/model/today_epidemic_data_entity.dart';

todayEpidemicDataEntityFromJson(TodayEpidemicDataEntity data, Map<String, dynamic> json) {
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
		data.showapiResBody = new TodayEpidemicDataShowapiResBody().fromJson(json['showapi_res_body']);
	}
	return data;
}

Map<String, dynamic> todayEpidemicDataEntityToJson(TodayEpidemicDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['showapi_res_error'] = entity.showapiResError;
	data['showapi_res_id'] = entity.showapiResId;
	data['showapi_res_code'] = entity.showapiResCode;
	if (entity.showapiResBody != null) {
		data['showapi_res_body'] = entity.showapiResBody.toJson();
	}
	return data;
}

todayEpidemicDataShowapiResBodyFromJson(TodayEpidemicDataShowapiResBody data, Map<String, dynamic> json) {
	if (json['ret_code'] != null) {
		data.retCode = json['ret_code'] is String
				? int.tryParse(json['ret_code'])
				: json['ret_code'].toInt();
	}
	if (json['todayDetailList'] != null) {
		data.todayDetailList = new List<TodayEpidemicDataShowapiResBodyTodayDetailList>();
		(json['todayDetailList'] as List).forEach((v) {
			data.todayDetailList.add(new TodayEpidemicDataShowapiResBodyTodayDetailList().fromJson(v));
		});
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'].toString();
	}
	if (json['todayStatictic'] != null) {
		data.todayStatictic = new TodayEpidemicDataShowapiResBodyTodayStatictic().fromJson(json['todayStatictic']);
	}
	return data;
}

Map<String, dynamic> todayEpidemicDataShowapiResBodyToJson(TodayEpidemicDataShowapiResBody entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ret_code'] = entity.retCode;
	if (entity.todayDetailList != null) {
		data['todayDetailList'] =  entity.todayDetailList.map((v) => v.toJson()).toList();
	}
	data['updateTime'] = entity.updateTime;
	if (entity.todayStatictic != null) {
		data['todayStatictic'] = entity.todayStatictic.toJson();
	}
	return data;
}

todayEpidemicDataShowapiResBodyTodayDetailListFromJson(TodayEpidemicDataShowapiResBodyTodayDetailList data, Map<String, dynamic> json) {
	if (json['cityList'] != null) {
		data.cityList = new List<TodayEpidemicDataShowapiResBodyTodayDetailListCityList>();
		(json['cityList'] as List).forEach((v) {
			data.cityList.add(new TodayEpidemicDataShowapiResBodyTodayDetailListCityList().fromJson(v));
		});
	}
	if (json['highDangerNum'] != null) {
		data.highDangerNum = json['highDangerNum'] is String
				? int.tryParse(json['highDangerNum'])
				: json['highDangerNum'].toInt();
	}
	if (json['locationId'] != null) {
		data.locationId = json['locationId'] is String
				? int.tryParse(json['locationId'])
				: json['locationId'].toInt();
	}
	if (json['suspectedNum'] != null) {
		data.suspectedNum = json['suspectedNum'] is String
				? int.tryParse(json['suspectedNum'])
				: json['suspectedNum'].toInt();
	}
	if (json['deadNum'] != null) {
		data.deadNum = json['deadNum'] is String
				? int.tryParse(json['deadNum'])
				: json['deadNum'].toInt();
	}
	if (json['provinceName'] != null) {
		data.provinceName = json['provinceName'].toString();
	}
	if (json['curedNum'] != null) {
		data.curedNum = json['curedNum'] is String
				? int.tryParse(json['curedNum'])
				: json['curedNum'].toInt();
	}
	if (json['statisticsData'] != null) {
		data.statisticsData = json['statisticsData'].toString();
	}
	if (json['dangerAreas'] != null) {
		data.dangerAreas = new List<TodayEpidemicDataShowapiResBodyTodayDetailListDangerArea>();
		(json['dangerAreas'] as List).forEach((v) {
			data.dangerAreas.add(new TodayEpidemicDataShowapiResBodyTodayDetailListDangerArea().fromJson(v));
		});
	}
	if (json['confirmedNum'] != null) {
		data.confirmedNum = json['confirmedNum'] is String
				? int.tryParse(json['confirmedNum'])
				: json['confirmedNum'].toInt();
	}
	if (json['midDangerNum'] != null) {
		data.midDangerNum = json['midDangerNum'] is String
				? int.tryParse(json['midDangerNum'])
				: json['midDangerNum'].toInt();
	}
	if (json['currentConfirmedNum'] != null) {
		data.currentConfirmedNum = json['currentConfirmedNum'] is String
				? int.tryParse(json['currentConfirmedNum'])
				: json['currentConfirmedNum'].toInt();
	}
	return data;
}

Map<String, dynamic> todayEpidemicDataShowapiResBodyTodayDetailListToJson(TodayEpidemicDataShowapiResBodyTodayDetailList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.cityList != null) {
		data['cityList'] =  entity.cityList.map((v) => v.toJson()).toList();
	}
	data['highDangerNum'] = entity.highDangerNum;
	data['locationId'] = entity.locationId;
	data['suspectedNum'] = entity.suspectedNum;
	data['deadNum'] = entity.deadNum;
	data['provinceName'] = entity.provinceName;
	data['curedNum'] = entity.curedNum;
	data['statisticsData'] = entity.statisticsData;
	if (entity.dangerAreas != null) {
		data['dangerAreas'] =  entity.dangerAreas.map((v) => v.toJson()).toList();
	}
	data['confirmedNum'] = entity.confirmedNum;
	data['midDangerNum'] = entity.midDangerNum;
	data['currentConfirmedNum'] = entity.currentConfirmedNum;
	return data;
}

todayEpidemicDataShowapiResBodyTodayDetailListCityListFromJson(TodayEpidemicDataShowapiResBodyTodayDetailListCityList data, Map<String, dynamic> json) {
	if (json['highDangerNum'] != null) {
		data.highDangerNum = json['highDangerNum'] is String
				? int.tryParse(json['highDangerNum'])
				: json['highDangerNum'].toInt();
	}
	if (json['cityName'] != null) {
		data.cityName = json['cityName'].toString();
	}
	if (json['locationId'] != null) {
		data.locationId = json['locationId'] is String
				? int.tryParse(json['locationId'])
				: json['locationId'].toInt();
	}
	if (json['suspectedNum'] != null) {
		data.suspectedNum = json['suspectedNum'] is String
				? int.tryParse(json['suspectedNum'])
				: json['suspectedNum'].toInt();
	}
	if (json['deadNum'] != null) {
		data.deadNum = json['deadNum'] is String
				? int.tryParse(json['deadNum'])
				: json['deadNum'].toInt();
	}
	if (json['curedNum'] != null) {
		data.curedNum = json['curedNum'] is String
				? int.tryParse(json['curedNum'])
				: json['curedNum'].toInt();
	}
	if (json['confirmedNum'] != null) {
		data.confirmedNum = json['confirmedNum'] is String
				? int.tryParse(json['confirmedNum'])
				: json['confirmedNum'].toInt();
	}
	if (json['midDangerNum'] != null) {
		data.midDangerNum = json['midDangerNum'] is String
				? int.tryParse(json['midDangerNum'])
				: json['midDangerNum'].toInt();
	}
	if (json['currentConfirmedNum'] != null) {
		data.currentConfirmedNum = json['currentConfirmedNum'] is String
				? int.tryParse(json['currentConfirmedNum'])
				: json['currentConfirmedNum'].toInt();
	}
	return data;
}

Map<String, dynamic> todayEpidemicDataShowapiResBodyTodayDetailListCityListToJson(TodayEpidemicDataShowapiResBodyTodayDetailListCityList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['highDangerNum'] = entity.highDangerNum;
	data['cityName'] = entity.cityName;
	data['locationId'] = entity.locationId;
	data['suspectedNum'] = entity.suspectedNum;
	data['deadNum'] = entity.deadNum;
	data['curedNum'] = entity.curedNum;
	data['confirmedNum'] = entity.confirmedNum;
	data['midDangerNum'] = entity.midDangerNum;
	data['currentConfirmedNum'] = entity.currentConfirmedNum;
	return data;
}

todayEpidemicDataShowapiResBodyTodayDetailListDangerAreaFromJson(TodayEpidemicDataShowapiResBodyTodayDetailListDangerArea data, Map<String, dynamic> json) {
	if (json['areaName'] != null) {
		data.areaName = json['areaName'].toString();
	}
	if (json['cityName'] != null) {
		data.cityName = json['cityName'].toString();
	}
	if (json['dangerLevel'] != null) {
		data.dangerLevel = json['dangerLevel'] is String
				? int.tryParse(json['dangerLevel'])
				: json['dangerLevel'].toInt();
	}
	return data;
}

Map<String, dynamic> todayEpidemicDataShowapiResBodyTodayDetailListDangerAreaToJson(TodayEpidemicDataShowapiResBodyTodayDetailListDangerArea entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['areaName'] = entity.areaName;
	data['cityName'] = entity.cityName;
	data['dangerLevel'] = entity.dangerLevel;
	return data;
}

todayEpidemicDataShowapiResBodyTodayStaticticFromJson(TodayEpidemicDataShowapiResBodyTodayStatictic data, Map<String, dynamic> json) {
	if (json['suspectedIncr'] != null) {
		data.suspectedIncr = json['suspectedIncr'] is String
				? int.tryParse(json['suspectedIncr'])
				: json['suspectedIncr'].toInt();
	}
	if (json['confirmedIncr'] != null) {
		data.confirmedIncr = json['confirmedIncr'] is String
				? int.tryParse(json['confirmedIncr'])
				: json['confirmedIncr'].toInt();
	}
	if (json['curedIncr'] != null) {
		data.curedIncr = json['curedIncr'] is String
				? int.tryParse(json['curedIncr'])
				: json['curedIncr'].toInt();
	}
	if (json['deadIncr'] != null) {
		data.deadIncr = json['deadIncr'] is String
				? int.tryParse(json['deadIncr'])
				: json['deadIncr'].toInt();
	}
	if (json['seriousIncr'] != null) {
		data.seriousIncr = json['seriousIncr'] is String
				? int.tryParse(json['seriousIncr'])
				: json['seriousIncr'].toInt();
	}
	if (json['externalConfirmedIncr'] != null) {
		data.externalConfirmedIncr = json['externalConfirmedIncr'] is String
				? int.tryParse(json['externalConfirmedIncr'])
				: json['externalConfirmedIncr'].toInt();
	}
	if (json['asymptomaticIncr'] != null) {
		data.asymptomaticIncr = json['asymptomaticIncr'] is String
				? int.tryParse(json['asymptomaticIncr'])
				: json['asymptomaticIncr'].toInt();
	}
	if (json['suspectedNum'] != null) {
		data.suspectedNum = json['suspectedNum'] is String
				? int.tryParse(json['suspectedNum'])
				: json['suspectedNum'].toInt();
	}
	if (json['curedNum'] != null) {
		data.curedNum = json['curedNum'] is String
				? int.tryParse(json['curedNum'])
				: json['curedNum'].toInt();
	}
	if (json['deadNum'] != null) {
		data.deadNum = json['deadNum'] is String
				? int.tryParse(json['deadNum'])
				: json['deadNum'].toInt();
	}
	if (json['seriousNum'] != null) {
		data.seriousNum = json['seriousNum'] is String
				? int.tryParse(json['seriousNum'])
				: json['seriousNum'].toInt();
	}
	if (json['confirmedNum'] != null) {
		data.confirmedNum = json['confirmedNum'] is String
				? int.tryParse(json['confirmedNum'])
				: json['confirmedNum'].toInt();
	}
	if (json['externalConfirmedNum'] != null) {
		data.externalConfirmedNum = json['externalConfirmedNum'] is String
				? int.tryParse(json['externalConfirmedNum'])
				: json['externalConfirmedNum'].toInt();
	}
	if (json['asymptomaticNum'] != null) {
		data.asymptomaticNum = json['asymptomaticNum'] is String
				? int.tryParse(json['asymptomaticNum'])
				: json['asymptomaticNum'].toInt();
	}
	return data;
}

Map<String, dynamic> todayEpidemicDataShowapiResBodyTodayStaticticToJson(TodayEpidemicDataShowapiResBodyTodayStatictic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['suspectedIncr'] = entity.suspectedIncr;
	data['confirmedIncr'] = entity.confirmedIncr;
	data['curedIncr'] = entity.curedIncr;
	data['deadIncr'] = entity.deadIncr;
	data['seriousIncr'] = entity.seriousIncr;
	data['externalConfirmedIncr'] = entity.externalConfirmedIncr;
	data['asymptomaticIncr'] = entity.asymptomaticIncr;
	data['suspectedNum'] = entity.suspectedNum;
	data['curedNum'] = entity.curedNum;
	data['deadNum'] = entity.deadNum;
	data['seriousNum'] = entity.seriousNum;
	data['confirmedNum'] = entity.confirmedNum;
	data['externalConfirmedNum'] = entity.externalConfirmedNum;
	data['asymptomaticNum'] = entity.asymptomaticNum;
	return data;
}