import 'package:alice/model/article_entity.dart';

articleEntityFromJson(ArticleEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new ArticleData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> articleEntityToJson(ArticleEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

articleDataFromJson(ArticleData data, Map<String, dynamic> json) {
	if (json['date'] != null) {
		data.date = new ArticleDataDate().fromJson(json['date']);
	}
	if (json['author'] != null) {
		data.author = json['author'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['digest'] != null) {
		data.digest = json['digest'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['wc'] != null) {
		data.wc = json['wc'] is String
				? int.tryParse(json['wc'])
				: json['wc'].toInt();
	}
	return data;
}

Map<String, dynamic> articleDataToJson(ArticleData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.date != null) {
		data['date'] = entity.date.toJson();
	}
	data['author'] = entity.author;
	data['title'] = entity.title;
	data['digest'] = entity.digest;
	data['content'] = entity.content;
	data['wc'] = entity.wc;
	return data;
}

articleDataDateFromJson(ArticleDataDate data, Map<String, dynamic> json) {
	if (json['curr'] != null) {
		data.curr = json['curr'].toString();
	}
	if (json['prev'] != null) {
		data.prev = json['prev'].toString();
	}
	if (json['next'] != null) {
		data.next = json['next'].toString();
	}
	return data;
}

Map<String, dynamic> articleDataDateToJson(ArticleDataDate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['curr'] = entity.curr;
	data['prev'] = entity.prev;
	data['next'] = entity.next;
	return data;
}