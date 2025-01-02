import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/media.dart';

class ApiServices {
  final String baseUrl = 'http://192.168.43.244:8080/api/v1';

  Future<List<dynamic>> fetchAllUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users/'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<String> signupUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return 'User created successfully';
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<String> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 202) {
      return response.body; // Returns user ID
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  Future<List<dynamic>> fetchFavoriteMedia(String userId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/users/$userId/favorites'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch favorite media');
    }
  }

  Future<String> addFavoriteMedia(String userId, String mediaId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/$userId/favorites/$mediaId'),
    );

    if (response.statusCode == 200) {
      return 'Favorite media added successfully';
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }
}

class MediaApiService {
  final String baseUrl =
      'http://192.168.43.244:8080/api/v1/media'; // Your base URL
  static List<Media> allMedia = [];

  // Fetch all media from the server
  Future<void> fetchAllMedia() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/'));

      if (response.statusCode == 200) {
        // Parse the JSON response
        List<dynamic> data = json.decode(response.body);
        allMedia = data.map((item) => Media.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load media');
      }
    } catch (e) {
      throw Exception('Error fetching media: $e');
    }
  }

  // Add media to the server
  Future<void> addMedia(Media media) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/add'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(media.toJson()),
      );

      if (response.statusCode == 201) {
        print('Media added successfully');
      } else {
        throw Exception('Failed to add media');
      }
    } catch (e) {
      throw Exception('Error adding media: $e');
    }
  }
}
