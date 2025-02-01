import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/constant/media_data.dart';
import 'package:just_movie/widgets/Core/call_data.dart';
import '../../constant/names.dart';

/// [MyListMediaList] The list of media items.
class MyListMediaList extends StatelessWidget {
  final String WatsSelected;

  MyListMediaList({required this.WatsSelected});

  @override
  Widget build(BuildContext context) {
    return mediaData.isEmpty
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
          );
  }
}
