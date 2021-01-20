import 'package:flutter/material.dart';
import 'package:flutter_app3/home.dart';
import 'package:flutter_app3/service/securestorage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  bool _isLoggedIn=false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes:['email']);
  final SecureStorage secureStorage = SecureStorage();

  _login() async{
    try{
     await  _googleSignIn.signIn();
     secureStorage.writeSecureData('email',_googleSignIn.currentUser.email);
     secureStorage.writeSecureData('name',_googleSignIn.currentUser.displayName);
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('displayName', _googleSignIn.currentUser.displayName);
    // Navigator.pushNamed(context, '/home');
     setState(() {
       _isLoggedIn =true;
     });
    }
    catch(err){
      print(err);
    }
  }
  _logout(){
    _googleSignIn.signOut().whenComplete(() { secureStorage.deleteData('email');
    }
    );
    setState(() {
      _isLoggedIn=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      backgroundColor: Colors.black,
      body: Center(
            child:_isLoggedIn ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundImage: NetworkImage(_googleSignIn.currentUser.photoUrl),
                  radius: 30,
                ),SizedBox(height:20 ,),
                Text(_googleSignIn.currentUser.displayName,style: TextStyle(color: Colors.white),),
              SizedBox(height: 20,),
              Text(_googleSignIn.currentUser.email,style: TextStyle(color: Colors.white),),
                SizedBox(height: 290,),
        RaisedButton(child: Text('Lets get you inside the app!'),
          onPressed: (){Navigator.popAndPushNamed(context,'/home' );},),
                RaisedButton(
                    child:Text('Logout'),
                    onPressed:() {_logout();})
              ],
            )
            :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>
              [Text('Welcome Back $displayName',style: GoogleFonts.allan(textStyle: TextStyle(
                color: Colors.white,fontSize: 30
              )),
              ),
                Text(
                    'Login to continue',
                style: TextStyle(color: Colors.white),),
                RaisedButton.icon(
                  color: Colors.white,
                  onPressed:(){
                    _login();
                  },
                  icon: Icon(FontAwesomeIcons.google),
                  label: Text('Sign in with google'),
                ),
              ],
            )
      ),
    );
  }
}
