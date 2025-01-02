import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/services/favoutrit-media/favourit_media_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/favoutrit-media/favorit_media_api.dart';

class FavouritMediaController extends ChangeNotifier {
  String? userId;
  List<Map<String, dynamic>> favoriteMedia = [];
  final FavouritMediaApi _favoritMediaApi = FavouritMediaApi();

  FavouritMediaController() {
    _loadUserId();
  }

  // Fetch userId from shared preferences
  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId");
    notifyListeners(); // Notify listeners after loading userId
  }

  Future<bool> isFavourit(String mediaId, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId");
    bool isFavourite =
        await _favoritMediaApi.isFavourit(userId ?? '', mediaId, context);

    notifyListeners(); // Notify listeners after loading userId
    return isFavourite;
  }

  // Fetch favorite media list from API
  Future<void> fetchFavoriteMedia(BuildContext context) async {
    if (userId == null) return; // Make sure userId is loaded
    final fetchedMedia =
        await _favoritMediaApi.fetchFavouritMedia(userId!, context);
    if (fetchedMedia.isNotEmpty) {
      favoriteMedia = fetchedMedia;
      notifyListeners(); // Update UI after fetching data
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No media data".tr())),
      );
    }
  }

  // Add a media item to the favorites list
  Future<void> addToFavorite(Media media, BuildContext context) async {
    if (userId == null) return;
    final isAdded =
        await _favoritMediaApi.addToFavourit(userId!, media, context);
    if (isAdded) {
      fetchFavoriteMedia(context); // Refresh the favorite media list
    }
    notifyListeners();
  }

  // Remove a media item from favorites
  Future<void> removeFromFavorite(String mediaId, BuildContext context) async {
    if (userId == null) return;
    await _favoritMediaApi.removeFromFavourit(userId!, mediaId, context);
    fetchFavoriteMedia(context); // Refresh after removal
    notifyListeners();
  }
}
