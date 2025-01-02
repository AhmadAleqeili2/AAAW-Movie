import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/function/navigate.dart';
import 'package:just_movie/view/setting_page.dart';
import 'package:just_movie/view/your_reviews_page.dart';
import 'package:just_movie/widgets/custom_list_tile.dart';
import 'package:just_movie/widgets/Buttons/more_button.dart';

import '../model/boxes.dart';
import '../model/user.dart';
class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User? user;
  bool isUserFetched = false;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() {
    final fetchedUser = UserController ().getUser(Boxes.boxToken.keys.first);

    setState(() {
      if (fetchedUser == "" || fetchedUser == null) {
        user = User(); // Default user object
      } else {
        user = fetchedUser;
      }
      isUserFetched = true;
    });
  }
int count=0;
  @override
  Widget build(BuildContext context) {
    if (!isUserFetched) {
      return Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14159), // Flip horizontally
                  child: Image.asset(
                    'assets/image/Logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white, size: 28),
                  onPressed: () {
                    navigateTo(context, SettingPage());
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundColor: const Color(0XFFD9D9D9),
              child: user?.image() != null
                  ? ClipOval(
                      child: Image.asset(
                        user!.image()!,
                        fit: BoxFit.cover,
                        width: 160,
                        height: 160,
                      ),
                    )
                  : Icon(
                      Icons.person,
                      size: 130,
                      color: const Color(0xFF6F6F6F),
                    ),
            ),
            SizedBox(height: 10),
            Text(
              "${user?.firstName() ?? 'Guest'} ${user?.lastName() ?? ''}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user?.gender() ?? "Not specified",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last watched',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Vikings Season 5 | Episode 7 | 00:25:23',
                    style: TextStyle(
                      color: Color(0XFFB4B4B4),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage('assets/image/movie_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 175,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    size: 70,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your reviews'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: count,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomTile(
                    image: "assets/image/movie_logo.png",
                    title: "Film name".tr(),
                    description:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    pagenum: index + 1,
                    numOfPage: count,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            moreButton(context, YourReviewsPage()),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
