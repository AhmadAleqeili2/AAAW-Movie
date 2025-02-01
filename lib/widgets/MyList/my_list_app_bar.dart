import 'package:flutter/material.dart';

/// [MyListAppBar] The AppBar for the My List page.
class MyListAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('My List'),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
