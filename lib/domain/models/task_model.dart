class TaskModel {
  final String taskTime;
  final String task;
  final String description;

  TaskModel({this.task = '', this.description = '', this.taskTime = ''});

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
}
