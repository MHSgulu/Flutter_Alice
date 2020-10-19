import 'package:alice/model/search_news_entity.dart';

searchNewsEntityFromJson(SearchNewsEntity data, Map<String, dynamic> json) {
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
		data.result = new SearchNewsResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> searchNewsEntityToJson(SearchNewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

searchNewsResultFromJson(SearchNewsResult data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['result'] != null) {
		data.result = new SearchNewsResultResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> searchNewsResultToJson(SearchNewsResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

searchNewsResultResultFromJson(SearchNewsResultResult data, Map<String, dynamic> json) {
	if (json['keyword'] != null) {
		data.keyword = json['keyword']?.toString();
	}
	if (json['num'] != null) {
		data.num = json['num']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<SearchNewsResultResultList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new SearchNewsResultResultList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> searchNewsResultResultToJson(SearchNewsResultResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['keyword'] = entity.keyword;
	data['num'] = entity.num;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

searchNewsResultResultListFromJson(SearchNewsResultResultList data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toString();
	}
	if (json['src'] != null) {
		data.src = json['src']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['weburl'] != null) {
		data.weburl = json['weburl']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['gallery'] != null) {
		data.gallery = json['gallery']?.toString();
	}
	if (json['addtime'] != null) {
		data.addtime = json['addtime']?.toInt();
	}
	if (json['pic'] != null) {
		data.pic = json['pic']?.toString();
	}
	return data;
}

Map<String, dynamic> searchNewsResultResultListToJson(SearchNewsResultResultList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['time'] = entity.time;
	data['src'] = entity.src;
	data['url'] = entity.url;
	data['weburl'] = entity.weburl;
	data['content'] = entity.content;
	data['gallery'] = entity.gallery;
	data['addtime'] = entity.addtime;
	data['pic'] = entity.pic;
	return data;
}