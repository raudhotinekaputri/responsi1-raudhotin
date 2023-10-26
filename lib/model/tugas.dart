class Tugas {
  int? id;
  String? title;
  String? description;
  DateTime? deadline;

  Tugas({this.id, this.title, this.description, this.deadline});

  factory Tugas.fromJson(Map<String, dynamic> obj) {
    return Tugas(
      id: int.parse(obj['id'].toString()),
      title: obj['title'].toString(),
      description: obj['description'].toString(),
      deadline: DateTime.parse(obj['deadline'].toString()),
    );
  }
}
