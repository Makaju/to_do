import 'package:flutter/material.dart';
import 'package:to_do/screens/recycle_bin.dart';
import 'package:to_do/screens/tabs_screen.dart';
import 'package:to_do/screens/pending_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) => TabsScreen(),
        );
      case PendingTasksScreen.id:
        return MaterialPageRoute(
          builder: (_) => const PendingTasksScreen(),
        );
      default:null;
    }
  }
}
