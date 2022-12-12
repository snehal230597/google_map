import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:googlemap/custom_%20marker_screen.dart';
import 'package:googlemap/custom_marker_info_window.dart';
import 'package:googlemap/google_places_api.dart';
import 'package:googlemap/network_image_marker.dart';
import 'package:googlemap/polygon_screen.dart';
import 'package:googlemap/polyline_screen.dart';
import 'package:googlemap/user_current_location.dart';
import 'package:googlemap/convert_latlang_to_address.dart';
import 'package:googlemap/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: (AppBar(
            title: Text('Googlr Map Integration'),
            centerTitle: true,
            backgroundColor: Colors.pink)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('Google Map'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConvertLatLangToAddress()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('Convert Lat-Long'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GetUserCurrentLocationScreen()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('Current Location'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GooglePlaceApiScreen()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('Search Places'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomMarkerScreen()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('Custom Marker'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomMarkerInfoWindow()));
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('C.Infowindow'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PolygoneScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('Polygon'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PolylineScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('Polyline'),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NetworkImageMarkerScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                    child: Text('Marker Image'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
