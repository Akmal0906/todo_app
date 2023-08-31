import 'package:equatable/equatable.dart';

class TaskModel extends Equatable{
  final String taskTime;
  final String task;
  final String description;

  const TaskModel({this.task = '', this.description = '', this.taskTime = ''});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        task: json['task'],
        taskTime: json['taskTime'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() => {
        'taskTime': taskTime,
        'task': task,
        'description': description,
      };

  TaskModel copyWith({
    String? taskTime,
    String? task,
    String? description,
  }) {
    return TaskModel(
      taskTime: taskTime ?? this.taskTime,
      task: task ?? this.task,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [
    task,taskTime,description
  ];
}
