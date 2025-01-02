import 'package:flutter/material.dart';

import '../../model/media.dart';

abstract class FavouritMediaRepo {
Future<List<Map<String, dynamic>>> fetchFavouritMedia(String userId,BuildContext context); // Fetch favorite media
  Future<bool> addToFavourit(String userId,Media media,BuildContext context);  // Add media to favorites
  Future<void> removeFromFavourit(String userId,String mediaId,BuildContext context); // Remove media from favorites
  Future<bool> isFavourit(String userId,String mediaId,BuildContext context);  // Check if media is in favorites
}
