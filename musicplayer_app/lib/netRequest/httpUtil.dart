import 'package:dio/dio.dart';
import 'dart:io';
import 'package:musicplayer_app/netRequest/api.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class HttpUtil {
  static HttpUtil instance;
  Future<Dio> dio;
  BaseOptions options;
  PersistCookieJar _cookieJar;

  CancelToken cancelToken = CancelToken();

  static HttpUtil getInstance() {
    if(instance == null) {
      instance = HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    options = BaseOptions(
      baseUrl: Api.BASE_URL,
      contentType: ContentType.json
    );

    dio = () async {
      final _dio = Dio(options);

      String path;
      try {
        path = (await getApplicationDocumentsDirectory()).path;
      } catch (e) {
        print("error: can not get cookie directory");
        path = '.';
      }
      _cookieJar = PersistCookieJar(dir: path + '/.cookies/');

      //Cookie管理,可以通过添加CookieManager拦截器来自动管理请求/响应 cookie
      _dio.interceptors.add(MyCookieManager(_cookieJar));

      //每个 Dio 实例都可以添加任意多个拦截器
      //通过拦截器可以在请求之前或响应之后(但还没有被 then 或 catchError处理)做一些统一的预处理操作
      _dio.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options) {
            print('请求前');
            return options;
          },
          onResponse: (Response response) {
            print('响应之前');
            return response;
          },
          onError: (DioError e) {
            print('错误之前');
            return e;
          }
      ));

      return _dio;
    }();

  }

  Future<Response> get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await (await dio).get(url, queryParameters: data, options: options, cancelToken: cancelToken);
      print('get请求成功----${response.data}');
    } on DioError catch(e) {
      print('get请求失败-----$e');
      formatError(e);
    }
    return response;
  }

  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await (await dio).post(url, queryParameters: data, options: options, cancelToken: cancelToken);
      print('post请求成功----${response.data}');
    } on DioError catch(e) {
      print('post请求失败-----$e');
      formatError(e);
    }
    return response;
  }

  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await (await dio).download(urlPath, savePath, onReceiveProgress: (int count, int total) {
        print("$count---$total");
      });
      print('下载成功---------${response.data}');
    } on DioError catch (e) {
      print('下载失败---------$e');
      formatError(e);
    }

    return response.data;
  }

  void cancelRequests(CancelToken token) {
    token.cancel('cancelled');
  }

  void formatError(DioError e) {
    if(e.type == DioErrorType.CONNECT_TIMEOUT) {
      print('连接超时');
    }
    else if(e.type == DioErrorType.SEND_TIMEOUT) {
      print('请求超时');
    }
    else if(e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print('响应超时');
    }
    else if (e.type == DioErrorType.RESPONSE) {
      print("出现异常");
    }
    else if (e.type == DioErrorType.CANCEL) {
      print("请求取消");
    }
    else {
      print("未知错误");
    }
  }

}


class MyCookieManager extends CookieManager {
  MyCookieManager(CookieJar cookieJar) : super(cookieJar);

  @override
  onRequest(RequestOptions options) {
    var cookies = cookieJar.loadForRequest(Uri.parse('http://music.163.com'));
    cookies.removeWhere((cookie) =>
    cookie.value == CookieManager.invalidCookieValue &&
        cookie.expires.isBefore(DateTime.now()));
    cookies.addAll(options.cookies);
    String cookie = CookieManager.getCookies(cookies);
    if (cookie.isNotEmpty) options.headers[HttpHeaders.cookieHeader] = cookie;
  }
}