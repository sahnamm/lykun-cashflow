import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:lykun_cashflow/common/constants.dart';

class APIHelper {
  APIHelper._internal();
  static final APIHelper _apiHelper = APIHelper._internal();
  static APIHelper get sharedInstance => _apiHelper;

  Map<String, String> getHeader() {
    Map<String, String> header = new Map();
    header[HttpHeaders.authorizationHeader] = HEADER_AUTH;

    return header;
  }

  Future<http.Response> doGet({String url}) {
    try {
      var response = http.get(
        Uri.parse(url),
        headers: getHeader(),
      );
      return response;
    } catch (exception) {
      developer.log(
        "got exception: $exception",
        error: jsonEncode(exception),
      );
    }
  }

  Future<http.Response> doPost({String url, String body}) {
    try {
      var response = http.post(
        Uri.parse(url),
        headers: getHeader(),
        body: body,
      );

      return response;
    } catch (exception) {
      developer.log(
        "got exception: $exception",
        error: jsonEncode(exception),
      );
    }
  }
}
