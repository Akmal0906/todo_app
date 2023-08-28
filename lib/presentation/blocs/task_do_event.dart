part of 'task_do_bloc.dart';

abstract class TaskDoEvent extends Equatable {
  const TaskDoEvent();
}

final class AddEvent extends TaskDoEvent{
  final TaskModel taskModel;
  const AddEvent({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}
final class DeleteEvent extends TaskDoEvent{
  final TaskModel taskModel;
  const DeleteEvent({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}
final class UpdateEvent extends TaskDoEvent{
  final TaskModel taskModel;
  const UpdateEvent({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];
}


