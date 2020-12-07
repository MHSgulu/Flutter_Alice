import 'package:alice/model/bird_wallpaper_category_entity.dart';

birdWallpaperCategoryEntityFromJson(BirdWallpaperCategoryEntity data, Map<String, dynamic> json) {
	if (json['errno'] != null) {
		data.errno = json['errno']?.toString();
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	if (json['consume'] != null) {
		data.consume = json['consume']?.toString();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<BirdWallpaperCategoryData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new BirdWallpaperCategoryData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> birdWallpaperCategoryEntityToJson(BirdWallpaperCategoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errno'] = entity.errno;
	data['errmsg'] = entity.errmsg;
	data['consume'] = entity.consume;
	data['total'] = entity.total;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

birdWallpaperCategoryDataFromJson(BirdWallpaperCategoryData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['order_num'] != null) {
		data.orderNum = json['order_num']?.toString();
	}
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	if (json['create_time'] != null) {
		data.createTime = json['create_time']?.toString();
	}
	return data;
}

Map<String, dynamic> birdWallpaperCategoryDataToJson(BirdWallpaperCategoryData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['order_num'] = entity.orderNum;
	data['tag'] = entity.tag;
	data['create_time'] = entity.createTime;
	return data;
}