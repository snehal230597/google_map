import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(23.004566041261484, 72.50083398527654),
    zoom: 14,
  );

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.004566041261484, 72.50083398527654),
        infoWindow: InfoWindow(title: 'hashtechy infotech')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(23.028683566505414, 72.50658909666996),
        infoWindow: InfoWindow(title: 'isckon mandir')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(22.987094323148764, 72.49485511201284),
        infoWindow: InfoWindow(title: 'sanand cross road')),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(23.29738405184037, 72.32811894909113),
        infoWindow: InfoWindow(title: 'kadi bus stand')),
  ];

  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(23.29738405184037, 72.32811894909113),
                zoom: 14
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
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
