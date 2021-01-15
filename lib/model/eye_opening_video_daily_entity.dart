import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class EyeOpeningVideoDailyEntity with JsonConvert<EyeOpeningVideoDailyEntity> {
	List<EyeOpeningVideoDailyItemList> itemList;
	int count;
	int total;
	String nextPageUrl;
	bool adExist;
	int date;
	int nextPublishTime;
	dynamic dialog;
	dynamic topIssue;
	int refreshCount;
	int lastStartId;
}

class EyeOpeningVideoDailyItemList with JsonConvert<EyeOpeningVideoDailyItemList> {
	String type;
	EyeOpeningVideoDailyItemListData data;
	dynamic trackingData;
	String tag;
	int id;
	int adIndex;
}

class EyeOpeningVideoDailyItemListData with JsonConvert<EyeOpeningVideoDailyItemListData> {
	String dataType;
	int id;
	String title;
	String description;
	@JSONField(name: "library")
	String xLibrary;
	List<EyeOpeningVideoDailyItemListDataTag> tags;
	EyeOpeningVideoDailyItemListDataConsumption consumption;
	String resourceType;
	dynamic slogan;
	EyeOpeningVideoDailyItemListDataProvider provider;
	String category;
	EyeOpeningVideoDailyItemListDataAuthor author;
	EyeOpeningVideoDailyItemListDataCover cover;
	String playUrl;
	dynamic thumbPlayUrl;
	int duration;
	EyeOpeningVideoDailyItemListDataWebUrl webUrl;
	int releaseTime;
	List<dynamic> playInfo;
	dynamic campaign;
	dynamic waterMarks;
	bool ad;
	List<dynamic> adTrack;
	String type;
	String titlePgc;
	String descriptionPgc;
	String remark;
	bool ifLimitVideo;
	int searchWeight;
	dynamic brandWebsiteInfo;
	EyeOpeningVideoDailyItemListDataVideoPosterBean videoPosterBean;
	int idx;
	dynamic shareAdTrack;
	dynamic favoriteAdTrack;
	dynamic webAdTrack;
	int date;
	dynamic promotion;
	dynamic label;
	List<dynamic> labelList;
	String descriptionEditor;
	bool collected;
	bool reallyCollected;
	bool played;
	List<dynamic> subtitles;
	dynamic lastViewTime;
	dynamic playlists;
	dynamic src;
	dynamic recallSource;
	@JSONField(name: "recall_source")
	dynamic recallsource;
}

class EyeOpeningVideoDailyItemListDataTag with JsonConvert<EyeOpeningVideoDailyItemListDataTag> {
	int id;
	String name;
	String actionUrl;
	dynamic adTrack;
	String desc;
	String bgPicture;
	String headerImage;
	String tagRecType;
	dynamic childTagList;
	dynamic childTagIdList;
	bool haveReward;
	bool ifNewest;
	dynamic newestEndTime;
	int communityIndex;
}

class EyeOpeningVideoDailyItemListDataConsumption with JsonConvert<EyeOpeningVideoDailyItemListDataConsumption> {
	int collectionCount;
	int shareCount;
	int replyCount;
	int realCollectionCount;
}

class EyeOpeningVideoDailyItemListDataProvider with JsonConvert<EyeOpeningVideoDailyItemListDataProvider> {
	String name;
	String alias;
	String icon;
}

class EyeOpeningVideoDailyItemListDataAuthor with JsonConvert<EyeOpeningVideoDailyItemListDataAuthor> {
	int id;
	String icon;
	String name;
	String description;
	String link;
	int latestReleaseTime;
	int videoNum;
	dynamic adTrack;
	EyeOpeningVideoDailyItemListDataAuthorFollow follow;
	EyeOpeningVideoDailyItemListDataAuthorShield shield;
	int approvedNotReadyVideoCount;
	bool ifPgc;
	int recSort;
	bool expert;
}

class EyeOpeningVideoDailyItemListDataAuthorFollow with JsonConvert<EyeOpeningVideoDailyItemListDataAuthorFollow> {
	String itemType;
	int itemId;
	bool followed;
}

class EyeOpeningVideoDailyItemListDataAuthorShield with JsonConvert<EyeOpeningVideoDailyItemListDataAuthorShield> {
	String itemType;
	int itemId;
	bool shielded;
}

class EyeOpeningVideoDailyItemListDataCover with JsonConvert<EyeOpeningVideoDailyItemListDataCover> {
	String feed;
	String detail;
	String blurred;
	dynamic sharing;
	String homepage;
}

class EyeOpeningVideoDailyItemListDataWebUrl with JsonConvert<EyeOpeningVideoDailyItemListDataWebUrl> {
	String raw;
	String forWeibo;
}

class EyeOpeningVideoDailyItemListDataVideoPosterBean with JsonConvert<EyeOpeningVideoDailyItemListDataVideoPosterBean> {
	double scale;
	String url;
	String fileSizeStr;
}
