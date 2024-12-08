import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class HeaderItem extends StatelessWidget {
  final String title;
  const HeaderItem({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'See All',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.hexBA83DE,
            ),
          )
        ],
      ),
    );
  }
}
