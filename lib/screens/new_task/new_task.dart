import 'package:ex/screens/new_task/widgets/input_field.dart';
import 'package:ex/screens/new_task/widgets/priority_item.dart';
import 'package:ex/screens/new_task/widgets/time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commom_widget/primary_app.dart';
import '../../commom_widget/primary_button.dart';
import '../../constants/app_colors.dart';
import '../../data/models/TaskPriority.dart';

class NewTaskScreen extends StatefulWidget {

  const NewTaskScreen({super.key});


  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}


class _NewTaskScreenState extends State<NewTaskScreen> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  TaskPriority? selectedTaskPriority;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: PrimaryAppBar(
          title: 'Create new task',
          onBack: () {
            Navigator.of(context).pop();
          },
        ),



        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          index == 3;
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
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Schedule',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 16,

                ),
                InputField(
                    hintText: 'Name',
                    onChanged: (vales) {},
                    maxLines: 2),
                const SizedBox(
                  height: 16,
                ),

                InputField(hintText: 'Description',
                    onChanged: (vales) {},
                    maxLines: 3),
                const SizedBox(
                  height: 16,),
                Row(
                  children: [
                    Expanded(
                        child: TimePicker(
                            title: 'Start Time',
                            onTimeChanged: (time) {
                              setState(() {
                                startTime = time;
                              });
                            }, time: startTime ?? const TimeOfDay(hour: 6, minute: 00),
                        )
                    ),
                    const SizedBox(
                      width: 16,
                      height: 16,
                    ),
                    Expanded(
                        child: TimePicker(
                            title: 'End Time',
                            time: endTime ?? const TimeOfDay(hour: 21, minute: 00),
                            onTimeChanged: (time) {
                              startTime = time;
                            })
                    ),
                    const SizedBox(
                      width: 16,
                      height: 16,
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
                  },
                ),
                PrimaryButton(
                  title: 'Create Task',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),),
        )
        ),

      );
  }
}
