import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/model/movie.dart';
import 'package:just_movie/widgets/Search/search_result_page.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../widgets/movie..dart';

List<String> pastsearchs = [
  "هل اكتشف العلم الحديث طريقه لفهم غباء ايمن؟",
  "كيف نخلي ايمن يسكت باربع خطوات",
  "One Piece",
  "Need For Speed",
  "The Godfather",
  "Star Wars: Episode V - The E....",
  "Saving Private Ryan",
  "Naruto Shippuden",
];

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        SearchWidget(), // إضافة محتوى البحث هنا
      ],
    );
  }
}

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  late stt.SpeechToText _speech;
  bool isListening = false;
void _search() {
  if (_controller.text.trim().isEmpty) {
    // Show an error message or simply return
    return;
  }
  setState(() {
    String query = _controller.text.trim();
    pastsearchs.insert(0, query);
  });

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SearchResultsPage(query: _controller.text),
    ),
  );
}


  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

    _focusNode.addListener(() {
      setState(() {});
    });
  }
void _startListening() async {
  bool available = await _speech.initialize(
    onStatus: (val) => print('onStatus: $val'),
    onError: (val) => print('onError: $val'),
  );
  if (available) {
    setState(() => isListening = true);
    _speech.listen(
      onResult: (val) {
        setState(() {
          _controller.text = val.recognizedWords;
          if (!val.hasConfidenceRating && val.recognizedWords.isNotEmpty) {
            _search();
          }
        });
      },
    );
  }
}
  void _stopListening() {
    _speech.stop();
    setState(() => isListening = false);
  }


@override
void dispose() {
  _speech.stop(); // Stop listening on dispose
  _focusNode.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
List<Media> filteredMedia = MovieController.media
      .where((item) =>
          item.title.toLowerCase().contains(_controller.text.toLowerCase()))
      .toList();


    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      //!  Navigator.pop(
                      //!   context); // العودة إلى الصفحة السابقة عند الضغط على السهم
                      //! wrong navigator this will make crash for the app
                    },
                  ),
                  Container(
                    width: screenWidth * 0.674,
                    height: screenHeight * 0.04,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      onSubmitted: (value) => _search(),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'search...',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'enter text search',
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
                        
                        setState(() {
                          
                        });
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isListening ? Icons.mic : Icons.mic_none,
                      color: isListening
                          ? const Color.fromARGB(255, 255, 17, 0)
                          : Colors.white,
                      weight: isListening ? 20 : 10,
                    ),
                    onPressed: () {
                      if (isListening) {
                        _stopListening();
                      } else {
                        _startListening();
                      }
                      print("تم الضغط على أيقونة البحث الصوتي");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true, // إذا كنت تستخدمه داخل ScrollView آخر
                physics: ClampingScrollPhysics(), // لضبط حركة التمرير
                itemCount: pastsearchs.length,
                itemBuilder: (context, index) {
                  return pastSeache(pastsearchs[index]);
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(filteredMedia.length, (index) {
                  return MoviewWidget(url: filteredMedia[index].image, data: filteredMedia[index].title, index: index);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pastSeache(title) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // وضع وظيفتك هنا
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primarycolor, // لون النص
          ),
          child: Row(
            spacing: 7,
            children: [
              Icon(
                Icons.search,
                size: screenHeight * 0.03,
                color: Colors.white,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: screenWidth * 0.63,
                child: Text(title),
              ),
            ],
          ),
        ),
        IconButton(
          alignment: Alignment.bottomLeft,
          icon: Image.asset(
            "assets/image/arrow_icon_leftUp.png",
            height: screenHeight * 0.02,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
