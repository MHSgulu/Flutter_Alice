import 'package:alice/common/const/api.dart';
import 'package:dio/dio.dart';


class DioUtil{

  static Dio _dio;
  static Dio _wwDio;
  static Dio _qykDio;
  static Dio _jdWxDio;
  static Dio _mTimeMovieDio;

  BaseOptions _sampleOptions;
  BaseOptions _wwOptions;
  BaseOptions _qykOptions;
  BaseOptions _jdWxOptions;
  BaseOptions _mTimeMovieOptions;

  factory DioUtil.getInstance() => _instance;

  static final _instance = DioUtil._init();

  DioUtil._init(){

    _dio = Dio();

    _sampleOptions = BaseOptions(
      method: 'get', ///Http方法。
      ///Http请求头。初始头的键将被转换为小写，
      ///例如，“内容类型”将转换为“内容类型”。
      ///当需要设置请求头时，应该使用小写作为密钥名。
      headers: Map<String, dynamic>(),
      baseUrl: Api.wanWeiBaseUrl, ///请求基url，它可以包含子路径，例如：“https://www.google.com/api/"
      connectTimeout: 6000, ///连接服务器超时时间，单位是毫秒.
      receiveTimeout: 5000, ///接收数据的最长时限.
      sendTimeout: 5000, ///发送数据的最长时限.
      ///请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: Headers.jsonContentType,
        /// [responseType] 表示期望以那种格式(方式)接受响应数据。
        /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`,'bytes'.
        ///
        /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
        /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
        ///
        /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,

    );

    ///万维易源 Api
    _wwOptions = BaseOptions(
      baseUrl: Api.wanWeiBaseUrl,
      connectTimeout: 6000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
    );
    _wwDio = Dio(_wwOptions);

    ///青云客 Api
    _qykOptions = BaseOptions(
      baseUrl: Api.qingYunKeBaseUrl,
      connectTimeout: 10000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
    );
    _qykDio = Dio(_qykOptions);

    ///京东万象 Api
    _jdWxOptions = BaseOptions(
      baseUrl: Api.jdWanXiangBaseUrl,
      connectTimeout: 6000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
    );
    _jdWxDio = Dio(_jdWxOptions);

    ///时光网 Api
    _mTimeMovieOptions = BaseOptions(
      baseUrl: Api.mTimeMovieBaseUrl,
      connectTimeout: 6000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
    );
    _mTimeMovieDio = Dio(_mTimeMovieOptions);

   /* _wwDio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async{
        print(options);
        return options;
      },
      onResponse: (Response response) async{
        print(response);
        return response;
      },
      onError: (DioError e) async{
        print(e);
        return e;
      },
    ));*/
    //_wwDio.interceptors.add(LogInterceptor(responseBody: false));

  }


  ///得到的dio实例 测试通过
  //var s1 = DioUtil.getInstance().createWwDio();
  //    var s2 = DioUtil.getInstance().createWwDio();
  //    ///检查两个引用是否指向同一对象。
  //    print(identical(s1, s2));  // true
  //    print(s1 == s2);           // true
  Dio createDio() {
    return _dio;
  }

  Dio createWwDio() {
    return _wwDio;
  }

  Dio createQykDio() {
    return _qykDio;
  }

  Dio createJdWxkDio() {
    return _jdWxDio;
  }

  Dio createTimeMovieDio() {
    return _mTimeMovieDio;
  }


}

class Singleton {

  static Dio _dio;

  Singleton._(){
    _dio = new Dio();
  }

  static final _instance = Singleton._();

  factory Singleton.getInstance() => _instance;

///以下测试成功
/*var s1 = Singleton.getInstance();
var s2 = Singleton.getInstance();
///检查两个引用是否指向同一对象。
print(identical(s1, s2));  // true
print(s1 == s2);*/

}

class Singleton1{

  /// 单例对象
  static Singleton1 _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  Singleton1._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory Singleton1.getInstance() =>  _getInstance();


  /// 获取单例内部方法
  static _getInstance(){
    // 只能有一个实例
    if(_instance == null){
      _instance = Singleton1._internal();
    }
    return _instance;
  }

}

class Singleton2{

  /// 单例对象
  static Singleton2 _instance;
  static Singleton2 get instance => _getInstance();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  Singleton2._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory Singleton2() =>_getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = Singleton2._internal();
    }
    return _instance;
  }






}




