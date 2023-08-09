
class CurrentLocation {
  double? _latitude;
  double? _longitude;
  String? _address;
  String? _adminArea;
  String? _subAdminArea;
  String? _locality;
  String? _subLocality;

  CurrentLocation({
    double? latitude,
    double? longitude,
    String? address,
    String? adminArea,
    String? subAdminArea,
    String? locality,
    String? subLocality,
  }) {
    _latitude = latitude;
    _longitude = longitude;
    _address = address;
    _adminArea = adminArea;
    _subAdminArea = subAdminArea;
    _locality = locality;
    _subLocality = subLocality;
  }

  String get address => _address ?? '';

  set address(String value) {
    _address = value;
  }

  double get longitude => _longitude ?? 0.0;

  set longitude(double value) {
    _longitude = value;
  }

  double get latitude {
    return _latitude ?? 0.0;
  }

  set latitude(double value) {
    _latitude = value;
  }

  String get adminArea => _adminArea ?? '';

  set adminArea(String value) {
    _adminArea = value;
  }

  bool get isAvailable => latitude > 0 && longitude > 0 && address.isNotEmpty;

  String get subAdminArea => _subAdminArea ?? '';

  String get subLocality => _subLocality ?? '';

  set subLocality(String value) {
    _subLocality = value;
  }

  String get locality => _locality ?? '';

  set locality(String value) {
    _locality = value;
  }

  set subAdminArea(String value) {
    _subAdminArea = value;
  }

  @override
  String toString() {
    return 'CurrentLocation{_latitude: $latitude, _longitude: $longitude, _address: $_address, _adminArea: $_adminArea, _subAdminArea: $_subAdminArea, _locality: $_locality, _subLocality: $_subLocality}';
  }
}
