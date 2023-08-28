part of 'task_do_bloc.dart';

abstract class TaskDoState extends Equatable {
  const TaskDoState();
}

class TaskDoInitial extends TaskDoState {
  @override
  List<Object> get props => [];
}

final class TaskLoading extends TaskDoState{
  final TaskModel taskModel;

const  TaskLoading({required this.taskModel});
  @override
  List<Object> get props => [];
}
 final class TaskLoaded extends TaskDoState{
final  List<TaskModel> taskModels;
const  TaskLoaded({required this.taskModels});
  @override
  List<Object> get props => [taskModels];
}
final class TaskUpdate extends TaskDoState{
  @override
  List<Object> get props => [];
}
