import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class WallpaperEntity with JsonConvert<WallpaperEntity> {
	String msg;
	WallpaperRes res;
	int code;
}

class WallpaperRes with JsonConvert<WallpaperRes> {
	List<WallpaperResVertical> vertical;
}

class WallpaperResVertical with JsonConvert<WallpaperResVertical> {
	int views;
	int ncos;
	int rank;
	@JSONField(name: "source_type")
	String sourceType;
	List<dynamic> tag;
	String wp;
	bool xr;
	bool cr;
	int favs;
	double atime;
	String id;
	String desc;
	String thumb;
	String img;
	List<String> cid;
	List<dynamic> url;
	String rule;
	String preview;
	String store;
}
