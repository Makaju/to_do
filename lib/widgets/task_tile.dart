import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do/widgets/pop_up_menu.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';
import 'edit_task_bottom_sheet.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext cxt, Task task) {
    task.isDeleted!
        ? cxt.read<TasksBloc>().add(DeleteTask(task: task))
        : cxt.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      constraints: BoxConstraints(minHeight: 600),
      context: context,
      builder: (context) => Wrap(
        children: [
          SingleChildScrollView(
              child: EditTaskBottomSheet(
            oldTask: task,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          task.isFavorite == false
              ? Icon(Icons.star_outline)
              : Icon(Icons.star),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      decoration:
                          task.isDone! ? TextDecoration.lineThrough : null),
                ),
                Text(DateFormat()
                    .add_yMMMd()
                    .add_Hm()
                    .format(DateTime.parse(task.date))),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    task.isDeleted == false
                        ? context.read<TasksBloc>().add(UpdateTask(task: task))
                        : null;
                  }),
              PopUpMenu(
                cancelOrDeleteCallback: () =>
                    _removeOrDeleteTask(context, task),
                task: task,
                likeOrDislikeCallback: () => context
                    .read<TasksBloc>()
                    .add(MarkFavoriteOrUnfavoriteTask(task: task)),
                editTaskCallback: () {
                  Navigator.of(context).pop();
                  _editTask(context);
                },
                restoreTaskCallback: () =>
                    context.read<TasksBloc>().add(RestoreTask(task: task)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//
// ListTile(
// onLongPress:
// () => _removeOrDeleteTask(context, task),
// title: Text(
// task.title,overflow: TextOverflow.ellipsis, style: TextStyle(
// decoration: task.isDone! ? TextDecoration.lineThrough : TextDecoration
//     .none),),
// trailing: Checkbox(
// value: task.isDone,
// onChanged: (value) {
// context.read<TasksBloc>().add(UpdateTask(task: task));
// },
// ),
// );
