import 'package:flutter/material.dart';

class AdviceWidget extends StatelessWidget {
  final int indexx;

  const AdviceWidget({super.key, required this.indexx});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        textDirection: TextDirection.ltr,
        children:[ Container(
          margin: const EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 30),
          decoration: BoxDecoration(
            //color: Colors.blue,
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage('assets/images/advice${indexx.toString()}.jpg'),fit: BoxFit.cover
              )),
          child: Center(
            child: Text(
              '$indexx Advice Widget',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        const Positioned(
            bottom: 4,
            left:2,
            child: SizedBox(
                height: 24,
                child: CircleAvatar(backgroundImage: AssetImage('assets/images/advice0.jpg',),))),
          const Positioned(
              bottom: 4,
              left:20,
              child: SizedBox(
                  height: 24,
                  child: CircleAvatar(backgroundImage: AssetImage('assets/images/advice1.jpg',),))),
          const Positioned(
              bottom: 4,
              left:32,
              child: SizedBox(
                  height: 24,
                  child: CircleAvatar(backgroundImage: AssetImage('assets/images/advice2.jpg',),))),
        ]
      ),
    );
  }
}
