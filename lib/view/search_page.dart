import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/widgets/Search/search_result_page.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

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
    setState(() {
      String query = _controller.text;
      pastsearchs.insert(0, query);
    });

    // الانتقال إلى صفحة نتائج البحث مع إرسال الاستعلام
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
        onResult: (val) => setState(() {
          _controller.text = val.recognizedWords;
          // searchText = val.recognizedWords; // Update the search text
        }),
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => isListening = false);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
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
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.mic, color: Colors.white,weight: isListening? 20:10,),
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
          ListView.builder(
            shrinkWrap: true, // إذا كنت تستخدمه داخل ScrollView آخر
            physics: ClampingScrollPhysics(), // لضبط حركة التمرير
            itemCount: pastsearchs.length,
            itemBuilder: (context, index) {
              return pastSeache(pastsearchs[index]);
            },
          )
        ],
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
