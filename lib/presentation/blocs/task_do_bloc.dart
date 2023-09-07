
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/local_storage.dart';
import 'package:todo_app/domain/models/task_model.dart';

part 'task_do_event.dart';

part 'task_do_state.dart';

class TaskDoBloc extends Bloc<TaskDoEvent, TaskDoState> {
  LocalStorage localStorage;

  TaskDoBloc(this.localStorage) : super(const TaskDoInitial(taskModels: [])) {
    on<AddEvent>(_addTask);
    on<DeleteEvent>(_deleteTask);
  }

  void _addTask(AddEvent event, Emitter<TaskDoState> emit) {
    final state = this.state;

    if (state is TaskDoInitial) {
      emit(TaskLoaded(taskModels: List.from([event.taskModel])));
      LocalStorage().saveTask(List.from([event.taskModel.toString()]));
    } else if (state is TaskLoaded) {
      emit(TaskLoaded(
          taskModels: List.from(state.taskModels)..add(event.taskModel)));
      List<String> list = [];
      for (var element in state.taskModels) {
        list.add(element.toString());
      }
      list.add(event.taskModel.toString());
      LocalStorage().saveTask(list);
      if (kDebugMode) {
        print('BLOC PREFS $list');
      }
    }
  }

  void _deleteTask(DeleteEvent event, Emitter<TaskDoState> emit) {
    final state = this.state;
    if (state is TaskLoaded) {
      List<TaskModel> list =
          state.taskModels.where((x) => x != event.taskModel).toList();
      emit(TaskLoaded(taskModels: list));
      List<String> listnew = [];
      for (var element in list) {
        listnew.add(element.toString());
      }
      LocalStorage().saveTask(listnew);
    }
  }
}
