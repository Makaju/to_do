import 'package:flutter/material.dart';

import '../models/task.dart';
import 'edit_task_bottom_sheet.dart';

class PopUpMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  final Task task;

  const PopUpMenu(
      {Key? key,
      required this.cancelOrDeleteCallback,
      required this.likeOrDislikeCallback,
      required this.task,
      required this.editTaskCallback,
      required this.restoreTaskCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                      onTap: null,
                      child: TextButton.icon(
                          onPressed: editTaskCallback,
                          icon: Icon(Icons.edit),
                          label: Text('Edit'))),
                  PopupMenuItem(
                      onTap: likeOrDislikeCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: task.isFavorite == false
                              ? Icon(Icons.bookmark_add_outlined)
                              : Icon(Icons.bookmark_remove),
                          label: task.isFavorite == false
                              ? Text('Add to \nBookmark')
                              : Text('Remove from \nBookmark'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.delete),
                          label: Text('Delete'))),
                ])
            : ((context) => [
                  PopupMenuItem(
                      onTap: restoreTaskCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.restore_from_trash),
                          label: Text('Restore'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.delete_forever),
                          label: Text('Delete Forever'))),
                ]));
  }
}
