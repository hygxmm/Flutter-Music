import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;
  CancelToken cancelToken = CancelToken();

  static HttpUtil getInstance() {
    if (instance == null) instance = HttpUtil();
    return instance;
  }

  HttpUtil() {
    options = BaseOptions(
      baseUrl: 'http://www.liuhuan.online:3000/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    dio = Dio(options)
      ..interceptors.add(CookieManager(CookieJar()))
      // ..interceptors.add(LogInterceptor())
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          return options;
        },
        onResponse: (Response response) {
          return response;
        },
        onError: (DioError e) {
          return e;
        },
      ));
  }

  get(String url, {Map<String, dynamic> data, options}) async {
    Response response;
    try {
      response = await dio.get(url, queryParameters: data, options: options);
    } on DioError catch (e) {
      print('请求失败======$e');
      formatError(e);
    }
    return response.data;
  }

  post(String url, {Map<String, dynamic> data, options}) async {
    Response response;
    try {
      response = await dio.post(url, data: data, options: options);
    } on DioError catch (e) {
      print('请求失败======$e');
      formatError(e);
    }
    return response.data;
  }

  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      print("请求取消");
    } else {
      print("未知错误");
    }
  }
}
