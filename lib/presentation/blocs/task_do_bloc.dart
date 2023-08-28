import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/models/task_model.dart';

part 'task_do_event.dart';
part 'task_do_state.dart';

class TaskDoBloc extends Bloc<TaskDoEvent, TaskDoState> {
  TaskDoBloc() : super(TaskDoInitial()) {
    on<AddEvent>(_addTask);
    on<DeleteEvent>(_deleteTask);
  }

  void _addTask(AddEvent event,Emitter<TaskDoState> emit){
    final state=this.state;
    if(state is TaskDoInitial){
      emit(TaskLoaded(taskModels: List.from([event.taskModel])));
    }else if(state is TaskLoaded){
      emit(TaskLoaded(taskModels: List.from(state.taskModels)..add(event.taskModel)));
    }
  }

  void _deleteTask(DeleteEvent event,Emitter<TaskDoState> emit){
    final state=this.state;
   if(state is TaskLoaded){
     List<TaskModel> list=state.taskModels.where((x) => x!=event.taskModel).toList();
     emit(TaskLoaded(taskModels: list));
    }
  }
}
