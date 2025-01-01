import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Api {
  final String apiUrl = dotenv.env['ApiUrl'] ?? 'Default URL';

  Uri _getUri(String endpoint) {
    return Uri.parse('{ApiUrl.baseUrl}$endpoint');
  }

  String _accessToken() {
    return "";
  }

  Map<String, String> _headers() {
    return {
      "Content-Type": "application/json",
      "token": _accessToken(),
    };
  }

  Future<http.Response> _sendRequest(
      Future<http.Response> Function() requestFunc, Uri uri,
      {dynamic body}) async {
    try {
      final response = await requestFunc();

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> get(String endpoint) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(() => http.get(uri, headers: _headers()), uri);
  }

  Future<http.Response> post(String endpoint, dynamic body) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.post(uri, headers: _headers(), body: jsonEncode(body)), uri,
        body: body);
  }

  Future<http.Response> put(String endpoint, dynamic body) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.put(uri, headers: _headers(), body: jsonEncode(body)), uri,
        body: body);
  }

  Future<http.Response> patch(String endpoint, dynamic body) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.patch(uri, headers: _headers(), body: jsonEncode(body)), uri,
        body: body);
  }

  Future<http.Response> delete(String endpoint, {dynamic body}) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.delete(uri, headers: _headers(), body: jsonEncode(body)),
        uri,
        body: body);
  }
}
