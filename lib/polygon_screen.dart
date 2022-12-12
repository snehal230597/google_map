import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*----------------------- make a red bondries in google map for specific area ----------------------*/

class PolygoneScreen extends StatefulWidget {
  const PolygoneScreen({Key? key}) : super(key: key);

  @override
  State<PolygoneScreen> createState() => _PolygoneScreenState();
}

class _PolygoneScreenState extends State<PolygoneScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(23.220020972998043, 72.64724098460245),
    zoom: 14,
  );

  Set<Polygon> _polygon = HashSet<Polygon>();

  // need to be same start - end points cordinates otherwies its throw an error...
  List<LatLng> points = [
    LatLng(23.242727861988627, 72.67499352374368),
    LatLng(23.21953300861302, 72.6665693656743),
    LatLng(23.197158806167426, 72.63887916990208),
    LatLng(23.173973207799946, 72.57840195831022),
    LatLng(23.230349367933496, 72.60763738761057),
    LatLng(23.242727861988627, 72.67499352374368),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygon.add(
      Polygon(
        polygonId: PolygonId('1'),
        points: points,
        fillColor: Colors.red.withOpacity(0.3),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange
      ),
    );
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
          // markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
          myLocationEnabled: false,
          compassEnabled: true,
          polygons: _polygon,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
