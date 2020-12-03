import 'package:alice/generated/json/base/json_convert_content.dart';

class ArticleEntity with JsonConvert<ArticleEntity> {
	ArticleData data;
}

class ArticleData with JsonConvert<ArticleData> {
	ArticleDataDate date;
	String author;
	String title;
	String digest;
	String content;
	int wc;
}

class ArticleDataDate with JsonConvert<ArticleDataDate> {
	String curr;
	String prev;
	String next;
}
