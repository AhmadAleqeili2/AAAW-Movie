import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'drop_down.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with SingleTickerProviderStateMixin {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  late stt.SpeechToText _speech;
  bool isListening = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  void _search() {
    String query = _controller.text;
    print("تم البحث عن: $query");
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();

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
    _controller
        .dispose(); // Dispose of the search controller to avoid memory leaks
    _animationController.dispose();
    super.dispose();
  }

  bool showFilters = true;
  String? selectedGenre;
  String? selectedAgeRate;

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
                icon: Icon(Icons.filter_list, color: Colors.white),
                onPressed: () {
                  setState(() {
                    showFilters = !showFilters;
                    if (showFilters) {
                      _animationController.forward();
                    } else {
                      _animationController.reverse();
                      // selectedCity = '';
                      // selectedService = '';
                    }
                  });
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
        Visibility(
          visible: showFilters,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0).w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                color: Color.fromARGB(255, 202, 213, 211),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 145.w,
                    child: WidgetDropDown(
                      items: const [
                        "Action",
                        "Adventure",
                        "Comedy",
                        "Sci-Fi",
                        "Drama",
                        "Thriller",
                        "Horror",
                        "Mystery",
                        "Romance"
                      ],
                      selectedValue: selectedGenre,
                      title: "Select the genre",
                      onChanged: (value) {
                        setState(() {
                          selectedGenre = value;
                        });
                      },
                    ),
                  ),
                  16.horizontalSpace,
                  SizedBox(
                    width: 145.w,
                    child: WidgetDropDown(
                      items: const ["PG-13", "TV-MA", "R", "TV-14", "TV-PG"],
                      selectedValue: selectedAgeRate,
                      title: "select age rate",
                      onChanged: (value) {
                        setState(() {
                          selectedAgeRate = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
