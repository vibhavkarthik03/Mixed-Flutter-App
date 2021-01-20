import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  int pglevel = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        elevation: 0.0,
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          setState(() {
            pglevel+=1;
          });
        },
        child: Icon(
          Icons.add,
        ),backgroundColor: Colors.red,
      ) ,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0,30.0,0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/gyllenhaal-jumbo.jpg'),
                radius: 40.0,
              ),
            ),
          Divider(
            height: 90.0,
            color: Colors.white38,
          ),
          Text('USER NAME',style: TextStyle(
            color: Colors.grey[350],
            letterSpacing: 2.0,
          ),
          ),
            SizedBox(height: 10.0,),
            Text('Karthik R',style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),),Divider(
              height: 30.0,
              color: Colors.white38,
            ),SizedBox(height: 30.0,),
            Text('PROGRAMMER LEVEL',style: TextStyle(
              color: Colors.grey[350],
              letterSpacing: 2.0,
            ),
            ),
            SizedBox(height: 10.0,),

            Text('$pglevel',style: TextStyle(
              color: Colors.cyan,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),),
            Divider(
              height: 30.0,
              color: Colors.white38,
            ),
            SizedBox(height: 30.0,),
            Row(
                children: <Widget>[
                  Icon(
                    Icons.email_outlined,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 10.0,),
                  Text('vaibhavkarthik@gmail.com',style: TextStyle(
                    color: Colors.grey[350],
                    fontSize:20.0,
                    letterSpacing: 1.0
                  ),)
                ],
            )
          ],
        ),
      ),
    );
  }
}
