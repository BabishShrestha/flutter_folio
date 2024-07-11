import 'package:flutter_folio/core/utils/utils.dart';
import 'package:flutter_folio/features/portfolio_home/domain/model/skill_model.dart';

var skillList = [
  {
    'title': 'Flutter',
    'imagePath': UiImagePath.flutter,
  },
  {
    'title': 'Dart',
    'imagePath': UiImagePath.dart,
  },
  {
    'title': 'Unity',
    'imagePath': UiImagePath.unityWhite,
  },
  {
    'title': 'C#',
    'imagePath': UiImagePath.cSharp,
  },
  {
    'title': 'Firebase',
    'imagePath': UiImagePath.firebase,
  },
  {
    'title': 'Git',
    'imagePath': UiImagePath.git,
  },
  {
    'title': 'SQL',
    'imagePath': UiImagePath.sql,
  },
  {
    'title': 'Postman',
    'imagePath': UiImagePath.postman,
  },
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
