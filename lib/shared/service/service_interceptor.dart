import 'package:dio/dio.dart';
import 'package:gohealthination/pages/auth/auth_progress.dart';

class DioClient{
  DioClient(){
    dio = Dio(BaseOptions(
        baseUrl: 'https://backend.gohealthination.com/',
        headers: {
          'Accept-Charset': 'utf-8',
          'Content-Type': 'application/json; charset=utf-8'
        },
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
      responseType: ResponseType.json
    ))
      ..interceptors.add(ErrorInterceptor());
    // getToken();
  }

  late final Dio dio;
}

class ErrorInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await AuthProcess().getToken;
    var header = {'Authorization':'Token $token'};
    options.headers.addEntries(header.entries);
    super.onRequest(options, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('error: ${err.requestOptions.headers}');
    super.onError(err, handler);
  }
}