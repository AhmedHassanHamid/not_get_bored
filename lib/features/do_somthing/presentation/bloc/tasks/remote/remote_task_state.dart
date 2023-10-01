import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:not_get_bored/features/do_somthing/domain/entities/tasks.dart';

abstract class RemoteTasksState extends Equatable {
  final TasksEntitie? tasks;
  final DioException? error;
  const RemoteTasksState({this.tasks, this.error});

  @override
  List<Object> get props => [tasks ?? '', error ?? ''];
}

class RemoteTasksLoading extends RemoteTasksState {
  const RemoteTasksLoading();
}

class RemoteTasksDone extends RemoteTasksState {
  const RemoteTasksDone(TasksEntitie tasks) : super(tasks: tasks);
}

class RemoteTasksError extends RemoteTasksState {
  const RemoteTasksError(DioException error) : super(error: error);
}
