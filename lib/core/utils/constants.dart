import 'package:flutter_folio/core/utils/utils.dart';
import 'package:flutter_folio/features/portfolio_home/domain/model/skill_model.dart';

var skillList = [
  {'title': 'Flutter', 'imagePath': UiImagePath.flutter, 'rating': 4.5},
  {'title': 'Dart', 'imagePath': UiImagePath.dart, 'rating': 4.0},
  {'title': 'Unity', 'imagePath': UiImagePath.unityWhite, 'rating': 3.0},
  {'title': 'C#', 'imagePath': UiImagePath.cSharp, 'rating': 3.0},
  {'title': 'Firebase', 'imagePath': UiImagePath.firebase, 'rating': 3.5},
  {'title': 'Git', 'imagePath': UiImagePath.git, 'rating': 4.0},
  {'title': 'SQL', 'imagePath': UiImagePath.sql, 'rating': 2.5},
  {'title': 'Postman', 'imagePath': UiImagePath.postman, 'rating': 3.0},
];
List<SkillModel> formattedSkillList =
    skillList.map((skill) => SkillModel.fromJson(skill)).toList();

var projectList = [
  {
    'title': 'EventsMo App',
    'imagePath': UiImagePath.eventsMo,
  },
  {
    'title': 'EventsMo Host App',
    'imagePath': UiImagePath.eventsMoHost,
  },
  {
    'title': 'Sort Your Bin',
    'imagePath': UiImagePath.sortYourBin,
  },
  {
    'title': 'Soltaire -Classic Card Games',
    'imagePath': UiImagePath.soltaire,
  },
  {
    'title': 'Gokyo',
    'imagePath': UiImagePath.gokyo,
  },
  {
    'title': 'AgentX',
    'imagePath': UiImagePath.agentX,
  },
  {
    'title': 'FMS App',
    'imagePath': UiImagePath.fms,
  },
  {
    'title': 'DCMS App',
    'imagePath': UiImagePath.dcms,
  },
];

List<SkillModel> formattedProjectList =
    projectList.map((project) => SkillModel.fromJson(project)).toList();
