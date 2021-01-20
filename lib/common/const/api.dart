class Api {
  static final String wanWeiBaseUrl = 'https://route.showapi.com'; //万维易源 请求基址
  static final String jdWanXiangBaseUrl = 'https://way.jd.com'; //京东万象 请求基址
  static final String qingYunKeBaseUrl = 'http://api.qingyunke.com'; //青云客 请求基址
  static final String chatRobot = '/api.php'; //青云客 请求基址尾部
  static final String mTimeMovieBaseUrl = 'https://api-m.mtime.cn'; //时光网 请求基址
  static final String eyeOpenVideoBaseUrl = 'http://baobab.kaiyanapp.com'; //开眼视频 请求基址

  //万维易源
  static final String englishQuotation = 'https://route.showapi.com/1211-1?showapi_appid=136754&showapi_sign=4b0c074ea24f4360a5f21905acab9b81&count=10'; //查询英文励志语录
  static final String taoModelStyle = '/126-1'; //查询淘女郎模特风格
  static final String taoModelList = '/126-2'; //根据风格查询淘女郎模特列表

  static final String todayCOVID_19Data = '/2217-2'; //今日疫情明细

  //京东万象
  static final String hotEventsRank = 'https://way.jd.com/showapi/rcInfo?typeId=1&appkey=bd1ee420d53dcd93f21d338cd6bebba3'; //京东万象  实时热点排行
  static final String hotWordType = '/showapi/rdType'; //热点词分类
  static final String hotWordList = '/showapi/rcInfo'; //热点词排行
  static final String newsList = '/jisuapi/get'; //按照频道名称获取新闻列表
  static final String gifPicture = '/showapi/dtgxt'; //笑话大全-动态图
  static final String staticPicture = '/showapi/tpxh'; //笑话大全-图片笑话
  static final String textJoke = '/showapi/wbxh'; //笑话大全-文本笑话
  static final String garbageTextSearch = '/JDAI/garbageTextSearch'; //文本垃圾分类识别

  //时光网 API
  static final String mTimeHotMovie = '/Showtime/LocationMovies.api'; //正在热映

  //开眼视频 API
  static final String videoDaily = '/api/v4/tabs/selected'; //日报

  //必应壁纸
  static final String bingWallPaper = 'https://cn.bing.com/HPImageArchive.aspx?format=js&n=1';

  //每日一文  https://meiriyiwen.com/
  static final String todayArticle = 'https://interface.meiriyiwen.com/article/today?dev=1'; //每日一文
  static final String randomArticle = 'https://interface.meiriyiwen.com/article/random?dev=1'; //随机一文

  //壁纸
  static final String phoneWallpaperCategory = 'http://service.picasso.adesk.com/v1/vertical/category'; //获取手机壁纸类别
  static final String computerWallpaperCategory = 'http://cdn.apc.360.cn/index.php?c=WallPaper&a=getAllCategoriesV2&from=360chrome'; //获取电脑壁纸类别(小鸟壁纸)
  static final String phoneWallpaperList = 'http://service.picasso.adesk.com/v1/vertical/category/'; //根据类别获取手机壁纸
  static final String computerWallpaperList = 'http://wallpaper.apc.360.cn/index.php?c=WallPaper&a=getAppsByCategory'; //根据类别获取电脑壁纸

}
