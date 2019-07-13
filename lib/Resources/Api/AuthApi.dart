import 'dart:async';

import 'package:flutter_redux_app/Config/networkConfig.dart';
import 'package:flutter_redux_app/Resources/Api/Response.dart';

class AuthApi {
  Future<Response> login(Map data) async {
    String url = "$baseUrl$loginPath)";
    print("Login paramter-> $data");
    print("Login url-> $url");

    //network.call(url,params, callback);
    print("Calling login api ha ha ha!");
    Response response = Response(data: {"ErrorMsg": "Network error"}); //await
    // network
    // .call(url,
    // params,
    // callback);
    return response;
  }
}
