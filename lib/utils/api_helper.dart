import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lykun_cashflow/common/constants.dart';

class APIHelper {
  APIHelper._internal();
  static final APIHelper _apiHelper = APIHelper._internal();
  static APIHelper get sharedInstance => _apiHelper;

  Map<String, String> getHeader() {
    Map<String, String> header = new Map();
    header[HttpHeaders.authorizationHeader] = HEADER_AUTH;
    header[HttpHeaders.contentTypeHeader] = "application/json";

    return header;
  }

  Future<http.Response> doGet({String url}) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: getHeader(),
      );
      debugPrint("=================================");
      debugPrint("doGet url : $url");
      debugPrint("doGet response statusCode : ${response.statusCode}");
      debugPrint("doGet response result body : ${response.body}");
      debugPrint("=================================");
      return response;
    } catch (exception) {
      developer.log(
        "got exception: $exception",
        error: jsonEncode(exception),
      );
      return null;
    }
  }

  Future<http.Response> doPost({String url, String body}) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: getHeader(),
        body: body,
      );

      debugPrint("=================================");
      debugPrint("doPost url : $url");
      debugPrint("doPost ubodyrl : $body");
      debugPrint("doPost response statusCode : ${response.statusCode}");
      debugPrint("doPost response result body : ${response.body}");
      debugPrint("=================================");
      return response;
    } catch (exception) {
      developer.log(
        "got exception: $exception",
        error: jsonEncode(exception),
      );
      return null;
    }
  }
}
