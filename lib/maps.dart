import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class mapsPage extends StatefulWidget {
  @override
  _mapsPageState createState() => _mapsPageState();
}

class _mapsPageState extends State<mapsPage> {
  Marker marker;
  Circle circle;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  GoogleMapController _controller;
  static final CameraPosition initialLocation = CameraPosition(target: LatLng(12.846873,80.226492),
    zoom: 16.4746,
  );

  //Conversion of image
  Future<Uint8List> getMarker()async{
      ByteData byteData = await DefaultAssetBundle.of(context).load('assets/car.png');
      return byteData.buffer.asUint8List();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Page'),
      ),
      body: GoogleMap(
        initialCameraPosition: initialLocation,
        mapType: MapType.normal,
        markers: Set.of((marker!=null)?[marker]:[]),
        circles: Set.of((circle!=null)?[circle]:[]),
        onMapCreated: (GoogleMapController controller){
          _controller = controller;
        }
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching_rounded),
      onPressed: (){
          getCurrentLocation();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }

  //To update the object in realtime based on the moving location
  void updateMarkerAndCircle(LocationData newLocalData,Uint8List imageData){
    LatLng latLng = LatLng(newLocalData.latitude,newLocalData.longitude);
    this.setState(() {
      marker = Marker(
        markerId: MarkerId('home'),
        position: latLng,
        rotation: newLocalData.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5,0.5),
        icon: BitmapDescriptor.fromBytes(imageData),);
      circle = Circle(
          circleId:CircleId('car'),
          radius:newLocalData.accuracy,
          zIndex:1,
          strokeColor: Colors.lightGreenAccent,
          center: latLng,
          fillColor: Colors.lightGreenAccent.withAlpha(70));

    });
  }

  //getting the current location in realtime from movement
  void getCurrentLocation() async{
    try{
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();
      updateMarkerAndCircle(location,imageData);

      if(_locationSubscription!=null){
        _locationSubscription.cancel();
      }
      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData){
        if(_controller!=null){
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(newLocalData.latitude,newLocalData.longitude),
            tilt: 0,
            zoom:18.4746)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    }on PlatformException catch(e){
      if(e.code == 'PERMISSION DENIED');
      debugPrint('Permission Denied');
    }
  }

  @override
  void dispose() {
    if(_locationSubscription!=null){
      _locationSubscription.cancel();
    }
    super.dispose();
  }
}
