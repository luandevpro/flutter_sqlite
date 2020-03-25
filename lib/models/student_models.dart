class Student {
  int id;
  String name;

  Student({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name};
  }

  Student.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
  }
}
