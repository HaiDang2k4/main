import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_colors.dart';
import '../constants/app_icons.dart';

/// PrimaryAppBar là một AppBar tùy chỉnh
class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {

  const PrimaryAppBar({
    required this.title,
    required this.onBack,
    super.key,
  });
  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: AppColors.hex020206,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Text(
        title, /// Tiêu đề của AppBar
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ), /// Kiểu chữ của tiêu đề
      ), /// Tiêu đề của AppBar
      leadingWidth: 68, /// Chiều rộng của nút điều hướng
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12), /// Khoảng cách giữa nút điều hướng và mép của AppBar
        child: GestureDetector(
          onTap: onBack,
          child: SizedBox(
            width: 44, 
            height: 44,
            child: Center(
              child: Image.asset(
                AppIcons.back,
                width: 29,
                height: 29,
              ),
            ),
          ),
        ),
      ),
      titleSpacing: 20, /// Khoảng cách giữa tiêu đề và nút điều hướng
      centerTitle: true, /// Căn giữa tiêu đề
    );
  }

  /// Kích thước ưu tiên của AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); /// Chiều cao của AppBar
}
