import 'package:alice/generated/json/base/json_convert_content.dart';
import 'package:alice/generated/json/base/json_field.dart';

class RecipeClassificationEntity with JsonConvert<RecipeClassificationEntity> {
	String code;
	bool charge;
	String msg;
	RecipeClassificationResult result;
}

class RecipeClassificationResult with JsonConvert<RecipeClassificationResult> {
	int status;
	String msg;
	List<RecipeClassificationResultResult> result;
}

class RecipeClassificationResultResult with JsonConvert<RecipeClassificationResultResult> {
	int classid;
	String name;
	int parentid;
	@JSONField(name: "list")
	List<RecipeClassificationResultResultList> xList;
}

class RecipeClassificationResultResultList with JsonConvert<RecipeClassificationResultResultList> {
	int classid;
	String name;
	int parentid;
}
