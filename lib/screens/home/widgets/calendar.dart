import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({
    super.key,
    required this.day,
    required this.weekDay,
    required this.isSelected,
  });
  final String weekDay;
  final String day;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 58,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? AppColors.hexBA83DE : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  weekDay,
                  style: TextStyle(
                    fontSize: 15,
                    color: isSelected
                        ? AppColors.hexBA83DE
                        : Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 15,
                    color: isSelected
                        ? AppColors.hexBA83DE
                        : Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -3,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: isSelected ? AppColors.hexBA83DE : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}