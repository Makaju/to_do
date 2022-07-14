import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do/blocs/switch_bloc/switch_bloc.dart';
import 'package:to_do/screens/tabs_screen.dart';
import 'package:to_do/screens/pending_screen.dart';
import 'package:to_do/services/app_router.dart';
import 'package:to_do/services/app_theme.dart';

import 'blocs/tasks_bloc/tasks_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storaged = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
        () =>
        runApp(
          MyApp(
            appRouter: AppRouter(),
          ),
        ),
    storage: storaged,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
              title: 'Flutter Task App',
              theme: state.switchValue ?
              AppThemes.appThemeData[AppTheme.darkTheme] :
              AppThemes.appThemeData[AppTheme.lightTheme],
              home: TabsScreen(),onGenerateRoute
          :
          appRouter
          .
          onGenerateRoute
          ,
          );
        },
      ),
    );
  }
}
