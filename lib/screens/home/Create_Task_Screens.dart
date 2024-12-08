import 'package:ex/commom_widget/primary_app.dart';
import 'package:ex/constants/app_colors.dart';
import 'package:ex/constants/app_icons.dart';
import 'package:ex/data/models/TaskPriority.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../commom_widget/primary_button.dart';
import '../new_task/widgets/input_field.dart';
import '../new_task/widgets/priority_item.dart';
import '../new_task/widgets/time_picker.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TaskPriority? selectedTaskPriority;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: AppColors.hex020206,
          appBar: AppBar(
            backgroundColor: AppColors.hex020206, // Màu nền AppBar
            elevation: 0, // Loại bỏ hiệu ứng nổi
            leading: GestureDetector(
              onTap: () {
                // Chức năng quay lại - Hiện tại không làm gì cả
              },
              child: const Icon(Icons.arrow_back, color: Colors.white), // Icon quay lại
            ),
            title: const Text(
              "Create new task", // Tiêu đề AppBar
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16), // Lề ngang của màn hình
                child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_back_ios, color: Colors.white),
                            Text(
                              "04 Mar - 11 Mar",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                          ],
                        ),
                      ),
                      //
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // Chia đều các ngày
                          children: List.generate(7, (index) {
                            final days = [
                              'Mon',
                              'Tue',
                              'Wed',
                              'Thu',
                              'Fri',
                              'Sat',
                              'Sun'
                            ]; // Tên ngày
                            final dates = [
                              '04',
                              '05',
                              '06',
                              '08',
                              '09',
                              '10',
                              '11'
                            ]; // Ngày
                            final isSelected =
                                index == 3; // Đánh dấu ngày được chọn (thứ 5)
                            return InkWell(
                              onTap: () {
                                // Sự kiện khi bấm vào ngày (hiện tại chưa làm gì)
                              },
                              child: Column(
                                children: [
                                  Text(
                                    days[index], // Hiển thị tên ngày
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey, // Đổi màu ngày được chọn
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                      height: 4), // Khoảng cách giữa ngày và số
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: isSelected? Colors.purple : Colors.transparent, // Nền tím nếu được chọn
                                      border: isSelected
                                          ? Border.all(color: Colors.white)
                                          : null, // Viền trắng nếu được chọn
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      dates[index],
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Tiêu đề "Schedule"
                      const Text(
                        "Schedule",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 16),
                      // Ô nhập tên công việc
                      TextFormField(
                        style: const TextStyle(color: Colors.white), // Màu chữ
                        decoration: InputDecoration(
                          labelText: "Name", // Nhãn "Name"
                          labelStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[900], // Màu nền ô nhập
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8), // Góc bo tròn
                            borderSide: BorderSide.none, // Không có viền
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      //
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Description", // Nhãn "Description"
                          labelStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[900],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: TimePicker(
                                  title: 'Start Time',
                                  onTimeChanged: (time) {
                                    setState(() {
                                      startTime = time;
                                    });
                                  }, time: startTime?? TimeOfDay.now(),
                              )
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          Expanded(
                              child: TimePicker(
                                title: 'End Time',
                                onTimeChanged: (time) {
                                  setState(() {
                                    endTime = time;
                                  });
                                }, time: endTime?? TimeOfDay.now(),
                              )
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PriorityItem(
                          selectedTaskPriority: selectedTaskPriority,
                          taskPriorities: TaskPriority.values,
                          onTaskPriorityChanged: (taskPriority) {
                            setState(() {
                              selectedTaskPriority = taskPriority;
                            });
                          }
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Get alert for this task",
                            style: TextStyle(color: Colors.white,
                            fontSize: 18,),
                          ),
                          Switch(
                            value: true, // Trạng thái bật mặc định
                            onChanged: (value) {
                              // Sự kiện bật/tắt
                            },
                            activeColor: AppColors.hexA378FF,
                          ),
                        ],
                      ),
                      Material(
                        child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.hexBA83DE,
                              AppColors.hexDE83B0,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Center(
                          child: Text(
                            'Create Task',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),)


                    ]
                )
            ),
          )
      ),
    );
  }
}

