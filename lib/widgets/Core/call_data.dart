import 'package:flutter/material.dart';
import 'package:just_movie/constant/media_data.dart';

class CallData extends StatelessWidget {
  const CallData({super.key,required this.index});
final int index;

  @override
  Widget build(BuildContext context) {
 return ListTile(
    leading: Image.network(
      mediaData[index]["image"] ?? "https://static.thenounproject.com/png/504708-200.png",
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
            "https://static.thenounproject.com/png/504708-200.png");
      },
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.1,
    ),
    title: Text(
      mediaData[index]["title"],
      style: TextStyle(color: Colors.white),
    ),
    subtitle: Text(
      mediaData[index]["type"],
      style: TextStyle(color: Colors.grey),
    ),
    trailing: Icon(Icons.play_arrow, color: Colors.white),
  );  }
}
