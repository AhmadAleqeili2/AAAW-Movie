import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/widgets/Core/scrolled_button_list.dart';
import 'package:just_movie/widgets/Core/call_data.dart';
import 'package:provider/provider.dart';

import '../constant/names.dart';
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
  void initState() {
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
              ConstantNames.all.tr(),
              ConstantNames.series.tr(),
              ConstantNames.title.tr(),
              ConstantNames.favorite.tr(),
              ConstantNames.recent.tr(),
              ConstantNames.watchLater.tr(),
            ],
            BPress: List.generate(
              6,
              (index) => () {
                setState(() {
                  isSelected = index;
                  WatsSelected = [
                    ConstantNames.all.tr(),
                    ConstantNames.series.tr(),
                    ConstantNames.film.tr(),
                    ConstantNames.favorite.tr(),
                    ConstantNames.recent.tr(),
                    ConstantNames.watchLater.tr()
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
                      ConstantNames.noData.tr(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: mediaData.length,
                    itemBuilder: (context, index) {
                      if (WatsSelected == "All" ||
                          mediaData[index]["type"] == WatsSelected) {
                        return CallData(
                          index: index,
                        );
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
