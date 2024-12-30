import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

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
    String query = _controller.text;
    print("تم البحث عن: $query");
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(
                      context); // العودة إلى الصفحة السابقة عند الضغط على السهم
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
                icon: Icon(Icons.mic, color: Colors.white),
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
      ],
    );
  }
}
