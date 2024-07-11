class SkillModel {
  final String title;
  final String imagePath;
  const SkillModel({
    required this.title,
    required this.imagePath,
  });
  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}
