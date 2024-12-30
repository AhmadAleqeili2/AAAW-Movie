import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScrolledListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String title;

  ScrolledListWidget(
    this.items,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Flexible Title to handle long text
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 1, // Single line with ellipsis if too long
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  // Action for the button
                  print('Navigate to full list');
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          // Horizontal List
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.7), // White border
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(item["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: 90,
                        height: 70,
                        child: Text(
                          item["title"]!,
                          style: TextStyle(color: Color(0XFFFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
