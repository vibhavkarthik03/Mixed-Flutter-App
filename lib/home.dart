import 'package:flutter/material.dart';
import 'package:flutter_app3/service/securestorage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'secondpage.dart';
import 'thirdpage.dart';
import 'fourthpage.dart';
import 'profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'statefulpage.dart';
import 'loginscreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes:['email']);
  GoogleSignInAccount _currentUser;
  SecureStorage secureStorage = SecureStorage();
  String displayName;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      displayName = prefs.getString('displayName');
    });
  }


  display(){
    if(displayName!=null){
      return Text('Welcome back $displayName',style: GoogleFonts.akronim(textStyle: TextStyle(
        color: Colors.white,
        fontSize: 30
      )),);
    }else{
      return Text('Welcome to the App',style: GoogleFonts.akronim(textStyle: TextStyle(
        color: Colors.white,fontSize: 30
      )),);
    }
  }



  logout(){
    _googleSignIn.signOut().whenComplete((){
      secureStorage.deleteData('email');

    } );
    Navigator.pushReplacementNamed(context, '/loginscreen');
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black26,
      drawer: Drawer(
        child: Column(
          children:<Widget> [
            UserAccountsDrawerHeader(
              accountName: Text(''),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(''),
                backgroundColor: Colors.white,
              ),
            ),

            ListTile(onTap: ()=>Navigator.push(context, MaterialPageRoute(
                builder: (Context)=>profilePage()
            )),
              leading: Icon(Icons.account_circle_outlined),
              title: Text('Profile',style: TextStyle(
                  fontSize: 18
              ),),
            ),
            ListTile(
              leading: Icon(Icons.perm_device_info_outlined),
              onTap: ()=>Navigator.pushNamed(context, '/deviceinfo'),
              title: Text('Device info',style: TextStyle(
                  fontSize: 18
              ),),
            ),
            ListTile(onTap: logout,
              leading: Icon(Icons.logout),
              title: Text('Logout',style: TextStyle(
                  fontSize: 18
              ),),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
            IconButton(
                iconSize: 30,
                icon:Icon(Icons.add_a_photo_outlined ),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                    builder: (Context)=>thirdpage()
                ))
            ),
            IconButton(
                iconSize: 30,
                icon:Icon(Icons.add_location_alt_outlined ),
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                }
            )
          ],
        ),

      ),
      appBar: AppBar(
        title: Text('Welcome to my first app in Flutter'),

        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: display(),
          ),

          RaisedButton.icon(
            color: Colors.teal,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (Context)=>fourthpage()
              ));
            },
            icon: Icon(
                Icons.wb_sunny_sharp
            ),
            label: Text('Click to see a magic'),
          ),
          RaisedButton.icon(
             color: Colors.teal,
             onPressed: (){
               Navigator.pushNamed(context, '/openfiles');
             },
             icon: Icon(
                 Icons.drive_file_move_outline
             ),
             label: Text('Open files page'),
           ),


          Container(color: Colors.cyan,
            padding: EdgeInsets.all(10.0),
            child: RaisedButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (Context)=>statefulpage()
              ));
            }, icon: Icon(Icons.next_plan_outlined,),
                label: Text('Click to go to stateful widget') ),
          ),

          RaisedButton.icon(
            color: Colors.green,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (Context)=>secondpage()
              ));
            },
            icon: Icon(
                Icons.ac_unit_sharp
            ),
            label: Text('Click to see another magic'),
          ),
          RaisedButton(color: Colors.black
              ,child: Text('About us',style: TextStyle(
                color: Colors.white
              ),),
              onPressed: (){
            Navigator.pushNamed(context, '/web');
              }),

        ],
      ),

      floatingActionButton:FloatingActionButton(
        child:Icon(FontAwesomeIcons.download) ,
        backgroundColor: Colors.redAccent,
        onPressed: (){
          Navigator.pushNamed(context, '/file');
        },
      ) ,

    );
  }

}
