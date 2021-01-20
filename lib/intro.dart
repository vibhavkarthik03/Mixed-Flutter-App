import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FancyOnBoarding(
        pageList: [
          PageModel(color: Colors.blue, heroImagePath: "assets/india.jpg",
            title:Center(
              child: Text('India',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child: Center(
                child: Text(
                  'Land of Spirituality and Divinity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            icon: Icon(
              Icons.local_airport_sharp,
              color: Colors.red,
            ),
          ),
          PageModel(color: Colors.blue[900], heroImagePath: "assets/usa1.jpg",
            title:Center(
              child: Text('USA',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child: Center(
                child: Text(
                  'Land of Technology and Future ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            icon: Icon(
              Icons.next_plan_outlined,
              color: Colors.orange,
            ),
          ),
          PageModel(color: Colors.red, heroImagePath: "assets/london.jpg",
            title:Center(
              child: Text('London',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child: Center(
                child: Text(
                  'Land of James Bond',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            icon: Icon(
              Icons.flag,
              color: Colors.lightGreenAccent,
            ),
          ),
          PageModel(color: Colors.black54, heroImagePath: "assets/greece.jpg",
            title:Center(
              child: Text('Egypt',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child: Center(
                child: Text(
                  'Land of Pyramids',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            icon: Icon(
              Icons.agriculture_rounded,
              color: Colors.black,
            ),
          ),
          PageModel(color: Colors.green, heroImagePath: "assets/kenya.jpg",
            title:Center(
              child: Text('Kenya',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child: Center(
                child: Text(
                  'Land of the Wild Lives',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            icon: Icon(
              Icons.wb_sunny_sharp,
              color: Colors.lightBlue,
            ),
          ),
          PageModel(color: Colors.amber, heroImagePath: "assets/sk.jpg",
            title:Center(
              child: Text('South Korea',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child: Center(
                child: Text(
                  'Heaven of Tech Enthusiasts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            icon: Icon(
              Icons.phone_iphone_outlined,
              color: Colors.pink,
            ),
          ),
          PageModel(color: Colors.pink, heroImagePath: "assets/indo.jpg",
            title:Center(
              child: Text('Indonesia',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal:10 ),
              child: Center(
                child: Text(
                  'Land of Volcanoes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),
                ),
              ),
            ),
            icon: Icon(
              Icons.landscape_outlined,
              color: Colors.lightBlue,
            ),
          ),
        ],

        bottomMargin: 10,
        skipButtonText: ('Skip'),

        doneButtonText: ('Done'),
        onSkipButtonPressed: () {
          Navigator.popAndPushNamed(context, '/loginscreen');
        },

        onDoneButtonPressed: () {
          Navigator.popAndPushNamed(context, '/home');
        },

      ),
    );
  }
}
