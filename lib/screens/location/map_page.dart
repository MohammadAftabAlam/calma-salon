import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const String kGOOGLE_MAPS_API_KEY = "";
  // "PLACE_YOUR_GOOGLE_MAP_APIp_KEY_HERE";

  //location is used to access the actual location of the user
  Location locationController = Location();
  LatLng? _currentPos = null;

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const PointLatLng _pRewariLoc = PointLatLng(37.3346, -122.0090);
  static const LatLng jamiaMillia = LatLng(28.561657, 77.281258);

  Map<PolylineId, Polyline> polyLines = {};

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    // getLocationUpdate().then(
    //   (_) => {
    //     getPolylinePoints().then((coordinates) => {
    //           generatePolyLineFromPoints(coordinates),
    //         }),
    //   },
    // );
    getLocationUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPos == null
          ? const Center(
              child: Text(
                "Loading...",
                style: TextStyle(fontSize: 20),
              ),
            )
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),
              initialCameraPosition:
                  CameraPosition(target: jamiaMillia, zoom: 13),
              markers: {
                Marker(
                  markerId: const MarkerId("_currentLocation"),
                  position: _currentPos!,
                ),
                // const Marker(
                //   markerId: MarkerId("sourceLocation"),
                //   position: _pGooglePlex,
                // ),
                // const Marker(
                //   markerId: MarkerId("destinationLocation"),
                //   position: _pRewariLoc,
                // ),
              },
              polylines: Set<Polyline>.of(polyLines.values),
            ),
    );
  }

  /* ************************Starts Setting the cameraPosition to the user location **************************** */
  Future<void> cameraToPosition(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition =
        CameraPosition(target: position, zoom: 13);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }
  /* ************************Ends Setting the cameraPosition to the user location **************************** */

  /* ************************Starts Function to get the user location **************************** */
  Future<void> getLocationUpdate() async {
    bool serviceEnabled; //It's a variable name it can be anything
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }
    permissionGranted = await locationController.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        debugPrint("Permission Not Granted Aftab Bro");
        return;
      }
    }

    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentPos =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          debugPrint("location: Latitude " +
              _currentPos!.latitude.toString() +
              " Longitude: " +
              _currentPos!.longitude.toString());
          cameraToPosition(_currentPos!);
        });
      }
    });
  }
  /* ************************Ends Function to get the user location **************************** */

  /* ************ Starts to get the Actual route between Source and Destination ********************* */
  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polyLineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      request: PolylineRequest(
        destination: PointLatLng(_pRewariLoc.latitude, _pRewariLoc.longitude),
        origin: PointLatLng(_currentPos!.latitude, _currentPos!.longitude),
        mode: TravelMode.driving,
      ),

      // PointLatLng(_currentPos!.latitude, _currentPos!.longitude),
      // PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
      // PointLatLng(_pRewariLoc.latitude, _pRewariLoc.longitude),
      //
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      debugPrint(result.errorMessage);
    }
    return polyLineCoordinates;
  }
  /* ************ Ends, get the Actual route between Source and Destination ********************* */

  /* ************ Starts to color the Actual route between Source and Destination ********************* */
  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polyLines[id] = polyline;
    });
  }
/* ************ Ends to color the Actual route between Source and Destination ********************* */
}
