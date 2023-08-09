import 'package:flutter_geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:e_plaza_vendor/modals/current_location.dart';

class LocationController {
  final Location _location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  Rx<CurrentLocation> currentLocation = CurrentLocation().obs;

  LocationController(){
    _initLocation();
  }

  Future _initLocation() async {

    if(currentLocation.value.address.isNotEmpty) {
      // currentLocation.value = CurrentLocation();
      // currentLocation.value = CurrentLocation(
      //   latitude: currentLocation.value.latitude,
      //   longitude: currentLocation.value.longitude,
      //   address: currentLocation.value.address,
      //   adminArea:currentLocation.value.adminArea,
      //   subAdminArea:currentLocation.value.subAdminArea,
      //   locality:currentLocation.value.locality,
      //   subLocality:currentLocation.value.subLocality,
      // );
      currentLocation.refresh();
    }

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen(getAddress);
  }

  void getAddress(LocationData locationData) async {
    final coordinates = Coordinates(locationData.latitude, locationData.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    currentLocation.value = CurrentLocation(
      latitude: locationData.latitude,
      longitude: locationData.longitude,
      address: first.addressLine,
      adminArea:first.adminArea,
      subAdminArea:first.subAdminArea,
      locality:first.locality,
      subLocality:first.subLocality,
    );
    currentLocation.refresh();
  }
}

LocationController locController = LocationController();