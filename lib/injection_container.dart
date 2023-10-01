import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:not_get_bored/features/do_somthing/data/repository/tasks_repository_impl.dart';
import 'package:not_get_bored/features/do_somthing/domain/repository/tasks_repository.dart';
import 'package:not_get_bored/features/do_somthing/domain/usecases/get_tasks.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/remote/remote_task_bloc.dart';

import 'features/do_somthing/data/data_sources/remote/tasks_api_service.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {

  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<TasksApiService>(TasksApiService(sl()));
  sl.registerSingleton<TasksRepository>(
    TasksRepositoryImpl(sl())
  );
  sl.registerSingleton<GetTasksUseCase>(
    GetTasksUseCase(sl())
  );
  sl.registerFactory<RemoteTasksBloc>(() => RemoteTasksBloc(sl()));
}