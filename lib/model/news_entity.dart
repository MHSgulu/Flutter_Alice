import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class NewsEntity with JsonConvert<NewsEntity> {
	String code;
	bool charge;
	String msg;
	NewsResult result;
}

class NewsResult with JsonConvert<NewsResult> {
	int status;
	String msg;
	NewsResultResult result;
}

class NewsResultResult with JsonConvert<NewsResultResult> {
	String channel;
	int num;
	@JSONField(name: "list")
	List<NewsResultResultList> xList;
}

class NewsResultResultList with JsonConvert<NewsResultResultList> {
	String title;
	String time;
	String src;
	String category;
	String pic;
	String content;
	String url;
	String weburl;
}
