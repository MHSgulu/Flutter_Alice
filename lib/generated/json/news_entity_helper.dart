import 'package:alice/model/news_entity.dart';

newsEntityFromJson(NewsEntity data, Map<String, dynamic> json) {
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
		data.result = new NewsResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> newsEntityToJson(NewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

newsResultFromJson(NewsResult data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['result'] != null) {
		data.result = new NewsResultResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> newsResultToJson(NewsResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

newsResultResultFromJson(NewsResultResult data, Map<String, dynamic> json) {
	if (json['channel'] != null) {
		data.channel = json['channel']?.toString();
	}
	if (json['num'] != null) {
		data.num = json['num']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<NewsResultResultList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new NewsResultResultList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> newsResultResultToJson(NewsResultResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['channel'] = entity.channel;
	data['num'] = entity.num;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

newsResultResultListFromJson(NewsResultResultList data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toString();
	}
	if (json['src'] != null) {
		data.src = json['src']?.toString();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['weburl'] != null) {
		data.weburl = json['weburl']?.toString();
	}
	return data;
}

Map<String, dynamic> newsResultResultListToJson(NewsResultResultList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['time'] = entity.time;
	data['src'] = entity.src;
	data['category'] = entity.category;
	data['pic'] = entity.pic;
	data['content'] = entity.content;
	data['url'] = entity.url;
	data['weburl'] = entity.weburl;
	return data;
}