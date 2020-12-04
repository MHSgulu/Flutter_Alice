import 'package:alice/model/wallpaper_entity.dart';

wallpaperEntityFromJson(WallpaperEntity data, Map<String, dynamic> json) {
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['res'] != null) {
		data.res = new WallpaperRes().fromJson(json['res']);
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	return data;
}

Map<String, dynamic> wallpaperEntityToJson(WallpaperEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['msg'] = entity.msg;
	if (entity.res != null) {
		data['res'] = entity.res.toJson();
	}
	data['code'] = entity.code;
	return data;
}

wallpaperResFromJson(WallpaperRes data, Map<String, dynamic> json) {
	if (json['vertical'] != null) {
		data.vertical = new List<WallpaperResVertical>();
		(json['vertical'] as List).forEach((v) {
			data.vertical.add(new WallpaperResVertical().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> wallpaperResToJson(WallpaperRes entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.vertical != null) {
		data['vertical'] =  entity.vertical.map((v) => v.toJson()).toList();
	}
	return data;
}

wallpaperResVerticalFromJson(WallpaperResVertical data, Map<String, dynamic> json) {
	if (json['views'] != null) {
		data.views = json['views']?.toInt();
	}
	if (json['ncos'] != null) {
		data.ncos = json['ncos']?.toInt();
	}
	if (json['rank'] != null) {
		data.rank = json['rank']?.toInt();
	}
	if (json['source_type'] != null) {
		data.sourceType = json['source_type']?.toString();
	}
	if (json['tag'] != null) {
		data.tag = new List<dynamic>();
		data.tag.addAll(json['tag']);
	}
	if (json['wp'] != null) {
		data.wp = json['wp']?.toString();
	}
	if (json['xr'] != null) {
		data.xr = json['xr'];
	}
	if (json['cr'] != null) {
		data.cr = json['cr'];
	}
	if (json['favs'] != null) {
		data.favs = json['favs']?.toInt();
	}
	if (json['atime'] != null) {
		data.atime = json['atime']?.toDouble();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['thumb'] != null) {
		data.thumb = json['thumb']?.toString();
	}
	if (json['img'] != null) {
		data.img = json['img']?.toString();
	}
	if (json['cid'] != null) {
		data.cid = json['cid']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['url'] != null) {
		data.url = new List<dynamic>();
		data.url.addAll(json['url']);
	}
	if (json['rule'] != null) {
		data.rule = json['rule']?.toString();
	}
	if (json['preview'] != null) {
		data.preview = json['preview']?.toString();
	}
	if (json['store'] != null) {
		data.store = json['store']?.toString();
	}
	return data;
}

Map<String, dynamic> wallpaperResVerticalToJson(WallpaperResVertical entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['views'] = entity.views;
	data['ncos'] = entity.ncos;
	data['rank'] = entity.rank;
	data['source_type'] = entity.sourceType;
	if (entity.tag != null) {
		data['tag'] =  [];
	}
	data['wp'] = entity.wp;
	data['xr'] = entity.xr;
	data['cr'] = entity.cr;
	data['favs'] = entity.favs;
	data['atime'] = entity.atime;
	data['id'] = entity.id;
	data['desc'] = entity.desc;
	data['thumb'] = entity.thumb;
	data['img'] = entity.img;
	data['cid'] = entity.cid;
	if (entity.url != null) {
		data['url'] =  [];
	}
	data['rule'] = entity.rule;
	data['preview'] = entity.preview;
	data['store'] = entity.store;
	return data;
}