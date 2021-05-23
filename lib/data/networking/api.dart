import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/data/app_constants.dart';
import 'package:flutter_app/data/app_state.dart';
import 'package:http/io_client.dart';
import 'package:redux/redux.dart';

class Api {
  Store<AppState> store;
  IOClient _client;

  Future<Null> loadStore(Store<AppState> store) async {
    this.store = store;
    HttpClient httpClient = HttpClient();
    _client = IOClient(httpClient);
  }

  Future<MyHttpResponse> serviceRequest(
      Uri uri, BuildContext context, QuqoRequest typeRequest,
      {Map jsonMap, bool shouldRetry = true, Map additionalHeaders}) async {

    Map<String, String> headers = {};

    headers = {
      'Content-Type': "application/json",
    };

    var response;
    switch (typeRequest) {
      case QuqoRequest.GET:
        response = await _client.get(uri, headers: headers);
        break;
      case QuqoRequest.POST:
        response = await _client.post(uri,
            headers: headers, body: utf8.encode(json.encode(jsonMap)));
        break;
      case QuqoRequest.DELETE:
        response = await _client.delete(uri, headers: headers);
        break;
      case QuqoRequest.PUT:
        response = await _client.put(uri,
            headers: headers, body: utf8.encode(json.encode(jsonMap)));
        break;
    }
    var data = json.decode(utf8.decode(response.bodyBytes));
    return MyHttpResponse(response.statusCode, data,
        message:
            response.statusCode != 200 ? data[AppConstants.messageKey] : '');
  }
}

class MyHttpResponse {
  int statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}
enum QuqoRequest { GET, POST, DELETE, PUT }