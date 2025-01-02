import 'package:flutter/material.dart';
import 'package:just_movie/model/user.dart';

abstract class UserRepo {
  Future<bool> createUser(User user,BuildContext context);
  Future<void> deleteUser(String userId,BuildContext context);
  Future<User> getUser(String userId,BuildContext context);
  Future<void> updateUser(String userId, User data,BuildContext context);
  Future<bool> Login(String email, String password,BuildContext context);
  // Future<void> checkUser(String email,BuildContext context);
}
