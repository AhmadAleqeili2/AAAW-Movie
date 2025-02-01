import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/services/api.dart';
import 'package:just_movie/services/media/media_repo.dart';


class MediaApi implements MediaRepo {
  @override
  Future<List<Map<String, dynamic>>> fetchMedia(BuildContext context) async {
    final response = await ApiService.get('/media');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("no Media data".tr())),
      );
      return <Map<String, dynamic>>[];
    }
  }
}
