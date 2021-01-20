import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Url launcher'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            RaisedButton(child: Text('Launch web Url'),onPressed: ()async{
              const url = 'https://www.google.com/';
              if(await canLaunch(url)){
                await launch(url);
              }else{
                throw 'Could not launch $url';
                // SnackBar(
                //   content: Text('Cannot load'),
                // );
              }
            },),
            RaisedButton(child: Text('Launch phone Url'),onPressed: ()async{
              const url = 'tel:9876543210';
              if(await canLaunch(url)){
                await launch(url);
              }else{
                throw 'Could not launch $url';
                // SnackBar(
                //   content: Text('Cannot load'),
                // );
              }
            },),
            RaisedButton(child: Text('Launch sms Url'),onPressed: ()async{
              const url = 'sms:9876543210';
              if(await canLaunch(url)){
                await launch(url);
              }else{
                throw 'Could not launch $url';
                // SnackBar(
                //   content: Text('Cannot load'),
                // );
              }
            },)
          ],
        ),
      ),
    );
  }
}