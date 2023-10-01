import 'package:dio/dio.dart';
import 'package:not_get_bored/features/do_somthing/data/models/tasks.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants.dart/constants.dart';
part 'tasks_api_service.g.dart';


@RestApi(baseUrl: tasksURL)
abstract class TasksApiService {
  factory TasksApiService(Dio dio) = _TasksApiService;

  @GET('/activity')
  Future<HttpResponse<TasksModel>> getTasks();
}