import 'package:alice/generated/json/base/json_convert_content.dart';

class MovieCrewEntity with JsonConvert<MovieCrewEntity> {
	List<MovieCrewType> types;
}

class MovieCrewType with JsonConvert<MovieCrewType> {
	String typeName;
	String typeNameEn;
	List<MovieCrewTypesPerson> persons;
}

class MovieCrewTypesPerson with JsonConvert<MovieCrewTypesPerson> {
	int id;
	String name;
	String nameEn;
	String image;
  String personate;
}
