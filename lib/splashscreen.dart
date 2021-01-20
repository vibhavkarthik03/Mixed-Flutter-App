import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app3/service/securestorage.dart';

String finalEmail,finalName;


class SlashScreen extends StatefulWidget {
  @override
  _SlashScreenState createState() => _SlashScreenState();
}


class _SlashScreenState extends State<SlashScreen> {
final SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) => finalEmail=value);
    secureStorage.readSecureData('Name').then((value) => finalName=value);
    Timer(
        Duration(seconds: 3),
            () => Navigator.popAndPushNamed(context, finalEmail==null?'/intro':'/home')
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300.0,
                child: Image.asset('assets/venom.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue[100],),
              )
            ],
          ),
        ),
      ),
    );
  }
}

