import 'package:alice/model/movie_crew_entity.dart';

movieCrewEntityFromJson(MovieCrewEntity data, Map<String, dynamic> json) {
	if (json['types'] != null) {
		data.types = new List<MovieCrewType>();
		(json['types'] as List).forEach((v) {
			data.types.add(new MovieCrewType().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> movieCrewEntityToJson(MovieCrewEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.types != null) {
		data['types'] =  entity.types.map((v) => v.toJson()).toList();
	}
	return data;
}

movieCrewTypeFromJson(MovieCrewType data, Map<String, dynamic> json) {
	if (json['typeName'] != null) {
		data.typeName = json['typeName'].toString();
	}
	if (json['typeNameEn'] != null) {
		data.typeNameEn = json['typeNameEn'].toString();
	}
	if (json['persons'] != null) {
		data.persons = new List<MovieCrewTypesPerson>();
		(json['persons'] as List).forEach((v) {
			data.persons.add(new MovieCrewTypesPerson().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> movieCrewTypeToJson(MovieCrewType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['typeName'] = entity.typeName;
	data['typeNameEn'] = entity.typeNameEn;
	if (entity.persons != null) {
		data['persons'] =  entity.persons.map((v) => v.toJson()).toList();
	}
	return data;
}

movieCrewTypesPersonFromJson(MovieCrewTypesPerson data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['nameEn'] != null) {
		data.nameEn = json['nameEn'].toString();
	}
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	if (json['personate'] != null) {
		data.personate = json['personate'].toString();
	}
	return data;
}

Map<String, dynamic> movieCrewTypesPersonToJson(MovieCrewTypesPerson entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['nameEn'] = entity.nameEn;
	data['image'] = entity.image;
	data['personate'] = entity.personate;
	return data;
}