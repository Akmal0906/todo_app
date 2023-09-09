

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AccountScreen extends StatefulWidget {
  const  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  File? imageFile;

  _imgFromGallery() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      imageFile = File(image!.path);
    });
  }

  _imgFromCamera() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      imageFile = File(image!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               imageFile==null? Image.asset('assets/images/advice5.jpg',fit: BoxFit.cover,):
                   ClipRRect(
                     borderRadius: BorderRadius.circular(12),
                     child: Image.file(imageFile!,height: 200,width: 200,fit: BoxFit.cover,),
                   ),
           Container(
             margin:const  EdgeInsets.only(left: 10,right: 10),
             height:24,
             width: double.infinity,

             child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.indigo,
                   shadowColor:Colors.green,
                   shape: const CircleBorder(
                     side: BorderSide(
                       width: 1,
                       color: Colors.yellow,

                     )
                   )

                 ),
                 onPressed: (){
               _showBottomSheet();
             }, child: const  Text('Select Image',style: TextStyle(color: Colors.white,fontSize: 17),)),
           )
          ],
        ),
      )

    );
  }
  _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text("Gallery"),
                leading: IconButton(
                    onPressed: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.image)),
              ),
              ListTile(
                title: const Text("Camera"),
                leading: IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }
}
