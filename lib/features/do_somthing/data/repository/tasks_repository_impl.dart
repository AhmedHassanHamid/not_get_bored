import 'dart:io';
import 'package:dio/dio.dart';
import 'package:not_get_bored/core/resources/data_state.dart';
import 'package:not_get_bored/features/do_somthing/data/models/tasks.dart';
import 'package:not_get_bored/features/do_somthing/domain/repository/tasks_repository.dart';

import '../data_sources/remote/tasks_api_service.dart';

class TasksRepositoryImpl implements TasksRepository {
  final TasksApiService _tasksApiService;
  TasksRepositoryImpl(this._tasksApiService);
  @override
  Future<DataState<TasksModel>> getTasks() async {
    try {
      final httpResponse = await _tasksApiService.getTasks();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          //type: DioException.response,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
