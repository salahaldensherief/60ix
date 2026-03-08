import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter_section_name_widget.dart';

class RatingWidget extends StatelessWidget {
  RatingWidget({super.key});
  final List<String> ratings = ['+1', '+2', '+3', '+4', '5'];
  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionNameWidget(),
        SizedBox(height: 8.h,),
        SizedBox(
          height: 40,
          child: ListView.builder(

            scrollDirection: Axis.horizontal,
            itemCount: ratings.length,
            itemBuilder: (context, index) {
              return _buildRatingItem(ratings[index], index);
            },
          ),
        ),
      ],
    );
  }
}

Widget _buildRatingItem(String rating, int index) {

  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(Icons.star, size: 18, color: Colors.orangeAccent),
          SizedBox(width: 6),
          Text(rating),
        ],
      ),
    ),
  );
}
