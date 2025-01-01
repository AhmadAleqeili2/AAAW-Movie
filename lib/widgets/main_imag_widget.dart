import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainImageWidget extends StatefulWidget {
  final String imagePath;
  final String youtubeVideoId;
  final bool isClicked;
  const MainImageWidget(
      {Key? key,
      required this.imagePath,
      required this.youtubeVideoId,
      required this.isClicked})
      : super(key: key);

  @override
  State<MainImageWidget> createState() => _MainImageWidgetState();
}

class _MainImageWidgetState extends State<MainImageWidget> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: widget.youtubeVideoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    // التأكد من أن المتحكم يتم التخلص منه بشكل صحيح
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          child: ClipRRect(
            child: widget.isClicked
                ? YoutubePlayer(
                    controller: _youtubeController,
                    showVideoProgressIndicator: true,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.red,
                      handleColor: Colors.redAccent,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: widget.imagePath,
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: screenHeight * 0.40,
                  ),
          ),
        ),
        if (!widget.isClicked)
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(40, 0, 0, 0),
              BlendMode.darken,
            ),
          ),
      ],
    );
  }
}
