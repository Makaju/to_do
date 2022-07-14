import 'package:flutter/material.dart';
import 'package:to_do/widgets/task_tile.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Text\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: task.title,),
                      TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: task.description,),
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}

// Expanded(
// child: ListView.builder(
// itemCount: widget.taskList.length,
// itemBuilder: (context, index) {
// var task = widget.taskList[index];
// return TaskTile(task: task);
// }),
// );
