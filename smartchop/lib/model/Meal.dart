class Meal {
  final String id;
  final String name;
  final String imageUrl;
  final int calories;
  final String creationDate;
  final String description;
  final String userId;

  Meal(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.calories,
      required this.creationDate,
      required this.description,
      required this.userId});

  factory Meal.fromMap(Map<String, dynamic> data, String documentId) {
    return Meal(
      id: documentId,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      calories: data['calories'] ?? 0,
      creationDate: data['creationDate'] ?? '',
      description: data['description'] ?? '',
      userId: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'calories': calories,
      'creationDate': creationDate,
      'description': description,
      'userId': userId,
    };
  }
}
