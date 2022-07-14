import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';
import '../widgets/task_list_widget.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Chip(label: Text('${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed')),
                ),
                TaskList(taskList: taskList)
              ],
            ),
          ),
        );
      },
    );
  }
}
