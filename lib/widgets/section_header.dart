import 'package:flutter/material.dart';

import '../utiles/colors.dart';

class SectionHeader extends StatelessWidget {
  final String sectionName;
  const SectionHeader({required this.sectionName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
     EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionName,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
          ),
          Text(
            'See All',
            style: TextStyle(fontSize: 14, color: Color(ColorsConst.mainColor)),
          )
        ],
      ),
    );
  }
}
