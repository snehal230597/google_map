import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

/*------------------------------ convert coordinates to address--------------------------------------------*/

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  State<ConvertLatLangToAddress> createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
  String stAddress = '';
  String stAdd = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: (AppBar(
            title: Text('Googlr Map Integration'),
            centerTitle: true,
            backgroundColor: Colors.pink)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(stAddress),
              Text(stAdd),
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  List<Placemark> placemarks =
                      await placemarkFromCoordinates(52.2165157, 6.9437819);
                  List<Location> locations =
                      await locationFromAddress("Gronausestraat 710, Enschede");
                  setState(() {
                    stAdd = placemarks.reversed.last.country.toString() +
                        " " +
                        placemarks.reversed.last.locality.toString();
                    stAddress = locations.last.longitude.toString() +
                        " " +
                        locations.last.longitude.toString();
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      'Convert',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
