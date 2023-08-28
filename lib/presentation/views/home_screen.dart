import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/widgets/advice_widget.dart';

import '../blocs/task_do_bloc.dart';
import '../widgets/task_show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f2534),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.toc)),
                    const Text(
                      'Schedule',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const CircleAvatar(
                      backgroundImage:
                      AssetImage('assets/images/home_image.jpg'),
                      radius: 20,
                    ),
                  ],
                ),
                const Text(
                  'Hi Lucy',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Good morning',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 10, bottom: 12),
                  child: AdviceWidget(indexx: index),
                );
              },
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeIn,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                        isPressed ? const Color(0xff1f2534) : Colors.white,
                      ),
                      child: Text(
                        'Task List',
                        style: TextStyle(
                            color: isPressed ? Colors.white : Colors.black),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeIn,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:
                        isPressed ? Colors.white : const Color(0xff1f2534),
                      ),
                      child: Text(
                        'Task Complited',
                        style: TextStyle(
                            color: isPressed ? Colors.black : Colors.white),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TaskDoBloc, TaskDoState>(
              builder: (context, state) {
                print('HOMESCREEN ${state.runtimeType}');
                if (state is TaskDoInitial) {
                  return const Center(
                    child: Text(
                      'Yet did not add task', style: TextStyle(color: Colors
                        .cyanAccent, fontSize: 22),),
                  );
                } else if (state is TaskLoaded) {
                  return SizedBox(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.taskModels.length,
                      itemBuilder: (context, index) {
                        return ShowTask(
                          name: state.taskModels[index].task,
                          taskTime: state.taskModels[index].taskTime,
                          icon: Icon(Icons.add),
                          index: index,
                        );
                      },
                    ),
                  );
                }
                return const Center(child: Text('Something went wrong',
                  style: TextStyle(color: Colors.cyanAccent, fontSize: 22),));
              },
            ),
          ),
        ],
      ),
    );
  }
}
