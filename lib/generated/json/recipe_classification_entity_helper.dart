import 'package:alice/model/recipe_classification_entity.dart';

recipeClassificationEntityFromJson(RecipeClassificationEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['charge'] != null) {
		data.charge = json['charge'];
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['result'] != null) {
		data.result = new RecipeClassificationResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> recipeClassificationEntityToJson(RecipeClassificationEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['charge'] = entity.charge;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

recipeClassificationResultFromJson(RecipeClassificationResult data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['result'] != null) {
		data.result = <RecipeClassificationResultResult>[];
		(json['result'] as List).forEach((v) {
			data.result.add(new RecipeClassificationResultResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> recipeClassificationResultToJson(RecipeClassificationResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] =  entity.result.map((v) => v.toJson()).toList();
	}
	return data;
}

recipeClassificationResultResultFromJson(RecipeClassificationResultResult data, Map<String, dynamic> json) {
	if (json['classid'] != null) {
		data.classid = json['classid'] is String
				? int.tryParse(json['classid'])
				: json['classid'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['parentid'] != null) {
		data.parentid = json['parentid'] is String
				? int.tryParse(json['parentid'])
				: json['parentid'].toInt();
	}
	if (json['list'] != null) {
		data.xList = <RecipeClassificationResultResultList>[];
		(json['list'] as List).forEach((v) {
			data.xList.add(new RecipeClassificationResultResultList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> recipeClassificationResultResultToJson(RecipeClassificationResultResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['classid'] = entity.classid;
	data['name'] = entity.name;
	data['parentid'] = entity.parentid;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

recipeClassificationResultResultListFromJson(RecipeClassificationResultResultList data, Map<String, dynamic> json) {
	if (json['classid'] != null) {
		data.classid = json['classid'] is String
				? int.tryParse(json['classid'])
				: json['classid'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['parentid'] != null) {
		data.parentid = json['parentid'] is String
				? int.tryParse(json['parentid'])
				: json['parentid'].toInt();
	}
	return data;
}

Map<String, dynamic> recipeClassificationResultResultListToJson(RecipeClassificationResultResultList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['classid'] = entity.classid;
	data['name'] = entity.name;
	data['parentid'] = entity.parentid;
	return data;
}