import 'package:not_get_bored/features/do_somthing/domain/entities/tasks.dart';

import '../../../../core/resources/data_state.dart';

abstract class TasksRepository {
  Future<DataState<TasksEntitie>> getTasks();
}