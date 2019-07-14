import 'dart:convert';
import 'package:flutter_redux_app/Utils/Logger.dart';
import 'package:http/http.dart' as http;

//Todo: get access to the store here, so that when a token expires, users can
// be logged out of the app from this single point;

class Api {
  Future<Response> get({String url}) async {
    var httpResponse = await http.get(url);

    Logger().log("Response status", value: httpResponse.statusCode);
    if (httpResponse.statusCode == 200) {
      Logger().log("Success Response body", value: httpResponse.body);
      Map data = json.decode(httpResponse.body)["data"];
      return Response.success(data);
    } else {
      Logger().log("Error Response body", value: httpResponse.body);
      String message = json.decode(httpResponse.body)["message"];
      return Response.failed(message);
    }
  }

  Future<Response> post({String url, Map data}) async {
    var httpResponse = await http.post(url, body: data);

    Logger().log("Response status", value: httpResponse.statusCode);
    if (httpResponse.statusCode == 200) {
      Logger().log("Success Response body", value: httpResponse.body);
      Map data = json.decode(httpResponse.body)["data"];
      return Response.success(data);
    } else {
      Logger().log("Error Response body", value: httpResponse.body);
      String message = json.decode(httpResponse.body)["message"];
      return Response.failed(message);
    }
  }
}

enum Status { SUCCESS, FAILED }

class Response {
  final Status status;
  final String message;
  final Map data;
  Response({this.status, this.message, this.data});

  factory Response.failed(String message) =>
      Response(status: Status.FAILED, message: message);

  factory Response.success(Map data) =>
      Response(status: Status.FAILED, data: data);

  bool isSuccess() => status == Status.SUCCESS;
}
