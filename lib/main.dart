import 'package:flutter/material.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/remote/remote_task_bloc.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/remote/remote_task_event.dart';
import 'package:not_get_bored/features/do_somthing/presentation/pages/home/home.dart';
import 'package:not_get_bored/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'features/do_somthing/presentation/bloc/tasks/darkTheme/remote_task_bloc.dart';
import 'features/do_somthing/presentation/bloc/tasks/darkTheme/remote_task_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteTasksBloc>(
          create: (context) => sl()..add(const GetTasks()),
        ),
        BlocProvider(
          create: (context) => DarkThemeBloc(),
        ),
      ],
      child: BlocBuilder<DarkThemeBloc, DarkThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            home: const Home(),
          );
        },
      ),
    );
  }
}
