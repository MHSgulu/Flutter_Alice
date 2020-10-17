import 'package:alice/generated/json/hot_word_type_entity_helper.dart';
import 'package:alice/generated/json/mtime_hot_movie_entity_helper.dart';
import 'package:alice/generated/json/quotation_entity_helper.dart';
import 'package:alice/generated/json/real_time_hotspot_entity_helper.dart';
import 'package:alice/http/dio_util.dart';
import 'package:alice/model/bingwallpaper.dart';
import 'package:alice/model/hot_word_type_entity.dart';
import 'package:alice/model/mtime_hot_movie_entity.dart';
import 'package:alice/model/quotation_entity.dart';
import 'package:alice/model/real_time_hotspot_entity.dart';
import 'package:alice/values/api.dart';
import 'package:alice/values/strings.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HttpUtil {

  ///英文励志语录
  static Future<QuotationEntity> fetchQuotationList() async {
    final response = await http.get(Api.englishQuotation);
    if (response.statusCode == 200) {
      //如果服务器确实返回了200 OK响应,然后解析JSON
      return quotationEntityFromJson(QuotationEntity(), json.decode(response.body));
    } else {
      //如果服务器没有返回200 OK响应,然后抛出一个异常。
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///热词排行
  static Future<RealTimeHotspotEntity> fetchHotNewsData(String id) async {
    final response = await http.get('${Api.jdWanXiangBaseUrl}${Api.hotWordList}?typeId=$id&appkey=${Util.jdWxApiKey}');
    if (response.statusCode == 200) {
      return realTimeHotspotEntityFromJson(RealTimeHotspotEntity(), json.decode(response.body));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///必应壁纸
  static Future<BingWallpaper> fetchBingWallpaper(int num) async {
    final response = await http.get('https://cn.bing.com/HPImageArchive.aspx?format=js&n=$num');
    if (response.statusCode == 200) {
      return BingWallpaper.fromJson(json.decode(response.body));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///热点词分类
  static Future<HotWordTypeEntity> fetchHotWordTypeData() async {
    Response response = await DioUtil.getInstance().createJdWxkDio().get(
      Api.hotWordType,
      queryParameters: {
        "appkey": Util.jdWxApiKey,
      },
    );
    if (response.statusCode == 200) {
      //print('数据点位： ${response.data}');
      return hotWordTypeEntityFromJson(HotWordTypeEntity(), jsonDecode(response.toString()));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///时光网API 正在热映
  static Future<MtimeHotMovieEntity> fetchTimeHotMovieData() async {
    Response response = await DioUtil.getInstance().createTimeMovieDio().get(
      Api.mTimeHotMovie,
      queryParameters: {
        "locationId": '290',
      },
    );
    if (response.statusCode == 200) {
      //print('数据点位： ${response.data}');
      return mtimeHotMovieEntityFromJson(MtimeHotMovieEntity(), jsonDecode(response.toString()));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

}