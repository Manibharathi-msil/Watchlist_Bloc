import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/constant.dart';
import 'exception.dart';

class ApiNetwork {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException(Strings.network);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception(Strings.data);
    }
    switch (response.statusCode) {

      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 403:
        throw UnauthorisedException(response.body);
      case 500:

      default:
        throw FetchDataException(
           Strings.exception + (response.statusCode).toString());
    }
  }
}
