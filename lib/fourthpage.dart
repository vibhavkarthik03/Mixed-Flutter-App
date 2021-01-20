import 'package:flutter/material.dart';
class fourthpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome to second screen'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/de.jpg'),
            ),
          ),
          RaisedButton(child: Text(
            'Slidable Content'
          ),
              onPressed: (){
            Navigator.pushNamed(context, '/slidable');
          })
        ],
      ),
    );
  }
}