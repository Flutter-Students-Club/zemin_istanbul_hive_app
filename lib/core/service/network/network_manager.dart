import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  final http.Client _client = http.Client();
  final String _baseUrl = 'https://jsonplaceholder-typicode-com.translate.goog/';

  Future<dynamic> getRequest(String path) async {
    try {
      http.Response res = await _client.get(Uri.parse(_baseUrl + path));
      if (res.statusCode == HttpStatus.ok) {
        return jsonDecode(res.body);
      }
    } on HttpException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
  
  Future<dynamic> postRequest(String path,dynamic body) async {
    try {
      http.Response res = await _client.post(Uri.parse(_baseUrl + path),body: jsonEncode(body));
      if (res.statusCode == HttpStatus.ok) {
        return jsonDecode(res.body);
      }
    } on HttpException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
}
