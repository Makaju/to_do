import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/services/guid_gen.dart';

import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';

// ignore: must_be_immutable
class AddTaskBottomSheet extends StatelessWidget {
  AddTaskBottomSheet({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
              controller: titleController,
            ),
          ),
          TextField(
            autofocus: true,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
            controller: descriptionController,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      var task = Task(title: titleController.text,description: descriptionController.text, id: GUIDGen.generate(), date: DateTime.now().toString());
                      context.read<TasksBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: const Text('Add')),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
