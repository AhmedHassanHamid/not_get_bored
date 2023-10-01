import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_get_bored/config/theme/color.dart';
import 'package:not_get_bored/features/do_somthing/domain/entities/tasks.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/darkTheme/remote_task_bloc.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/remote/remote_task_bloc.dart';
import 'package:share_plus/share_plus.dart';
import '../../bloc/tasks/darkTheme/remote_task_state.dart';
import '../../bloc/tasks/remote/remote_task_event.dart';
import '../../bloc/tasks/remote/remote_task_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var size, height, width;
  late final TasksEntitie? task;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(child: Scaffold(body: _buildBody()));
  }

  _buildBody() {
    return BlocBuilder<RemoteTasksBloc, RemoteTasksState>(
      builder: (_, state) {
        if (state is RemoteTasksLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteTasksError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteTasksDone) {
          final currentTask = state.tasks!.activity;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<DarkThemeBloc, DarkThemeState>(
                builder: (context, state) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: width / 20, top: height / 30),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // DarkThemeBloc().onDarkTheme();
                          // print(DarkThemeBloc().isDark);
                        });
                      },
                      icon: Icon(CupertinoIcons.quote_bubble_fill,
                          size: width / 10),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 20, top: height / 5),
                child: Text(
                  currentTask.toString(),
                  style: TextStyle(
                    fontSize: width / 8, // Adjust the font size
                    fontWeight:
                        FontWeight.bold, // FontWeight.bold for bold text
                    color: Colors.black, // Text color
                    letterSpacing: 1.2, // Spacing between letters
                    fontStyle: FontStyle.italic, // Italicize the text
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                    left: width / 20, right: width / 20, bottom: height / 60),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          final remoteTasksBloc =
                              BlocProvider.of<RemoteTasksBloc>(context);
                          // Call onGetTasks by dispatching the GetTasks event
                          remoteTasksBloc.add(GetTasks());
                        });
                      },
                      child: Text(
                        "I don't feel like it",
                        style: TextStyle(
                          fontSize: width / 25, // Adjust the font size
                          fontWeight:
                              FontWeight.bold, // FontWeight.bold for bold text
                          color: AppColor.secondaryText, // Text color
                          letterSpacing: 1.2, // Spacing between letters
                          fontStyle: FontStyle.italic, // Italicize the text
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Share.share(
                              "“ ${currentTask!} „ \n This a Task From Not Get Bored App");
                        },
                        icon: Icon(CupertinoIcons.share))
                  ],
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       //state.tasks!.activity;
              //       //print(state.tasks!.activity);
              //       setState(() {
              //         final remoteTasksBloc =
              //             BlocProvider.of<RemoteTasksBloc>(context);

              //         // Call onGetTasks by dispatching the GetTasks event
              //         remoteTasksBloc.add(GetTasks());
              //       });
              //     },
              //     child: Text("I don't feel like it"))
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
