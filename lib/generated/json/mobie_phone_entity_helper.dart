import 'package:alice/model/mobie_phone_entity.dart';

mobiePhoneEntityFromJson(MobiePhoneEntity data, Map<String, dynamic> json) {
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
		data.result = new MobiePhoneResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> mobiePhoneEntityToJson(MobiePhoneEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

mobiePhoneResultFromJson(MobiePhoneResult data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['result'] != null) {
		data.result = new MobiePhoneResultResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> mobiePhoneResultToJson(MobiePhoneResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

mobiePhoneResultResultFromJson(MobiePhoneResultResult data, Map<String, dynamic> json) {
	if (json['shouji'] != null) {
		data.shouji = json['shouji']?.toString();
	}
	if (json['province'] != null) {
		data.province = json['province']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['company'] != null) {
		data.company = json['company']?.toString();
	}
	if (json['cardtype'] != null) {
		data.cardtype = json['cardtype']?.toString();
	}
	if (json['areacode'] != null) {
		data.areacode = json['areacode']?.toString();
	}
	return data;
}

Map<String, dynamic> mobiePhoneResultResultToJson(MobiePhoneResultResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['shouji'] = entity.shouji;
	data['province'] = entity.province;
	data['city'] = entity.city;
	data['company'] = entity.company;
	data['cardtype'] = entity.cardtype;
	data['areacode'] = entity.areacode;
	return data;
}