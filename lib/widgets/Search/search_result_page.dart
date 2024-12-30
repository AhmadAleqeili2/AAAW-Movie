import 'package:flutter/material.dart';

class SearchResultsPage extends StatefulWidget {
  final String query;

  SearchResultsPage({required this.query});

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode(); // إضافة FocusNode هنا

  // قائمة نتائج البحث العشوائية
  List<String> searchResults = List.generate(20, (index) => 'نتيجة $index');

  @override
  void initState() {
    super.initState();
    _controller.text = widget.query;  // تعيين الاستعلام المُرسل في المربع
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.05,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // العودة إلى الصفحة السابقة عند الضغط على السهم
                  },
                ),
                Container(
                  width: screenWidth * 0.674,
                  height: screenHeight * 0.04,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode, // إضافة FocusNode هنا
                    onSubmitted: (value) {
                      // يمكنك تحديث النتائج بناءً على النص المدخل هنا
                      setState(() {
                        searchResults = List.generate(20, (index) => 'نتيجة جديدة $index');
                      });
                    },
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
                    // يمكنك إضافة وظيفة البحث الصوتي هنا
                  },
                ),
              ],
            ),
          ),
          
             GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الأعمدة
                crossAxisSpacing: 10, // المسافة بين الأعمدة
                mainAxisSpacing: 10, // المسافة بين الصفوف
              ),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      searchResults[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          
        ],
      ),
    );
  }
}