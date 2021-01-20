import 'package:flutter_app3/slidablecontent.dart';
import 'location_acces.dart';
import 'package:flutter/material.dart';
import 'intro.dart';
import 'home.dart';
import 'maps.dart';
import 'slidablecontent.dart';
import 'webview.dart';
import 'deviceinfo.dart';
import 'splashscreen.dart';
import 'loginscreen.dart';
import 'fileopener.dart';
import 'openfile.dart';
void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner:false,
  initialRoute: '/',
  routes: {
    '/':(context)=>SlashScreen(),
    '/intro':(context)=>IntroScreen(),
    '/file':(context)=>MyHomePage(),
    '/loginscreen':(context)=>LoginScreen(),
    '/openfiles':(context)=>FilePickerDemo(),
    '/home':(context) => Home(),
    '/location':(context)=>locationAccess(),
    '/maps':(context)=>mapsPage(),
    '/slidable':(context)=>slidablecontent(),
    '/web':(context)=>webViewPage(),
    '/deviceinfo':(context)=>deviceInfo(),
  },
));












