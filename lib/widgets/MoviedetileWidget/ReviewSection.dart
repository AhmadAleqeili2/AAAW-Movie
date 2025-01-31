import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_movie/constant/names.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ReviewSection extends StatelessWidget {
  final TextEditingController reviewController;
  final double ratingValue;
  final ValueChanged onRatingChanged;

  ReviewSection({
    required this.reviewController,
    required this.ratingValue,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstantNames.review,
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            controller: reviewController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: ConstantNames.writeYourReview.tr(),
              hintStyle: TextStyle(color: Colors.white60),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            maxLines: 4,
          ),
          SizedBox(height: 20),
          SfSlider(
            min: 0,
            max: 5,
            value: ratingValue,
            interval: 1,
            stepSize: 1,
            showTicks: true,
            showLabels: true,
            labelFormatterCallback: (dynamic actualValue, String formattedText) {
              return actualValue.toInt().toString();
            },
            thumbShape: SfThumbShape(),
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
            onChanged: onRatingChanged,
          ),
        ],
      ),
    );
  }
}
