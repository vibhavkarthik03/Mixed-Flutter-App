import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:oktoast/oktoast.dart';
class thirdpage extends StatefulWidget {
  @override
  _thirdpageState createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  File imageFile;

   _openGallery(BuildContext context)async{
     var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
     this.setState(() {
       imageFile=picture;
     });
     Navigator.of(context).pop();
   }
   _openCamera(BuildContext context)async{
     var picture = await ImagePicker.pickImage(source: ImageSource.camera);
     this.setState(() {
       imageFile=picture;
     });
     Navigator.of(context).pop();
   }
  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder:(BuildContext context){
        return AlertDialog(
          title:Text("Choose from") ,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: (){
                    _openGallery(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: (){
                    _openCamera(context);
                  },
                ),
              ],
            ),
          ),
        );
    });
  }
  Widget _decideImageView(){
    if(imageFile == null){
      return Text("No Image Selected");
    }else{
      return
      Image.file(imageFile,width :400,height: 400);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image screen'),
    ),
      body: Container(
        child:Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            children:<Widget> [
              _decideImageView(),
              RaisedButton(onPressed:() {
               _showChoiceDialog(context);
              },child:Text('Select Image') ,)
            ],
          ),
        ) ,
      ) ,
    );
  }
}
