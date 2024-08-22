class SkillModel {
  final String title;
  final String imagePath;
  final double? rating;
  const SkillModel({
    required this.title,
    required this.imagePath,
    this.rating,
  });
  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      rating: json['rating'] as double?,
    );
  }
}
