class Package {
  int fijiWater;
  int campBell;
  int ak47;
  int firstAid;

  Package({
    this.fijiWater = 0,
    this.campBell = 0,
    this.firstAid = 0,
    this.ak47 = 0,
  });

  @override
  String toString() {
    return "Fiji Water:$fijiWater;Campbell Soup:$campBell;First Aid Pouch:$firstAid;AK47:$ak47";
  }
}
