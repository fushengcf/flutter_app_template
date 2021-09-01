import 'dart:async';

import 'package:app/utils/util.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import '../global.dart';

// 异常处理
class ErrorEntity implements Exception {
  String? code;
  String? message;
  ErrorEntity({this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "$message";
  }
}

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;

  HttpUtil._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = new BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: SERVER_API_URL,

      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,

      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,

      // Http请求头.
      contentType: Headers.formUrlEncodedContentType,

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      // contentType: 'application/x-www-form-urlencoded',
      // headers: {'Content-Type': 'application/x-www-form-urlencoded'},

      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    dio = new Dio(options);

    // Cookie管理
    // CookieJar cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("this1");
        // Do something before request is sent
        return handler.next(options); //continue
        // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse: (response, handler) {
        print("this2");
        // ResponseEntity responseEntity= json.decode(response.data);

        // // if(response == '1') {}

        // print(responseEntity.toString());
        // Do something with response data
        return handler.next(response); // continue
        // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onError: (DioError e, handler) {
        // Do something with response error
        ErrorEntity eInfo = createErrorEntity(e);
        switch (eInfo.code) {
          case '401': // 没有权限 重新登录
            // goLoginPage(context);
            break;
          default:
        }
        return handler.next(e); //continue
        // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      },
    ));
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return ErrorEntity(code: '-1', message: "请求取消");
      case DioErrorType.connectTimeout:
        return ErrorEntity(code: '-1', message: "连接超时");
      case DioErrorType.sendTimeout:
        return ErrorEntity(code: '-1', message: "请求超时");
      case DioErrorType.receiveTimeout:
        return ErrorEntity(code: '-1', message: "响应超时");
      case DioErrorType.response:
        {
          try {
            String? errCode = '1';
            // int? errCode = error.response?.code;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case '400':
                return ErrorEntity(code: errCode, message: "请求语法错误");
              case '401':
                return ErrorEntity(code: errCode, message: "没有权限");
              case '403':
                return ErrorEntity(code: errCode, message: "服务器拒绝执行");
              case '404':
                return ErrorEntity(code: errCode, message: "无法连接服务器");
              case '405':
                return ErrorEntity(code: errCode, message: "请求方法被禁止");
              case '500':
                return ErrorEntity(code: errCode, message: "服务器内部错误");
              case '502':
                return ErrorEntity(code: errCode, message: "无效的请求");
              case '503':
                return ErrorEntity(code: errCode, message: "服务器挂了");
              case '505':
                return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
              default:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response?.statusMessage,
                  );
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: '-1', message: "未知错误");
          }
        }
      default:
        {
          return ErrorEntity(code: '-1', message: error.message);
        }
    }
  }

  Future request<T>(
    String method,
    String path, {
    Map<String, dynamic>? params,
    dynamic? data,
    String? contentType,
  }) async {
    try {
      var response = await dio.request(
        path,
        data: FormData.fromMap(data),
        queryParameters: params,
        options: Options(method: method, contentType: contentType),
      );
      if (response.data['code'] == '0') {
        print('成功！');
        return response.data.data;
      } else if (response.data['tokenType'] != null) {
        print('成功登录！');
        // 持久化 用户信息
        StorageUtil().setString('token', response.data['value']);
        // Get.toNamed('/home');user
        return response.data;
      } else {
        Ftoast().showToast(response.data['message']);
      }
    } on DioError catch (e) {
      Ftoast().showToast(e.message);
      createErrorEntity(e);
    }
  }
}
