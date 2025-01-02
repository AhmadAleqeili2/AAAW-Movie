import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'http://192.168.43.244:8080/api/v1';

  // Helper to build URI
  static Uri _getUri(String endpoint) {
    return Uri.parse('$apiUrl$endpoint');
  }

  // Common headers for requests
  static Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
    };
  }

  // Centralized request handling
  static Future<http.Response> _sendRequest(
      Future<http.Response> Function() requestFunc, String method, Uri uri) async {
    try {
      final response = await requestFunc();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response; // Success
      } else {
        throw Exception(
            'HTTP $method Error: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to API ($method $uri): $e');
    }
  }

  // GET request
  static Future<http.Response> get(String endpoint) async {
    final uri = _getUri(endpoint);
    return _sendRequest(() => http.get(uri, headers: _headers()), 'GET', uri);
  }

  // POST request
  static Future<http.Response> post(String endpoint, dynamic body) async {
    final uri = _getUri(endpoint);
    return _sendRequest(
        () => http.post(uri, headers: _headers(), body: jsonEncode(body)),
        'POST',
        uri);
  }

  // PUT request
  static Future<http.Response> put(String endpoint, dynamic body) async {
    final uri = _getUri(endpoint);
    return _sendRequest(
        () => http.put(uri, headers: _headers(), body: jsonEncode(body)),
        'PUT',
        uri);
  }

  // PATCH request
  static Future<http.Response> patch(String endpoint, dynamic body) async {
    final uri = _getUri(endpoint);
    return _sendRequest(
        () => http.patch(uri, headers: _headers(), body: jsonEncode(body)),
        'PATCH',
        uri);
  }

  // DELETE request
  static Future<http.Response> delete(String endpoint, {dynamic body}) async {
    final uri = _getUri(endpoint);
    return _sendRequest(
        () => http.delete(uri, headers: _headers(), body: jsonEncode(body)),
        'DELETE',
        uri);
  }
}
