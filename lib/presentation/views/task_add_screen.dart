import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/models/task_model.dart';

import '../blocs/task_do_bloc.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  late TextEditingController taskController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskController = TextEditingController();
    descriptionController = TextEditingController();
    timeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.only(left: 10, right: 8, top: 20),
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                        hintText: 'Task',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.indigo,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                width: 3, color: Colors.green
                            )
                        )
                    ),

                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.only(left: 10, right: 8, top: 20),
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),

                  child: TextField(
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.indigo,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                width: 3, color: Colors.green
                            )
                        )
                    ),

                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.only(left: 10, right: 8),
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),

                  child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                        hintText: 'Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.indigo,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                width: 3, color: Colors.green
                            )
                        )
                    ),

                  ),
                ),
                BlocBuilder<TaskDoBloc, TaskDoState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                  width: 2,
                                  color: Colors.greenAccent
                              )
                          )
                      ),
                      child: const Center(
                        child: Text(
                          'Add Event', style: TextStyle(fontSize: 18),),
                      ),
                      onPressed: () {
                        print('TASKADDSCREEN ${state.runtimeType}');
                        context.read<TaskDoBloc>().add(
                            AddEvent(taskModel: TaskModel(
                                task: taskController.text.trim(),
                                taskTime: timeController.text.trim(),
                                description: descriptionController.text
                                    .trim())));
                        Navigator.of(context).pop();
                      },
                    );
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}
