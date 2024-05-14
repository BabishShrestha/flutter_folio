




// class WorkModel {
//   WorkModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });

//   final int userId;
//   final int id;
//   final String title;
//   final String body;

//   // factory WorkModel.fromJson(Map<String,dynamic> str) => WorkModel/.fromMap(json.decode(str));

//   // String toJson() => json.encode(toMap());

//   factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "completed": body,
//       };
// }



class WorkModel {
    WorkModel({
         this.id,
        required this.projectId,
        required this.projectTitle,
        required this.projectImg,
        required this.projectDesc,
        required this.toolsUsed,
        required this.playstoreLink,
    });
    final String? id;
    final String projectId;
    final String projectTitle;
    final String projectImg;
    final String projectDesc;
    final List<String> toolsUsed;
    final String playstoreLink;



    factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        // id: json["id"],
        projectId: json["project_id"],
        projectTitle: json["project_title"],
        projectImg: json["project_img"],
        projectDesc: json["project_desc"],
        toolsUsed: List<String>.from(json["tools_used"].map((x) => x)),
        playstoreLink: json["playstore_link"],
    );

    Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "project_title": projectTitle,
        "project_img": projectImg,
        "project_desc": projectDesc,
        "tools_used": List<dynamic>.from(toolsUsed.map((x) => x)),
        "playstore_link": playstoreLink,
    };
}
