import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../widgets/task_list_widget.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            onTap: () =>
                                context.read<TasksBloc>().add(DeleteAllTask()),
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.delete_forever),
                                label: Text('Delete all forever')))
                      ]),
            ],
          ),
          drawer: MyDrawer(),
          body: SafeArea(
            child: Column(
              children: [
                Center(
                  child:
                      Chip(label: Text('${state.removedTasks.length} Tasks')),
                ),
                TaskList(taskList: state.removedTasks)
              ],
            ),
          ),
        );
      },
    );
  }
}
