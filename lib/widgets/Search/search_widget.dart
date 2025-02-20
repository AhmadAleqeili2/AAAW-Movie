import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/view/search_page.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../controller/search_controller.dart';
import 'filter.dart';
import 'past_search.dart';
import '../Core/movie.dart';

/// [SearchWidget] The main widget for handling search functionality
class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  FocusNode _focusNode = FocusNode();
  SearchsController? controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<SearchsController>(context, listen: false);
    controller!.speech = stt.SpeechToText();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller!.speech.stop(); // Stop listening on dispose
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    SearchsController controller = Provider.of<SearchsController>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      controller.applyFilter();
                      controller.isFilter = !controller.isFilter;
                      setState(() {});
                    },
                  ),
                  Container(
                    width: screenWidth * 0.674,
                    height: screenHeight * 0.04,
                    child: TextField(
                      controller: controller.controller,
                      focusNode: _focusNode,
                      onSubmitted: (value) => controller.search(context),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: ConstantNames.searchLabel.tr(),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: ConstantNames.searchHint.tr(),
                        hintStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      onChanged: (value) {
                        controller.applyFilter();
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      controller.isListening ? Icons.mic : Icons.mic_none,
                      color: controller.isListening
                          ? const Color.fromARGB(255, 255, 17, 0)
                          : Colors.white,
                      weight: controller.isListening ? 20 : 10,
                    ),
                    onPressed: () {
                      if (controller.isListening) {
                        controller.stopListening();
                      } else {
                        controller.startListening(context);
                      }
                      print("تم الضغط على أيقونة البحث الصوتي");
                    },
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: controller.isFilter,
            child: Filter(),
          ),
          Visibility(
            visible: isKeyboardVisible,
            child: Container(
              height: screenHeight * 0.2,
              child: ListView.builder(
                shrinkWrap: true, // إذا كنت تستخدمه داخل ScrollView آخر
                itemCount: 3,
                padding: EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  return pastSeache(title: pastsearchs[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: screenHeight,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children:
                    List.generate(controller.filteredMedia.length, (index) {
                  return MoviewWidget(
                      url: controller.filteredMedia[index].image,
                      data: controller.filteredMedia[index].title,
                      index: index);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
