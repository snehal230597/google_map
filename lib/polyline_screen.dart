import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineScreen extends StatefulWidget {
  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

class _PolylineScreenState extends State<PolylineScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(23.137492717484033, 72.54191823085922),
    zoom: 14,
  );

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  // need to be same start - end points cordinates otherwies its throw an error...
  List<LatLng> latlng = [
    LatLng(23.137492717484033, 72.54191823085922),
    LatLng(22.987917, 72.493698),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < latlng.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(
            i.toString(),
          ),
          position: latlng[i],
          infoWindow:
              InfoWindow(title: 'Really cool place', snippet: '5 Star rating'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      setState(
        () {},
      );
     _polyline.add(
       Polyline(polylineId: PolylineId('1'),
       color: Colors.orange,
       points: latlng,
       ),
     );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Polygon Screen'),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
           markers: Set<Marker>.of(_markers),
          mapType: MapType.normal,
          polylines: _polyline,
          myLocationEnabled: false,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
