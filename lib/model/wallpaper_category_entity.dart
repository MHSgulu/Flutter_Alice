import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class WallpaperCategoryEntity with JsonConvert<WallpaperCategoryEntity> {
	String msg;
	WallpaperCategoryRes res;
	int code;
}

class WallpaperCategoryRes with JsonConvert<WallpaperCategoryRes> {
	List<WallpaperCategoryResCategory> category;
}

class WallpaperCategoryResCategory with JsonConvert<WallpaperCategoryResCategory> {
	int count;
	String ename;
	String rname;
	@JSONField(name: "cover_temp")
	String coverTemp;
	String name;
	String cover;
	int rank;
	List<dynamic> filter;
	int sn;
	String icover;
	double atime;
	int type;
	String id;
	@JSONField(name: "picasso_cover")
	String picassoCover;
}
