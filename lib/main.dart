import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(MaterialApp(
    home: MyPage(),
  ));
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFiles;

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
       body: Container(
           alignment: Alignment.center,
           padding: EdgeInsets.all(20),
           child: Column(
             children: [
               ElevatedButton(
                 onPressed: () {
                   _getFromGallery();
                 },
                 child: Text('PICK FROM GALLERY'),
               ),
               Divider(),
               Text('Picked Files: '),
               Divider(),
               imageFiles != null
               ? Wrap(children: imageFiles!.map((image) {
                 return Container(
                   child: Card(
                     child: Container(
                       height: 100,
                         width: 100,
                         child: Image.file(File(image.path))
                     ),
                   ),
                 );
               }).toList())
                   :Container()
             ],
           ),
         )
      );
  }

  _getFromGallery() async {

    final pickedFiles = await imagePicker.pickMultiImage();
    if(pickedFiles != null) {
      imageFiles = pickedFiles;
      setState(() {

      });
    }
  }
}



