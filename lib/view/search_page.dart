import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/controller/movie_controller.dart';
import 'package:just_movie/model/media.dart';
import 'package:just_movie/widgets/Search/search_result_page.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../widgets/movie.dart';

List<String> pastsearchs = [
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
  String selectedFilter = 'Genre';
  String selectedFilter2 = 'Age';

  List<String> filterOptions = ['Genre', 'Action', 'Drama', 'Comedy', 'Horror'];
  List<String> filterOptions2 = [
    "Age",
    "PG-13",
    "TV-MA",
    "R",
    "TV-14",
    "TV-PG"
  ];

  List<Media> filteredMedia = [];
  bool isFilter = false;
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

  void applyFilter() {
    setState(() {
      filteredMedia = MovieController.media.where((item) {
        // Check title
        bool matchesTitle =
            item.title.toLowerCase().contains(_controller.text.toLowerCase());

        // Check genre filter (ignore if 'Genre' is selected)
        bool matchesGenre =
            selectedFilter == 'Genre' || item.genre.contains(selectedFilter);

        // Check age rating filter (ignore if 'Age' is selected)
        bool matchesAgeRating =
            selectedFilter2 == 'Age' || item.ageRating == selectedFilter2;

        // Return true only if all conditions are met
        return matchesTitle && matchesGenre && matchesAgeRating;
      }).toList();
    });
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
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.white),
                  onPressed: () {
                    //!  Navigator.pop(
                    //!   context); // العودة إلى الصفحة السابقة عند الضغط على السهم
                    //! wrong navigator this will make crash for the app
                    applyFilter();
                    isFilter = !isFilter;
                    setState(() {});
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
                      
                      applyFilter();
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
          Visibility(
            visible: isFilter,
            child: filter(context),
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
                  return pastSeache(pastsearchs[index]) ;
                },
              ),
            ),
          ),
          
          SizedBox(
            height: screenHeight ,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(filteredMedia.length, (index) {
                return MoviewWidget(
                    url: filteredMedia[index].image,
                    data: filteredMedia[index].title,
                    index: index);
              }),
            ),
          ),
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

  Widget filter(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  hint: Text("Genre"),
                  value: filterOptions.contains(selectedFilter)
                      ? selectedFilter
                      : filterOptions.first, // Ensure valid default
                  items: filterOptions.map((String filter) {
                    return DropdownMenuItem<String>(
                      value: filter,
                      child: Text(
                        filter,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFilter = value!;
                      _debouncedApplyFilter();
                    });
                  },
                  dropdownColor: primarycolor,
                  style: TextStyle(color: Colors.white),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10), // Add spacing for better UI
                DropdownButton<String>(
                  hint: Text("Age"),

                  value: filterOptions2.contains(selectedFilter2)
                      ? selectedFilter2
                      : filterOptions2.first, // Ensure valid default
                  items: filterOptions2.map((String filter) {
                    return DropdownMenuItem<String>(
                      value: filter,
                      child: Text(
                        filter,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFilter2 = value!;
                      _debouncedApplyFilter();
                    });
                  },
                  dropdownColor: primarycolor,
                  style: TextStyle(color: Colors.white),
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Debounce method to reduce frequent `applyFilter` calls
  void _debouncedApplyFilter() {
    if (mounted) {
      applyFilter();
      setState(() {});
    }
  }
}
