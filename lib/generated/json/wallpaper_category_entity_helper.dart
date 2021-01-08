import 'package:alice/model/wallpaper_category_entity.dart';

wallpaperCategoryEntityFromJson(WallpaperCategoryEntity data, Map<String, dynamic> json) {
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['res'] != null) {
		data.res = new WallpaperCategoryRes().fromJson(json['res']);
	}
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	return data;
}

Map<String, dynamic> wallpaperCategoryEntityToJson(WallpaperCategoryEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['msg'] = entity.msg;
	if (entity.res != null) {
		data['res'] = entity.res.toJson();
	}
	data['code'] = entity.code;
	return data;
}

wallpaperCategoryResFromJson(WallpaperCategoryRes data, Map<String, dynamic> json) {
	if (json['category'] != null) {
		data.category = new List<WallpaperCategoryResCategory>();
		(json['category'] as List).forEach((v) {
			data.category.add(new WallpaperCategoryResCategory().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> wallpaperCategoryResToJson(WallpaperCategoryRes entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.category != null) {
		data['category'] =  entity.category.map((v) => v.toJson()).toList();
	}
	return data;
}

wallpaperCategoryResCategoryFromJson(WallpaperCategoryResCategory data, Map<String, dynamic> json) {
	if (json['count'] != null) {
		data.count = json['count'] is String
				? int.tryParse(json['count'])
				: json['count'].toInt();
	}
	if (json['ename'] != null) {
		data.ename = json['ename'].toString();
	}
	if (json['rname'] != null) {
		data.rname = json['rname'].toString();
	}
	if (json['cover_temp'] != null) {
		data.coverTemp = json['cover_temp'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover'].toString();
	}
	if (json['rank'] != null) {
		data.rank = json['rank'] is String
				? int.tryParse(json['rank'])
				: json['rank'].toInt();
	}
	if (json['filter'] != null) {
		data.filter = new List<dynamic>();
		data.filter.addAll(json['filter']);
	}
	if (json['sn'] != null) {
		data.sn = json['sn'] is String
				? int.tryParse(json['sn'])
				: json['sn'].toInt();
	}
	if (json['icover'] != null) {
		data.icover = json['icover'].toString();
	}
	if (json['atime'] != null) {
		data.atime = json['atime'] is String
				? double.tryParse(json['atime'])
				: json['atime'].toDouble();
	}
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['picasso_cover'] != null) {
		data.picassoCover = json['picasso_cover'].toString();
	}
	return data;
}

Map<String, dynamic> wallpaperCategoryResCategoryToJson(WallpaperCategoryResCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['count'] = entity.count;
	data['ename'] = entity.ename;
	data['rname'] = entity.rname;
	data['cover_temp'] = entity.coverTemp;
	data['name'] = entity.name;
	data['cover'] = entity.cover;
	data['rank'] = entity.rank;
	if (entity.filter != null) {
		data['filter'] =  [];
	}
	data['sn'] = entity.sn;
	data['icover'] = entity.icover;
	data['atime'] = entity.atime;
	data['type'] = entity.type;
	data['id'] = entity.id;
	data['picasso_cover'] = entity.picassoCover;
	return data;
}