import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/model/user.dart';
import 'package:just_movie/services/api.dart';
import 'package:just_movie/services/user/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi implements UserRepo {
  @override
  Future<bool> Login(String email, String password, BuildContext context) async {
    try {
      final response = await ApiService.post("/users/login", {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 202) {
        // Success
        print('Login successful');
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("userId", response.body);
        return true;
      } else {
        _showSnackBar(context, "Login Failed".tr());
        return false;
      }
    } catch (e) {
      _showSnackBar(context, "An error occurred: $e");
      return false;
    }
  }

  @override
  Future<bool> createUser(User user, BuildContext context) async {
    try {
      final response = await ApiService.post("/users/create", user.toJson());

      if (response.statusCode == 201) {
        print('User created successfully');
        return true;
      } else {
        _showSnackBar(context, "This user exists".tr());
        return false;
      }
    } catch (e) {
      _showSnackBar(context, "An error occurred: $e");
      return false;
    }
  }

  @override
  Future<void> deleteUser(String userId, BuildContext context) async {
    try {
      final response =
          await ApiService.delete("/users/$userId", body: {"id": userId});

      if (response.statusCode == 200) {
        print('User deleted successfully');
      } else {
        _showSnackBar(context, "This user does not exist".tr());
      }
    } catch (e) {
      _showSnackBar(context, "An error occurred: $e");
    }
  }

  @override
  Future<User> getUser(String userId, BuildContext context) async {
    try {
      final response = await ApiService.get('/users/$userId');

      if (response.statusCode == 200) {
        // Parse response JSON to User object
        final Map<String, dynamic> data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        _showSnackBar(context, "This user does not exist".tr());
        return User(); // Returning a default User object
      }
    } catch (e) {
      _showSnackBar(context, "An error occurred: $e");
      return User(); // Returning a default User object
    }
  }

  @override
  Future<void> updateUser(String userId, User data, BuildContext context) async {
    try {
      final response = await ApiService.put('/users/$userId', data.toJson());

      if (response.statusCode == 200) {
        print('User updated successfully');
      } else {
        _showSnackBar(context, "This user does not exist".tr());
      }
    } catch (e) {
      _showSnackBar(context, "An error occurred: $e");
    }
  }

  // Helper method to show snackbar messages
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
