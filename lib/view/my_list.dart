import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/widgets/Buttons/scrolled_button_list.dart';
import 'package:provider/provider.dart';

import '../controller/favourit_media.dart';
import '../model/media.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  String filter = "All";
  int isSelected = 0;
  String WatsSelected = "All";
  @override
  void initState()  {
    FavouritMediaController controller =
        Provider.of<FavouritMediaController>(context, listen: false);
     controller.fetchFavoriteMedia(context);
    super.initState();
  }

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
            child: mediaData.isEmpty
                ? Center(
                    child: Text(
                      'No Data Available'.tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: mediaData.length,
                    itemBuilder: (context, index) {
                      if (WatsSelected == "All" ||
                          mediaData[index]["type"] == WatsSelected) {
                        return CallData(index, context);
                      }
                      return SizedBox();
                    },
                  ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

Widget CallData(int index, BuildContext context) {
  final data = mediaData[index];
  return ListTile(
    leading: Image.network(
      data["image"] ?? "https://static.thenounproject.com/png/504708-200.png",
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
            "https://static.thenounproject.com/png/504708-200.png");
      },
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.1,
    ),
    title: Text(
      data["title"] ?? "Unknown Title",
      style: TextStyle(color: Colors.white),
    ),
    subtitle: Text(
      data["type"] ?? "Unknown Type",
      style: TextStyle(color: Colors.grey),
    ),
    trailing: Icon(Icons.play_arrow, color: Colors.white),
  );
}
