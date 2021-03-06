import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class BirdWallpaperEntity with JsonConvert<BirdWallpaperEntity> {
	String errno;
	String errmsg;
	String consume;
	String total;
	List<BirdWallpaperData> data;
}

class BirdWallpaperData with JsonConvert<BirdWallpaperData> {
	String id;
	@JSONField(name: "class_id")
	String classId;
	String resolution;
	@JSONField(name: "url_mobile")
	String urlMobile;
	String url;
	@JSONField(name: "url_thumb")
	String urlThumb;
	@JSONField(name: "url_mid")
	String urlMid;
	@JSONField(name: "download_times")
	String downloadTimes;
	String imgcut;
	String tag;
	@JSONField(name: "create_time")
	String createTime;
	@JSONField(name: "update_time")
	String updateTime;
	@JSONField(name: "ad_id")
	String adId;
	@JSONField(name: "ad_img")
	String adImg;
	@JSONField(name: "ad_pos")
	String adPos;
	@JSONField(name: "ad_url")
	String adUrl;
	@JSONField(name: "ext_1")
	String ext1;
	@JSONField(name: "ext_2")
	String ext2;
	String utag;
	String tempdata;
	List<dynamic> rdata;
	@JSONField(name: "img_1600_900")
	String img1600900;
	@JSONField(name: "img_1440_900")
	String img1440900;
	@JSONField(name: "img_1366_768")
	String img1366768;
	@JSONField(name: "img_1280_800")
	String img1280800;
	@JSONField(name: "img_1280_1024")
	String img12801024;
	@JSONField(name: "img_1024_768")
	String img1024768;
}
