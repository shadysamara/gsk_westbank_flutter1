class Student {
  String? name;
  int? age;
  String? city;
  Student.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    age = map['age'];
    city = map['city'];
  }
}
