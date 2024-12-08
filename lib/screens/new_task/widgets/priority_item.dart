import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../commom_widget/secondary_button.dart';
import '../../../data/models/TaskPriority.dart';

class PriorityItem extends StatelessWidget {

  const PriorityItem({
    required this.selectedTaskPriority,
    required this.taskPriorities,
    required this.onTaskPriorityChanged,
    super.key,
  });

  final TaskPriority? selectedTaskPriority;
  final List<TaskPriority> taskPriorities;
  /// Hàm được gọi khi người dùng thay đổi mức ưu tiên
  final ValueChanged<TaskPriority> onTaskPriorityChanged;

  /// Hàm build chứa nội dung của PriorityItem
  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];


    for (int i = 0; i < taskPriorities.length; i++) {

      children.add(
        Expanded(
          child: SecondaryButton(
            title: taskPriorities[i].title,
            isSelected: selectedTaskPriority == taskPriorities[i],
            color: taskPriorities[i].color,
            onTap: () {
              onTaskPriorityChanged.call(taskPriorities[i]);
            },
          ),
        ),
      );

      /// Nếu chưa phải mức ưu tiên cuối cùng thì thêm một khoảng cách
      if (i < taskPriorities.length - 1) {
        children.add(const SizedBox(width: 10)); /// Khoảng cách giữa các widget con
      }
    }

    /// Trả về một Column chứa các widget con theo chiều dọc
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, /// Canh lề của các widget con theo chiều ngang
      children: [ /// Danh sách các widget con
        Text( /// Chứa tiêu đề
          'Priority', /// Tiêu đề
          style: TextStyle( /// Kiểu chữ của tiêu đề
            color: Colors.white.withOpacity(0.8), /// Màu chữ của tiêu đề
            fontSize: 20, /// Kích thước chữ của tiêu đề
          ),
        ),
        const SizedBox( /// Khoảng cách giữa các widget con
          height: 8, /// Khoảng cách theo chiều dọc
        ),
        Row( /// Row là một widget chứa các widget con theo chiều ngang chứa các nút mức ưu tiên
          children: children, /// Danh sách các widget con
        ),
        const SizedBox( /// Khoảng cách giữa các widget con
          height: 8, /// Khoảng cách theo chiều dọc
        ),
      ],
    );
  }
}
