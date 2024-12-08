import 'package:ex/constants/app_colors.dart';
import 'package:ex/screens/home/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_images.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearchChanged;

  const HomeAppBar({
    required this.onSearchChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.hex020206,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: const Text(
        'You have got 5 tasks\ntoday to complete ✍️ ',
        maxLines: 2,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleSpacing: 10,
      actions: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(22.5)),
          child: Image.asset(
            AppImages.goku,
            width: 45,
            height: 55,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(41),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: SearchField(
            hintText: 'Search Task Here',
            onChanged: onSearchChanged,
          ),
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
