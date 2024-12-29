
import 'package:http/http.dart'as http;

class ApiServices {
  static Future<http.Response> get({
    required String url,
  }) async {
    final http.Response response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(
Duration(seconds: 30),
      onTimeout: () {
        return http.Response("timedOut", 408);
      },
    );
    return response;
  }
}