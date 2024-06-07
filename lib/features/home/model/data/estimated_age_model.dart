class EstimatedAgeModel {
  int count;
  String name;
  int age;

  EstimatedAgeModel({
    required this.count,
    required this.name,
    required this.age,
  });

  factory EstimatedAgeModel.fromMap(Map<String, dynamic> map) {
    return EstimatedAgeModel(
      count: map['count'],
      name: map['name'],
      age: map['age'],
    );
  }
}
