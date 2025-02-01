import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/colors.dart';
import 'package:just_movie/constant/ages.dart';
import 'package:just_movie/enum/filter_options.dart';
import 'package:just_movie/constant/genre.dart';
import 'package:just_movie/constant/names.dart';
import 'package:just_movie/controller/search_controller.dart';
import 'package:provider/provider.dart';
   String? selectedFilter = Genres.Genre;
   String? selectedFilter2 = Ages.Age;
class Filter extends StatefulWidget {
  final String? selectedFilter;
  final String? selectedFilter2;

  Filter({super.key, this.selectedFilter, this.selectedFilter2});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late String selectedFilter;
  late String selectedFilter2;

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.selectedFilter ?? Genres.Genre;
    selectedFilter2 = widget.selectedFilter2 ?? Ages.Age;
  }

  @override
  Widget build(BuildContext context) {
    SearchsController controller = Provider.of<SearchsController>(context);
    return SafeArea(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  hint: Text(ConstantNames.genre.tr()),
                  value: FilterOptions.genreFilterOption
                          .contains(selectedFilter)
                      ? selectedFilter
                      : FilterOptions
                          .genreFilterOption.first, // Ensure valid default
                  items: FilterOptions.genreFilterOption.map((String filter) {
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
                      controller.applyFilter();
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
                  hint: Text(ConstantNames.age.tr()),

                  value: FilterOptions.AgeFilterOption
                          .contains(selectedFilter2)
                      ? selectedFilter2
                      : FilterOptions
                          .AgeFilterOption.first, // Ensure valid default
                  items: FilterOptions.AgeFilterOption.map((String filter) {
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
                      controller.applyFilter();
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
}
