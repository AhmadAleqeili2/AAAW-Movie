import 'package:flutter/material.dart';
import 'package:just_movie/controller/auth_controller.dart';
import 'package:just_movie/view/your_reviews_page.dart';
import 'package:just_movie/widgets/Core/more_button.dart';
import 'package:just_movie/widgets/ProfilePage/profile_avatar.dart';
import 'package:just_movie/widgets/ProfilePage/profile_header.dart';
import 'package:just_movie/widgets/ProfilePage/profile_last_watched.dart';
import 'package:just_movie/widgets/ProfilePage/profile_reviews.dart';

import '../model/boxes.dart';
import '../model/user.dart';

/// [ProfilePage]
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
    final fetchedUser = UserController().getUser(Boxes.boxToken.keys.first);

    setState(() {
      if (fetchedUser == null) {
        user = User(); // Default user object
      } else {
        user = fetchedUser;
      }
      isUserFetched = true;
    });
  }

  int count = 10;

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
            ProfileHeader(), // ProfileHeader widget
            SizedBox(height: 20),
            ProfileAvatar(user: user), // ProfileAvatar widget
            SizedBox(height: 10),
            Text(
              "${user?.firstName() ?? ''} ${user?.lastName() ?? ''}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user?.gender() ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            ProfileLastWatched(), // ProfileLastWatched widget
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
            ProfileReviews(count: count), // ProfileReviews widget
            SizedBox(height: 20),
            moreButton(context, YourReviewsPage()), // moreButton widget
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
