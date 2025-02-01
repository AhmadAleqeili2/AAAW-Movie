import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/favourit_media.dart';
import '../widgets/MyList/my_list_app_bar.dart';
import '../widgets/MyList/my_list_button_list.dart';
import '../widgets/MyList/my_list_media_list.dart';

/// [MyListPage] The main page for displaying the user's list of media.
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
      appBar: MyListAppBar(), // AppBar widget
      body: Column(
        children: [
          MyListButtonList(
            isSelected: isSelected,
            onButtonPressed: (index, selected) {
              setState(() {
                isSelected = index;
                WatsSelected = selected;
              });
            },
          ), // Button list widget
          Expanded(
            child: MyListMediaList(WatsSelected: WatsSelected), // Media list widget
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
