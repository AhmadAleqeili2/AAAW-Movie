import 'package:flutter/material.dart';

class EpisodeTile extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback WatchButton;
  final VoidCallback DownloadButton;
  EpisodeTile({
    Key? key,
    required this.image,
    this.title = "",
    required this.DownloadButton
    ,required this.WatchButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // الصورة أقصى اليسار
          GestureDetector(
            onTap:WatchButton,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image, // رابط الصورة
                width: MediaQuery.of(context).size.height * 0.12,
                height: MediaQuery.of(context).size.height * 0.12,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),

          // العنوان في الأعلى والأيقونات أسفله
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 11),
                Column(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildIconWithText(Icons.calendar_today, "5/12/2024"),
                    _buildIconWithText(Icons.timer, "21:50"),
                    _buildIconWithText(Icons.star, "4.8/5"),
                  ],
                ),
              ],
            ),
          ),
          // إضافة الخط العمودي قبل الزر
          VerticalDivider(),
          
          // الزر الأخير على اليمين
          IconButton(
            icon: Icon(Icons.download),
            onPressed:DownloadButton
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey[400],
          size: 11,
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
