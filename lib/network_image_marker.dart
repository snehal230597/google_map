import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui';
import 'dart:ui' as ui;

class NetworkImageMarkerScreen extends StatefulWidget {
  const NetworkImageMarkerScreen({Key? key}) : super(key: key);

  @override
  State<NetworkImageMarkerScreen> createState() =>
      _NetworkImageMarkerScreenState();
}

class _NetworkImageMarkerScreenState extends State<NetworkImageMarkerScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(23.137492717484033, 72.54191823085922),
    zoom: 14,
  );

  final List<Marker> _markers = <Marker>[];

  List<LatLng> latlng = [
    LatLng(23.137492717484033, 72.54191823085922),
    LatLng(23.17217026953812, 72.57910698014496),
    LatLng(23.170590308985112, 72.53096385378703),
    LatLng(23.167335076556736, 72.56225409325745),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    for (int i = 0; i < latlng.length; i++) {
      Uint8List? image = await loadNetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2Zl-sETjX1a9l7abKthpYMZIrqgLEWwPHkg&usqp=CAU');
      final ui.Codec markerImagecodec = await ui.instantiateImageCodec(
        image!.buffer.asUint8List(),
        targetHeight: 150 ,
        targetWidth: 100,
      );

      final ui.FrameInfo frameInfo = await markerImagecodec.getNextFrame();
      final ByteData? byteData = await frameInfo.image.toByteData(
        format: ui.ImageByteFormat.png
      );

      final Uint8List resizedImageMarker  = byteData!.buffer.asUint8List();
      _markers.add(
        Marker(
          markerId: MarkerId(
            i.toString(),
          ),
          position: latlng[i],
          icon: BitmapDescriptor.fromBytes(resizedImageMarker),
          infoWindow: InfoWindow(
            title: 'Title of marker' + " " + i.toString(),
          ),
        ),
      );
      setState(() {});
    }
  }

  Future<Uint8List?> loadNetworkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(ImageConfiguration()).addListener(
          ImageStreamListener(
            (info, _) => completer.complete(info),
          ),
        );

    final imageInfo = await completer.future;
    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
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
