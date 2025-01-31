import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/widgets/main_imag_widget.dart';

import '../../constant/names.dart';

class MainImageSection extends StatefulWidget {
  final String Image;
  final String youtubeVideoId;
  bool isClicked;
  MainImageSection(
      {super.key,
      required this.Image,
      required this.youtubeVideoId,
      required this.isClicked});

  @override
  State<MainImageSection> createState() => _MainImageSectionState();
}

class _MainImageSectionState extends State<MainImageSection> {
  String? _videoId;

  void _extractVideoId(String url) {
    try {
      Uri uri = Uri.parse(url);
      if (uri.queryParameters.containsKey('v')) {
        setState(() {
          _videoId = uri.queryParameters['v'];
        });
      } else {
        setState(() {
          _videoId = ConstantNames.invalidUrl.tr();
        });
      }
    } catch (e) {
      setState(() {
        _videoId =ConstantNames.errorParsing.tr();
      });
    }
  }

  @override
  void initState() {
    _extractVideoId(widget.youtubeVideoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.40,
      width: screenWidth,
      child: Stack(
        children: [
          MainImageWidget(
            imagePath: widget.Image,
            youtubeVideoId: _videoId??"",
            isClicked: widget.isClicked,
          ),
          if (!widget.isClicked) ...{
            Positioned(
              top: 90,
              left: 90,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isClicked = true;
                  });
                },
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 200,
                  color: Colors.red,
                ),
              ),
            )
          },
        ],
      ),
    );
  }
}
