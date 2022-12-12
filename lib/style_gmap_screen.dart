import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*-------------------------------- Google Map Theme integration ------------------------------------------*/

class StyleGoogleMapScreen extends StatefulWidget {
  const StyleGoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<StyleGoogleMapScreen> createState() => _StyleGoogleMapScreenState();
}

class _StyleGoogleMapScreenState extends State<StyleGoogleMapScreen> {
  String mapTheme = '';
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(23.004566041261484, 72.50083398527654),
    zoom: 14,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString('assets/maptheme/night_theme.json')
        .then((value) {
      mapTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
          title: Text('Google Map Theme'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    _controller.future.then(
                      (value) {
                        DefaultAssetBundle.of(context).loadString('assets/maptheme/sliver_theme.json').then(
                          (string) {
                            value.setMapStyle(string);
                          },
                        );
                      },
                    );
                  },
                  child: Text('Sliver'),
                ),
                PopupMenuItem(
                  onTap: () {
                    _controller.future.then(
                          (value) {
                        DefaultAssetBundle.of(context).loadString('assets/maptheme/retro_theme.json').then(
                              (string) {
                            value.setMapStyle(string);
                          },
                        );
                      },
                    );
                  },
                  child: Text('Retro'),
                ),
                PopupMenuItem(
                  onTap: () {
                    _controller.future.then(
                          (value) {
                        DefaultAssetBundle.of(context).loadString('assets/maptheme/night_theme.json').then(
                              (string) {
                            value.setMapStyle(string);
                          },
                        );
                      },
                    );
                  },
                  child: Text('Night'),
                ),
              ],
            ),
          ],
          backgroundColor: Colors.pink)),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: false,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            controller.setMapStyle(mapTheme);
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
