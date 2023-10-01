import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_get_bored/core/resources/data_state.dart';
import 'package:not_get_bored/features/do_somthing/domain/usecases/get_tasks.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/remote/remote_task_event.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/remote/remote_task_state.dart';

class RemoteTasksBloc extends Bloc<RemoteTasksEvent,RemoteTasksState>{

  final GetTasksUseCase _getTasksUseCase;
  //static RemoteTasksBloc get(context) => BlocProvider.of(context);

  RemoteTasksBloc(this._getTasksUseCase) : super(const RemoteTasksLoading()){
    on <GetTasks> (onGetTasks);
  }

  void onGetTasks(GetTasks event , Emitter<RemoteTasksState> emit) async{
    final dataState = await _getTasksUseCase();

    if (dataState is DataSuccess ) {
      print(dataState.data!.activity);
      emit(
        RemoteTasksDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(
        RemoteTasksError(dataState.error!)
      );
    }
  }
}