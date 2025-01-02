import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static final String apiUrl = dotenv.env['ApiUrl'] ?? 'Default URL';

  static Uri _getUri(String endpoint) {
    return Uri.parse('$apiUrl$endpoint'); // Fix interpolation syntax
  }

  static Map<String, String> _headers() {
    return {
      "Content-Type": "application/json",
    };
  }

  static Future<http.Response> _sendRequest(
      Future<http.Response> Function() requestFunc, Uri uri) async {
    try {
      final response = await requestFunc();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response; // Success
      } else {
        throw Exception(
            'Error: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API: $e');
    }
  }

  static Future<http.Response> get(String endpoint) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(() => http.get(uri, headers: _headers()), uri);
  }

  static Future<http.Response> post(String endpoint, dynamic body) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.post(uri, headers: _headers(), body: jsonEncode(body)), uri);
  }

  static Future<http.Response> put(String endpoint, dynamic body) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.put(uri, headers: _headers(), body: jsonEncode(body)), uri);
  }

  static Future<http.Response> patch(String endpoint, dynamic body) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.patch(uri, headers: _headers(), body: jsonEncode(body)), uri);
  }

  static Future<http.Response> delete(String endpoint, {dynamic body}) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.delete(uri, headers: _headers(), body: jsonEncode(body)),
        uri);
  }
}
