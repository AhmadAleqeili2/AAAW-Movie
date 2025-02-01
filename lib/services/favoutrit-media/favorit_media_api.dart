import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/services/api.dart';
import 'package:just_movie/services/favoutrit-media/favourit_media_repo.dart';

class FavouritMediaApi implements FavouritMediaRepo {
  @override
  Future<List<Map<String, dynamic>>> fetchFavouritMedia(
      String userId, BuildContext context) async {
    final response = await ApiService.get('/favourit-media/$userId');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("no Media data".tr())),
      );
      return <Map<String, dynamic>>[];
    }
  }

  @override
  Future<bool> addToFavourit(
      String userId, Media media, BuildContext context) async {
    final response = await ApiService.post("/favourit-media/create", {
      ...media.toJson(), // Spread the media object properties into the map
      'userId': userId, // Add the userId to the map
    });
    if (response.statusCode == 201) {
      print('User created successfully');
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("This media exist".tr())),
      );
      return false;
    }
  }

  @override
  Future<bool> isFavourit(
      String userId, String mediaId, BuildContext context) async {
    final response = await ApiService.get(
        '/favourit-media/$userId/$mediaId'); // Adjusted endpoint
    if (response.statusCode == 200) {
      // Parse response JSON to U,ser object
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("This media does not exist".tr())),
      );
      return false;
    }
  }

  @override
  Future<void> removeFromFavourit(
      String userId, String mediaId, BuildContext context) async {
    final response = await ApiService.delete("favourit-media/$userId/$mediaId",
        body: {"id": mediaId});
    if (response.statusCode == 200) {
      print('User deleted successfully');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("This media does not exist".tr())),
      );
    }
  }
}
