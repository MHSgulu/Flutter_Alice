import 'package:alice/common/const/api.dart';
import 'package:alice/common/const/strings.dart';
import 'package:alice/generated/json/article_entity_helper.dart';
import 'package:alice/generated/json/bird_wallpaper_category_entity_helper.dart';
import 'package:alice/generated/json/bird_wallpaper_entity_helper.dart';
import 'package:alice/generated/json/eye_opening_video_daily_entity_helper.dart';
import 'package:alice/generated/json/gif_picture_jokes_entity_helper.dart';
import 'package:alice/generated/json/hot_movie_entity_helper.dart';
import 'package:alice/generated/json/hot_word_type_entity_helper.dart';
import 'package:alice/generated/json/mobie_phone_entity_helper.dart';
import 'package:alice/generated/json/news_entity_helper.dart';
import 'package:alice/generated/json/picture_joke_entity_helper.dart';
import 'package:alice/generated/json/quotation_entity_helper.dart';
import 'package:alice/generated/json/real_time_hotspot_entity_helper.dart';
import 'package:alice/generated/json/wallpaper_category_entity_helper.dart';
import 'package:alice/generated/json/wallpaper_entity_helper.dart';
import 'package:alice/generated/json/written_jokes_entity_helper.dart';
import 'package:alice/model/article_entity.dart';
import 'package:alice/model/bingwallpaper.dart';
import 'package:alice/model/bird_wallpaper_category_entity.dart';
import 'package:alice/model/bird_wallpaper_entity.dart';
import 'package:alice/model/eye_opening_video_daily_entity.dart';
import 'package:alice/model/gif_picture_jokes_entity.dart';
import 'package:alice/model/hot_movie_entity.dart';
import 'package:alice/model/hot_word_type_entity.dart';
import 'package:alice/model/mobie_phone_entity.dart';
import 'package:alice/model/news_entity.dart';
import 'package:alice/model/picture_joke_entity.dart';
import 'package:alice/model/quotation_entity.dart';
import 'package:alice/model/real_time_hotspot_entity.dart';
import 'package:alice/model/wallpaper_category_entity.dart';
import 'package:alice/model/wallpaper_entity.dart';
import 'package:alice/model/written_jokes_entity.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dio_util.dart';


class HttpUtil {

  ///async用来表示函数是异步的，定义的函数会返回一个Future对象，可以使用then方法添加回调函数。
  ///await 后面是一个Future，表示等待该异步任务完成，异步完成后才会往下走；await必须出现在 async 函数内部。
  ///通过async/await将一个异步流用同步的代码表示出来
  ///其实，无论是在JavaScript还是Dart中，async/await都只是一个语法糖，编译器或解释器最终都会将其转化为一个Promise（Future）的调用链。
  ///
  ///async/await

  /// 解析字符串并返回生成的Json对象。
  /// 对于在解码过程中已解析的每个对象或列表属性，都会调用一次可选的[reviver]函数。
  /// key参数是list属性的整数列表索引，是对象属性的字符串映射键，或者是最终结果的null。
  /// 默认的[reviver]（未提供）是身份功能。
  /// json.decode的简写。 如果局部变量遮盖了全局[json]常量，则很有用。
  ///
  ///jsonDecode


  /// 解析字符串并返回生成的Json对象。
  /// 对于在解码过程中已解析的每个对象或列表属性，都会调用一次可选的[reviver]函数。
  /// key参数是list属性的整数列表索引，是对象属性的字符串映射键，或者是最终结果的null。
  /// 默认的[reviver]（未提供）是身份功能。
  ///
  ///json.decode

  ///查询手机号码归属地
  static Future<MobiePhoneEntity> query(String phone) async {
    final http.Response response = await http.post(
      'https://way.jd.com/jisuapi/query4?shouji=${phone}&appkey=bd1ee420d53dcd93f21d338cd6bebba3',
    );
    print('数据点位: response: $response'); ////内容无法打印 Instance of 'Response'
    print('数据点位: response.toString(): ${response.toString()}'); //内容无法打印 Instance of 'Response'
    ///触发此响应的（冻结）请求。
    //POST https://way.jd.com/jisuapi/query4?shouji=17852275848&appkey=bd1ee420d53dcd93f21d338cd6bebba3
    print('数据点位: response.request: ${response.request}');
    //{connection: close, cache-control: max-age=0, date: Tue, 01 Dec 2020 01:30:42 GMT, content-length: 198, content-type: application/json;charset=utf-8, server: jfe, expires: Tue, 01 Dec 2020 01:30:42 GMT}
    print('数据点位: response.headers: ${response.headers}');
    ///响应的主体为字符串。
    //{"code":"10000","charge":false,"msg":"查询成功","result":{"status":0,"msg":"ok","result":{"shouji":"17852275848","province":"山东","city":"临沂","company":"中国移动","areacode":"0539"}}}
    print('数据点位: response.body: ${response.body}');
    ///组成此响应正文的字节。
    //[123, 34, 99, 111, 100, 101, 34, 58, 34, 49, 48, 48, 48, 48, 34, 44, 34, 99, 104, 97, 114, 103, 101, 34, 58, 102, 97, 108, 115, 101, 44, 34, 109, 115, 103, 34, 58, 34, 230, 159, 165, 232, 175, 162, 230, 136, 144, 229, 138, 159, 34, 44, 34, 114, 101, 115, 117, 108, 116, 34, 58, 123, 34, 115, 116, 97, 116, 117, 115, 34, 58, 48, 44, 34, 109, 115, 103, 34, 58, 34, 111, 107, 34, 44, 34, 114, 101, 115, 117, 108, 116, 34, 58, 123, 34, 115, 104, 111, 117, 106, 105, 34, 58, 34, 49, 55, 56, 53, 50, 50, 55, 53, 56, 52, 56, 34, 44, 34, 112, 114, 111, 118, 105, 110, 99, 101, 34, 58, 34, 229, 177, 177, 228, 184, 156, 34, 44, 34, 99, 105, 116, 121, 34, 58, 34, 228, 184, 180, 230, 178, 130, 34, 44, 34, 99, 111, 109, 112, 97, 110, 121, 34, 58, 34, 228, 184, 173, 229, 155, 189, 231, 167, 187, 229, 138, 168, 34, 44, 34, 97, 114, 101, 97, 99, 111, 100, 101, 34, 58, 34, 48, 53, 51, 57, 34, 125, 125, 125]
    print('数据点位: response.bodyBytes: ${response.bodyBytes}');
    ///响应主体的大小，以字节为单位。如果请求的大小事先未知，则为“ null”。
    //198
    print('数据点位: response.contentLength: ${response.contentLength}');
    ///是否重新导向
    //false
    print('数据点位: response.isRedirect: ${response.isRedirect}');
    ///服务器是否请求维护持久连接。
    //false
    print('数据点位: response.persistentConnection: ${response.persistentConnection}');
    ///与状态代码关联的原因短语。
    //OK
    print('数据点位: response.reasonPhrase: ${response.reasonPhrase}');
    ///对象的运行时类型的表示形式。
    //Response
    print('数据点位: response.runtimeType: ${response.runtimeType}');
    ///此对象的哈希码。
    //77805176
    print('数据点位: response.hashCode: ${response.hashCode}');
    ///此响应的HTTP状态代码。
    if (response.statusCode == 200) {
      return mobiePhoneEntityFromJson(MobiePhoneEntity(),json.decode(response.body));
    } else {
      throw Exception('服务器未响应成功');
    }
  }


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

  ///必应壁纸
  static Future<BingWallpaper> fetchBingWallpaper(int num) async {
    final response = await http.get('https://cn.bing.com/HPImageArchive.aspx?format=js&n=$num');
    if (response.statusCode == 200) {
      return BingWallpaper.fromJson(json.decode(response.body));
    } else {
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

  ///按照频道名称获取新闻列表
  static Future<NewsEntity> fetchNewsListData(String channelName) async {
    Response response = await DioUtil.getInstance().createJdWxkDio().get(
      Api.newsList,
      queryParameters: {
        'channel': channelName,
        'num': 40,
        'start': 0,
        "appkey": Util.jdWxApiKey,
      },
    );
    if (response.statusCode == 200) {
      //print('数据点位： ${response.data}');
      return newsEntityFromJson(NewsEntity(), jsonDecode(response.toString()));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }


  /// url：https://api-m.mtime.cn/Showtime/LocationMovies.api?locationId=?
  /// 示例 url：https://api-m.mtime.cn/Showtime/LocationMovies.api?locationId=292
  /// 时光网API 正在热映
  static Future<HotMovieEntity> fetchTimeHotMovieData() async {
    Response response = await DioUtil.getInstance().createTimeMovieDio().get(
      Api.mTimeHotMovie,
      queryParameters: {
        "locationId": '292', //上海
      },
    );
    if (response.statusCode == 200) {
      //print('数据点位： ${response.data}');
      return hotMovieEntityFromJson(HotMovieEntity(), jsonDecode(response.toString()));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///开眼视频API  首页日报
  static Future<EyeOpeningVideoDailyEntity> fetchEyeOpeningVideoDailyData() async {
    Response response = await DioUtil.getInstance().createEyeOpeningVideoDio().get(Api.videoDaily);
    if (response.statusCode == 200) {
      //print('数据点位： ${response.data}');
      return eyeOpeningVideoDailyEntityFromJson(EyeOpeningVideoDailyEntity(), jsonDecode(response.toString()));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///时光网API 电影详情
  /*static Future<MTMovieDetailEntity> fetchTimeMovieDetailData(String movieId) async {
    Response response = await DioUtil.getInstance().createTimeMovieDio().get(
      Api.mTimeMovieDetail,
      queryParameters: {
        "locationId": '290',
        "movieId": movieId,
      },
    );
    if (response.statusCode == 200) {
      //print('数据点位： ${response.data}');
      return mTMovieDetailEntityFromJson(MTMovieDetailEntity(), jsonDecode(response.toString()));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }*/

  ///时光网API 电影演职员
  /*static Future<MovieCrewEntity> fetchTimeMovieActorData(String movieId) async {
    Response response = await DioUtil.getInstance().createTimeMovieDio().get(
      Api.mTimeMovieActor,
      queryParameters: {
        "movieId": movieId,
      },
    );
    if (response.statusCode == 200) {
      //print('数据点位： ${response.data}');
      return movieCrewEntityFromJson(MovieCrewEntity(), jsonDecode(response.toString()));
    } else {
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }*/

  ///垃圾分类识别    似乎这个接口只能Post请求(文档也标注这个细节)
  ///https://wx.jdcloud.com/market/datas/30/13947
  static Future<dynamic> queryGarbageClassification(String keyWord) async {
    Response response = await DioUtil.getInstance().createJdWxkDio().post(
      Api.garbageTextSearch + '?appkey=' + Util.jdWxApiKey,
      data: {
        "cityId": 310000,
        "text": keyWord,
      },
    );
    //{"code":"10000","charge":false,"msg":"查询成功","result":{"code":"10000","charge":true,"remain":474,"remainTimes":474,"remainSeconds":-1,"msg":"查询成功,扣费","result":{"status":0,"message":"success","garbage_info":[{"cate_name":"湿垃圾","city_id":"310000","city_name":"上海市","confidence":1.0,"garbage_name":"剩菜","ps":"湿垃圾应从生产时就与其他品种垃圾分开收集。投放前尽量沥干水分，有外包装的应去除外包装投放"}]}}}
    print('数据点位: response: $response');
    //{"code":"10000","charge":false,"msg":"查询成功","result":{"code":"10000","charge":true,"remain":474,"remainTimes":474,"remainSeconds":-1,"msg":"查询成功,扣费","result":{"status":0,"message":"success","garbage_info":[{"cate_name":"湿垃圾","city_id":"310000","city_name":"上海市","confidence":1.0,"garbage_name":"剩菜","ps":"湿垃圾应从生产时就与其他品种垃圾分开收集。投放前尽量沥干水分，有外包装的应去除外包装投放"}]}}}
    print('数据点位: response.toString(): ${response.toString()}'); ///我们更关心“数据”字段。  //此方法已对response进行转String.
    //{code: 10000, charge: false, msg: 查询成功, result: {code: 10000, charge: true, remain: 474, remainTimes: 474, remainSeconds: -1, msg: 查询成功,扣费, result: {status: 0, message: success, garbage_info: [{cate_name: 湿垃圾, city_id: 310000, city_name: 上海市, confidence: 1.0, garbage_name: 剩菜, ps: 湿垃圾应从生产时就与其他品种垃圾分开收集。投放前尽量沥干水分，有外包装的应去除外包装投放}]}}}
    print('数据点位: response.data: ${response.data}'); ///响应体。 可能已转换，请参阅[ResponseType]。
    //connection: close
    //cache-control: max-age=0
    //date: Tue, 01 Dec 2020 01:52:36 GMT
    //content-length: 479
    //content-type: application/json;charset=utf-8
    //server: jfe
    //expires: Tue, 01 Dec 2020 01:52:37 GMT
    print('数据点位: response.headers: ${response.headers}'); ///响应头。
    //200
    print('数据点位: response.statusCode: ${response.statusCode}'); /// Http状态码。
    //OK
    print('数据点位: response.statusMessage: ${response.statusMessage}');  ///返回与状态码关联的原因短语。必须在写入正文之前设置原因短语。写入正文后设置原因短语。
    //{}
    print('数据点位: response.extra: ${response.extra}'); ///自定义字段，您以后可以在`then`中检索它。
    //[]
    print('数据点位: response.redirects: ${response.redirects}');///返回此连接已通过的一系列重定向。如果未遵循任何重定向，则该列表为空。在自动和手动重定向的情况下，[redirects]都会更新。**注意**：此字段是否可用取决于适配器的实现是否支持它。
    //false
    print('数据点位: response.isRedirect: ${response.isRedirect}'); ///此响应是否为重定向。**注意**：此字段是否可用取决于适配器的实现是否支持它。
    //Unhandled Exception: Bad state: No element
    //print('数据点位: response.realUri: ${response.realUri}'); ///返回最终的真实请求uri（也许重定向）。**注意**：此字段是否可用取决于适配器的实现是否支持它。
    if(response.statusCode == 200){
      return jsonDecode(response.toString());
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      //throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///笑话大全 动图
  ///https://wx.jdcloud.com/market/datas/5/10914
  ///改接口用get Http502次数颇多 改为post效果好
  static Future<GifPictureJokesEntity> requestGifPictureList(int page) async {
    Response response = await DioUtil.getInstance().createJdWxkDio().post(
      Api.gifPicture,
      queryParameters: {
        "page": page,
        "maxResult": 10,
        "appkey": Util.jdWxApiKey,
      },
    );
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return gifPictureJokesEntityFromJson(GifPictureJokesEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///笑话大全 图片笑话
  ///https://wx.jdcloud.com/market/api/10914
  static Future<PictureJokeEntity> requestStaticPictureList(int page) async {
    Response response = await DioUtil.getInstance().createJdWxkDio().post(
      Api.staticPicture,
      queryParameters: {
        //"time": '2015-07-10', //从该时间以来最新的笑话. 格式：yyyy-MM-dd
        "page": page, //第几页
        "maxResult": 10, //返回的最大结果集,用于分页
        "appkey": Util.jdWxApiKey,
      },
    );
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return pictureJokeEntityFromJson(PictureJokeEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }


  ///笑话大全 文本笑话
  ///https://wx.jdcloud.com/market/api/10914
  static Future<WrittenJokesEntity> requestTextJokeList(int page) async {
    Response response = await DioUtil.getInstance().createJdWxkDio().post(
      Api.textJoke,
      queryParameters: {
        //"time": '2015-07-10', //从该时间以来最新的笑话. 格式：yyyy-MM-dd
        "page": page, //第几页
        "maxResult": 20, //每页最大记录数。其值为1至50。
        "showapi_sign": Util.showApiSign,
        "appkey": Util.jdWxApiKey,
      },
    );
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return writtenJokesEntityFromJson(WrittenJokesEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///每日一文
  ///https://github.com/shichunlei/-Api/blob/master/OneArticle.md
  ///https://interface.meiriyiwen.com/article/today?dev=1
  static Future<ArticleEntity> requestArticleOfTheDay() async {
    Response response = await Dio().get(Api.todayArticle);
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return articleEntityFromJson(ArticleEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///随机一文
  ///https://interface.meiriyiwen.com/article/random?dev=1
  static Future<ArticleEntity> requestRandomArticle() async {
    Response response = await Dio().get(Api.randomArticle);
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return articleEntityFromJson(ArticleEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///特定某天一文
  ///url：https://interface.meiriyiwen.com/article/day?dev=1&date= + 日期
  ///url 示例：https://interface.meiriyiwen.com/article/day?dev=1&date=20170216
  static Future<ArticleEntity> requestArticleAccordingToTime() async {
    Response response = await Dio().get(Api.randomArticle);
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return articleEntityFromJson(ArticleEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///获取手机壁纸类别
  ///url：http://service.picasso.adesk.com/v1/vertical/category
  static Future<WallpaperCategoryEntity> requestPhoneWallpaperCategory() async {
    Response response = await Dio().get(Api.phoneWallpaperCategory);
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return wallpaperCategoryEntityFromJson(WallpaperCategoryEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///根据类别获取手机壁纸
  ///url：url：http://service.picasso.adesk.com/v1/vertical/category/ + 类别ID
  ///url 示例：http://service.picasso.adesk.com/v1/vertical/category/4e4d610cdf714d2966000003/vertical?limit=30&adult=false&first=1&order=new
  //拼接参数：
  // limit：返回数量
  // adult：布尔值，暂时未知
  // first：数字，如1
  // skip：略过数量
  // order：值 hot为favs， new
  static Future<WallpaperEntity> requestPhoneWallpaperList(String id,int num,String order) async {
    Response response = await Dio().get(
      Api.phoneWallpaperList + id + '/vertical?',
      queryParameters: {
        'limit': 10,
        'adult': false,
        'first': 1,
        'skip': num,
        'order': order,
      },
    );
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return wallpaperEntityFromJson(WallpaperEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///获取电脑壁纸类别
  ///url：http://cdn.apc.360.cn/index.php?c=WallPaper&a=getAllCategoriesV2
  ///url 示例：http://cdn.apc.360.cn/index.php?c=WallPaper&a=getAllCategoriesV2&from=360chrome
  static Future<BirdWallpaperCategoryEntity> requestComputerWallpaperCategory() async {
    Response response = await Dio().get(Api.computerWallpaperCategory);
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return birdWallpaperCategoryEntityFromJson(BirdWallpaperCategoryEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///根据类别获取电脑壁纸
  ///url：http://wallpaper.apc.360.cn/index.php?c=WallPaper&a=getAppsByCategory
  // 其他拼接参数：
  // cid：类别id,类别已知：
  // start：从第几幅图开始(用于分页)
  // count：返回的数量
  // from：固定值: 360chrome
  // url 示例：http://wallpaper.apc.360.cn/index.php?c=WallPaper&a=getAppsByCategory&cid=9&start=0&count=10&from=360chrome
  static Future<BirdWallpaperEntity> requestComputerWallpaperList(String id,int start) async {
    Response response = await Dio().get(
      Api.computerWallpaperList,
      queryParameters: {
        'cid': id,
        'start': start,
        'count': 10,
        'from': '360chrome',
      },
    );
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return birdWallpaperEntityFromJson(BirdWallpaperEntity(),json);
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
      throw Exception('服务器响应失败: statusCode: ${response.statusCode}');
    }
  }

  ///获取 智能聊天机器人 消息
  ///完整请求URL示例： http://api.qingyunke.com/api.php?key=free&appid=0&msg=你好
  ///返回结果中{br}表示换行，请自行替换成需要的代码。
  ///☆ 为保证接口稳定，调用频率请控制在200次/10分钟内，我们正在努力提供更稳定的服务
  static Future<dynamic> requestChatMessage(String msg) async {
    Response response = await DioUtil.getInstance().createQykDio().get(
      Api.chatRobot,
      queryParameters: {
        "key": 'free',
        "appid": 0,
        "msg": msg,
      },
    );
    print('数据点位: response: $response');
    if(response.statusCode == 200){
      var json = jsonDecode(response.toString());
      return json;
    }else{
      Fluttertoast.showToast(msg: '服务器响应失败: statusCode: ${response.statusCode}');
    }
  }



}