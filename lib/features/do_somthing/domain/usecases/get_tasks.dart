import 'package:not_get_bored/core/resources/data_state.dart';
import 'package:not_get_bored/core/usecases/usecase.dart';
import 'package:not_get_bored/features/do_somthing/domain/entities/tasks.dart';
import 'package:not_get_bored/features/do_somthing/domain/repository/tasks_repository.dart';

class GetTasksUseCase implements UseCase<DataState<TasksEntitie>,void>{
  final TasksRepository _tasksRepository;
  GetTasksUseCase(this._tasksRepository);
  @override
  Future<DataState<TasksEntitie>> call({void params}) {
    return _tasksRepository.getTasks();
  }

}