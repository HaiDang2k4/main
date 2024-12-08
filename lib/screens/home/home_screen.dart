import 'package:ex/data/models/TaskPriority.dart';
import 'package:ex/data/models/TaskStatus.dart';
import 'package:ex/data/models/task_model.dart';
import 'package:ex/screens/home/widgets/add_button.dart';
import 'package:ex/screens/home/widgets/header_item.dart';
import 'package:ex/screens/home/widgets/home_app_bar.dart';
import 'package:ex/screens/home/widgets/progress_item.dart';
import 'package:ex/screens/home/widgets/task_item.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../new_task/new_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tasksModels = <TaskModel>[
    TaskModel(
        id: 1,
        name: 'Mobile App Research',
        description: 'Mobile App Research',
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        date: DateTime.now(),
        priority: TaskPriority.high,
        taskStatus: TaskStatus.complete),
    TaskModel(
      id: 2,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
    ),
    TaskModel(
      id: 3,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
  ];
  final tomorrowTasks = <TaskModel> [
    TaskModel(
      id: 4,
      name: 'Website Research',
      description: 'Website Research',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
    TaskModel(
      id: 5,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.incomplete,
    ),
    TaskModel(
      id: 6,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: HomeAppBar(onSearchChanged: (value) {
        debugPrint("Search Text changed: $value");
      }),
      body: SingleChildScrollView(
        child: Column(

          children: [
            const HeaderItem(title: 'Progress'),
            const ProgressItem(
              numberOfTask: 3,
              numberOfCompletedTask: 2,
            ),
            const HeaderItem(title: "Today's Task"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: tasksModels
                  .map(
                    (taskModel) => TaskItem(
                  taskModel: taskModel,
                  onStatusChanged: (taskStatus) {
                    final index = tasksModels.indexWhere(
                          (e) => e.id == taskModel.id,
                    );
                    setState(() {
                      tasksModels[index] = taskModel.copyWith(
                        taskStatus: taskStatus,
                      );
                    });
                  },
                ),
              )
                  .toList(),
            ),
            const HeaderItem(title: "Tomorrow Task"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: tomorrowTasks
                  .map(
                    (taskModel) => TaskItem(
                  taskModel: taskModel,
                  onStatusChanged: (taskStatus) {
                    final index = tomorrowTasks.indexWhere(
                          (e) => e.id == taskModel.id,
                    );
                    setState(() {
                      tomorrowTasks[index] = taskModel.copyWith(
                        taskStatus: taskStatus,
                      );
                    });
                  },
                ),
              )
                  .toList(),
            ),
          ],
        ),

      ),

      floatingActionButton: AddButton(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const NewTaskScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
