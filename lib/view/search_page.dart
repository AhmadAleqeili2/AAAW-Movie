import 'package:flutter/material.dart';
import '../widgets/Search/search_widget.dart';

List<String> pastsearchs = [
  "One Piece",
  "Need For Speed",
  "The Godfather",
  "Star Wars: Episode V - The E....",
  "Saving Private Ryan",
  "Naruto Shippuden",
];

/// [SearchPage] The main search page containing the search widget
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        SearchWidget(), // إضافة محتوى البحث هنا
      ],
    );
  }
}
