import 'dart:async';
import 'package:permission/permission.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.3005699, 74.7780242),
    zoom: 10,
  );

  @override
  void initState() {
    // TODO: implement initState
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        markers: {
          Marker1,
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.location_searching),
      ),
    );
  }

  Marker Marker1 = Marker(
    markerId: MarkerId('gramercy'),
    position: LatLng(19.124665, 72.822413),
    infoWindow: InfoWindow(title: 'Washroom ', snippet: "Public "),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );

  getPermission() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    var permissionNames =
        await Permission.requestPermissions([PermissionName.Location]);
    Permission.openSettings;
  }
}
