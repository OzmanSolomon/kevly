/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Wrote By Osman Suliman in 2021 
 */

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddressProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final FocusNode newAddressFocus = FocusNode();
  var newAddressController = TextEditingController();
  List addresses = ['MY OFFICE', 'HOME SWEET HOME', 'Thea’s house'];
  deleteAddress(index) {
    addresses.removeAt(index);
    notifyListeners();
  }

  saveAddress(context) {
    addresses.add(newAddressController.text);
    Navigator.pop(context);
    notifyListeners();
  }

  Position position;
  double lat;
  double lng;
  getLoc() async {
    Location loc = Location();
    var myLoc = await loc.getLocation();
    lat = myLoc.latitude;
    lng = myLoc.longitude;
    translateLatLng(LatLng(lat, lng));
    notifyListeners();
    setMarkers(LatLng(lat, lng));
  }

  onMapTaped(pos) {
    markers.clear();
    translateLatLng(pos);
    setMarkers(pos);
  }

  setMarkers(LatLng latlng) {
    markers.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(latlng.latitude, latlng.longitude),
        draggable: true,
        onDragEnd: (pos) {
          translateLatLng(pos);
        },
        // ignore: deprecated_member_use
        icon: BitmapDescriptor.fromAsset('assets/images/mapPin.png')));
  }

  final Set<Marker> markers = {};
  translateLatLng(LatLng position) async {
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    newAddressController.text = placemark[0].subLocality != placemark[0].name
        ? '${placemark[0].subLocality}, ${placemark[0].name}'
        : placemark[0].name;
    notifyListeners();
  }
}
