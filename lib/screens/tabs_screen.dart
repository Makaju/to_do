import 'package:flutter/material.dart';
import 'package:to_do/screens/completed_tasks.dart';
import 'package:to_do/screens/favorite_tasks.dart';
import 'package:to_do/screens/my_drawer.dart';
import 'package:to_do/screens/pending_screen.dart';
import '../widgets/add_task_bottem_sheet_widget.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingTasksScreen(), 'title': 'Pending Task'},
    {'pageName': CompletedTasksScreen(), 'title': 'Completed Task'},
    {'pageName': FavoriteTasksScreen(), 'title': 'Favorite Task'},
  ];

  var _selectedIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      constraints: BoxConstraints(minHeight: 600),
      context: context,
      builder: (context) => Wrap(
        children: [
          SingleChildScrollView(child: AddTaskBottomSheet()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedIndex]['title']),
        actions: [
          IconButton(
              onPressed: () => _addTask(context),
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_selectedIndex]['pageName'],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                _addTask(context);
              },
              tooltip: 'Add task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: 'Pending Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Task'),
        ],
      ),
    );
  }
}
