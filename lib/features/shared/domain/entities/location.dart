class Location {
  String latitude;
  String longitude;

  Location({this.longitude, this.latitude});

  @override
  String toString() {
    return "POINT ($longitude $latitude)";
  }
}
