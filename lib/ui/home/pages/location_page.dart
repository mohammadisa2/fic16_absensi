// import 'dart:math' show cos, sqrt;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/core.dart';
import '../../../data/datasources/auth_local_datasource.dart';

class LocationPage extends StatefulWidget {
  final double? latitude;
  final double? longitude;

  const LocationPage({
    Key? key,
    this.latitude,
    this.longitude,
  }) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late GoogleMapController mapController;
  late LatLng center;
  late Marker marker;
  late Circle circle;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final authData = await AuthLocalDatasource().getAuthData();
    if (authData != null && authData.company != null) {
      final latitudeCompany = authData.company!.latitude;
      final longitudeCompany = authData.company!.longitude;
      final radiusCompany = authData.company!.radiusKm;

      setState(() {
        center = LatLng(widget.latitude ?? 0, widget.longitude ?? 0);
        marker = Marker(
          markerId: const MarkerId("marker_1"),
          position: center,
        );
        circle = Circle(
          circleId: const CircleId("circle_1"),
          center: LatLng(
            double.parse(latitudeCompany.toString()),
            double.parse(longitudeCompany.toString()),
          ),
          radius: double.parse(radiusCompany.toString()) *
              1000, // Convert km to meters
          strokeWidth: 2,
          strokeColor: Colors.blue,
          fillColor: Colors.blue.withOpacity(0.3),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: widget.latitude == null
                ? GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: center,
                      zoom: 18.0,
                    ),
                    markers: {marker},
                    circles: {circle},
                  )
                : GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: center,
                      zoom: 18.0,
                    ),
                    markers: {marker},
                    circles: {circle},
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 50.0,
            ),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Assets.icons.back.svg(),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
