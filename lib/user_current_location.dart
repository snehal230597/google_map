import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*----------------------------------- Get User Current Location ----------------------------------*/

class GetUserCurrentLocationScreen extends StatefulWidget {
  const GetUserCurrentLocationScreen({Key? key}) : super(key: key);

  @override
  State<GetUserCurrentLocationScreen> createState() =>
      _GetUserCurrentLocationScreenState();
}

class _GetUserCurrentLocationScreenState
    extends State<GetUserCurrentLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(33.6844, 74.0479), zoom: 14);

  final List<Marker> _markers = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(33.6844, 74.0479),
      infoWindow: InfoWindow(title: 'Marker name'),
    ),
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error' + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

   void initState(){
    super.initState();
    loadData();
   }
   loadData(){
     getUserCurrentLocation().then((value) async {
       print('my current location');
       print(value.latitude.toString() + " " + value.longitude.toString());
       _markers.add(
         Marker(
           markerId: MarkerId('2'),
           position: LatLng(value.latitude, value.longitude),
           infoWindow: InfoWindow(title: 'My current location'),
         ),
       );
       CameraPosition cameraPosition = CameraPosition(
           zoom: 14, target: LatLng(value.latitude, value.longitude));

       final GoogleMapController controller = await _controller.future;
       controller
           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
       setState(() {

       });
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
               loadData();
        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}
