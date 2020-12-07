import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class BirdWallpaperCategoryEntity with JsonConvert<BirdWallpaperCategoryEntity> {
	String errno;
	String errmsg;
	String consume;
	String total;
	List<BirdWallpaperCategoryData> data;
}

class BirdWallpaperCategoryData with JsonConvert<BirdWallpaperCategoryData> {
	String id;
	String name;
	@JSONField(name: "order_num")
	String orderNum;
	String tag;
	@JSONField(name: "create_time")
	String createTime;
}
