import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/colors.dart';
import 'package:just_movie/constant/ages.dart';
import 'package:just_movie/constant/genre.dart';
import 'package:just_movie/constant/names.dart';

class Filter extends StatefulWidget {
  Filter({super.key, this.selectedFilter, this.selectedFilter2});

  String? selectedFilter;
  String? selectedFilter2;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late String selectedFilter;
  late String selectedFilter2;
  List<String> filterOptions = [
    Genres.Genre,
    Genres.Action,
    Genres.Drama,
    Genres.Comedy,
    Genres.Horror
  ];
  List<String> filterOptions2 = [
    Ages.Age,
    Ages.PG13,
    Ages.TVMA,
    Ages.R,
    Ages.TV14,
    Ages.TVPG
  ];
  @override
  void initState() {
    super.initState();
    selectedFilter = widget.selectedFilter ?? Genres.Genre;
    selectedFilter2 = widget.selectedFilter2 ?? Ages.Age;
  }
  @override
  Widget build(BuildContext context) {
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
                  value: filterOptions.contains(widget.selectedFilter)
                      ? widget.selectedFilter
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
                      widget.selectedFilter = value!;
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
                  hint: Text(ConstantNames.age.tr()),

                  value: filterOptions2.contains(widget.selectedFilter2)
                      ? widget.selectedFilter2
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
                      widget.selectedFilter2 = value!;
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

  void _debouncedApplyFilter() {
    if (mounted) {
      // applyFilter();
      setState(() {});
    }
  }
    // void applyFilter() {
    // setState(() {
    //   filteredMedia = MovieController.media.where((item) {
    //     // Check title
    //     bool matchesTitle =
    //         item.title.toLowerCase().contains(_controller.text.toLowerCase());

    //     // Check genre filter (ignore if 'Genre' is selected)
    //     bool matchesGenre = selectedFilter == Genres.Genre ||
    //         item.genre.contains(selectedFilter);

    //     // Check age rating filter (ignore if 'Age' is selected)
    //     bool matchesAgeRating =
    //         selectedFilter2 == Ages.Age || item.ageRating == selectedFilter2;

    //     // Return true only if all conditions are met
    //     return matchesTitle && matchesGenre && matchesAgeRating;
    //   }).toList();
    // });
  }


