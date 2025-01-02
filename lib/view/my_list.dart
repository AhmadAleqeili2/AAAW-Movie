import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/widgets/Buttons/scrolled_button_list.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  String filter = "All";
  int isSelected = 0;
  String WatsSelected = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          ScrolledButtonList(
            Bnames: [
              "All".tr(),
              "Series".tr(),
              "Movies".tr(),
              "My Favorite".tr(),
              "Recent".tr(),
              "Watch Later".tr(),
            ],
            BPress: List.generate(
              6,
              (index) => () {
                setState(() {
                  isSelected = index;
                  WatsSelected = [
                    "All".tr(),
                    "Series".tr(),
                    "Film".tr(),
                    "My Favorite".tr(),
                    "Recent".tr(),
                    "Watch Later".tr()
                  ][index];
                });
              },
            ),
            width: MediaQuery.of(context).size.width * 0.3,
            selectedButtonTop: isSelected,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mediaData.length,
              itemBuilder: (context, index) {
                if (WatsSelected == "All" || mediaData[index]["type"] == WatsSelected) {
                  return CallData(index, context);
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

Widget CallData(int index, context) {
  return ListTile(
    leading: Image.network(
      mediaData[index]["image"]?.isNotEmpty == true
          ? mediaData[index]["image"]
          : "https://static.thenounproject.com/png/504708-200.png",
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.network("https://static.thenounproject.com/png/504708-200.png");
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
  );
}
