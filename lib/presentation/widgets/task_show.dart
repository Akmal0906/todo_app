import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_do_bloc.dart';

class ShowTask extends StatelessWidget {
  final String name;
  final String taskTime;
  final Icon? icon;
  final int index;

  const ShowTask({super.key, this.name = '', this.taskTime = '', this.icon,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color(0xff1f2534),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(4, 4),
            )
          ]

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(

            children: [
              const Icon(Icons.ring_volume, size: 24,),
              const SizedBox(width: 22,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(name == '' ? 'Project Meeting' : name,
                    style: const TextStyle(color: Colors.white),),
                  const Text(
                      '9 am to 11 am', style: TextStyle(color: Colors.white)),

                ],
              ),
            ],
          ),

          BlocBuilder<TaskDoBloc, TaskDoState>(
            builder: (context, state) {
              if(state is TaskLoaded){
              return PopupMenuButton<MenuValues>(
                icon: const Icon(
                  Icons.more_vert, size: 24, color: Colors.white,),
                itemBuilder: (context) =>
                [
                  const PopupMenuItem(value: MenuValues.complited,child: Text('Complited'),),
                  const PopupMenuItem(value: MenuValues.delete,child: Text('Delete'),),
                  const PopupMenuItem(value: MenuValues.update,child: Text('update'),),

                ],
                onSelected: (value) {
                  switch (value) {
                    case MenuValues.complited:

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('A Complited has been shown.'),
                        ),
                      );
                      print('case 1');
                      break;
                    case MenuValues.delete:
                      context.read<TaskDoBloc>().add(DeleteEvent(taskModel: state.taskModels[index]));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('A Delete has been shown.'),
                        ),
                      );
                      break;
                    case MenuValues.update:
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('A Update has been shown.'),
                        ),
                      );
                      break;
                  }
                },
              );}
              else {
                return const Center(
                  child: Text('Show Task Page'),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

enum MenuValues{
  delete,
  complited,
  update
}