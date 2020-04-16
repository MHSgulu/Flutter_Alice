import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_filed.dart';

class SearchNewsEntity with JsonConvert<SearchNewsEntity> {
	String code;
	bool charge;
	String msg;
	SearchNewsResult result;
}

class SearchNewsResult with JsonConvert<SearchNewsResult> {
	int status;
	String msg;
	SearchNewsResultResult result;
}

class SearchNewsResultResult with JsonConvert<SearchNewsResultResult> {
	String keyword;
	int num;
	@JSONField(name: "list")
	List<SearchNewsResultResultList> xList;
}

class SearchNewsResultResultList with JsonConvert<SearchNewsResultResultList> {
	String title;
	String time;
	String src;
	String url;
	String weburl;
	String content;
	String gallery;
	int addtime;
	String pic;
}
