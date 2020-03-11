import 'dart:io';
import 'package:andersgym/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Exception.dart';
import 'dart:async';

class ApiBaseHelper {
  final String _baseUrl = "$APIURL";

  Future<String> post(String url, BuildContext context, Object body) async {
    var responseJson;
    try {
      final response = await http
          .post(_baseUrl + url, body: body);
      responseJson = _returnResponse(response, context);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return json.encode(responseJson);
  }

  Future<dynamic> get(String url, BuildContext context) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _returnResponse(response, context);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response, BuildContext context) {
    
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
        break;
      case 400:
      case 401:
      case 403:
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
