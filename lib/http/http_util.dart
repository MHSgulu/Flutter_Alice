import 'package:alice/generated/json/quotation_entity_helper.dart';
import 'package:alice/model/quotation_entity.dart';
import 'package:alice/values/api.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpUtil{

  ///英文励志语录
  static Future<QuotationEntity> fetchQuotationList() async {
    final response = await http.get(Api.englishQuotation);
    if (response.statusCode == 200) {
      //如果服务器确实返回了200 OK响应,然后解析JSON
      return quotationEntityFromJson(QuotationEntity(),json.decode(response.body));
    } else {
      //如果服务器没有返回200 OK响应,然后抛出一个异常。
      throw Exception('服务器未响应成功');
    }
  }


}