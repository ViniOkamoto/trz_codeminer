class User {
  String id;
  String name;
  int age;
  String gender;
  String lonlat;
  String createdAt;
  String updatedAt;
  bool infected;

  User(
      {this.id,
      this.name,
      this.age,
      this.gender,
      this.lonlat,
      this.createdAt,
      this.updatedAt,
      this.infected});

  @override
  String toString() {
    return '{"id":"$id", "name": "$name", "age": $age, "gender": "$gender", "lonlat": "$lonlat", "infected": $infected}';
  }
}
