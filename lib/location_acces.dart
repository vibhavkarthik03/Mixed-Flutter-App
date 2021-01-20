import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

class locationAccess extends StatefulWidget {
  @override
  _locationAccessState createState() => _locationAccessState();
}

class _locationAccessState extends State<locationAccess> {
  PermissionStatus _status;
  @override
  void initState() {
    super.initState();
    Permission.locationWhenInUse.status.then(updateStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(child: Column(
        children: [
          Text('$_status',style: TextStyle(
            fontSize: 38
          ),),
          SizedBox(height: 260,),

          RaisedButton(child: Text('Ask permission'), onPressed:(){askPermission();
          },
          ),
        ],
      ),
      ),
    );
  }

  void updateStatus(PermissionStatus status) {
    if (status != _status) {
      setState(() {
        _status = status;
        print(status);
      });
    }
  }

  void askPermission()async {
   if(await Permission.locationWhenInUse.request().isGranted){
     Navigator.pushNamed(context, '/maps');
     Permission.locationWhenInUse.status.then(updateStatus);
     showToast('Location allowed',position: ToastPosition.bottom);
   }else{
     Permission.locationWhenInUse.isDenied;
     print(_status);
     showToast('Location allowed',position: ToastPosition.bottom);
   }
  }

}


