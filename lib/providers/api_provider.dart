import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future get(url) async {
    try {
      Response response = await _dio.get(url);
      return response.data;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }
}
