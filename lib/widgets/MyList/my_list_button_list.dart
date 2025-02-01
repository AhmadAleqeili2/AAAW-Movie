import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:just_movie/widgets/Core/scrolled_button_list.dart';
import '../../constant/names.dart';

/// [MyListButtonList] The list of buttons for filtering media.
class MyListButtonList extends StatelessWidget {
  final int isSelected;
  final Function(int, String) onButtonPressed;

  MyListButtonList({required this.isSelected, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return ScrolledButtonList(
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
          onButtonPressed(
            index,
            [
              ConstantNames.all.tr(),
              ConstantNames.series.tr(),
              ConstantNames.film.tr(),
              ConstantNames.favorite.tr(),
              ConstantNames.recent.tr(),
              ConstantNames.watchLater.tr()
            ][index],
          );
        },
      ),
      width: MediaQuery.of(context).size.width * 0.3,
      selectedButtonTop: isSelected,
    );
  }
}
