import 'package:ex/constants/app_icons.dart';

import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class SearchField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const SearchField({
    required this.hintText,
    required this.onChanged,
    super.key,
  });
  @override
  State<StatefulWidget> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 16,
        ),
        prefixIcon: SizedBox(
          width: 22,
          child: Center(
            child: Image.asset(
              AppIcons.search,
              width: 20,
              height: 20,
            ),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        filled: true,
        fillColor: AppColors.hex181818,
      ),
      onChanged: widget.onChanged,
    );
  }
}
