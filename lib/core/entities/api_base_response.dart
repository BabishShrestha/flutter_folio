class ApiBaseResponse {
  final int statusCode;
  final String message;
  ApiBaseResponse({required this.statusCode, required this.message});

  factory ApiBaseResponse.fromJson(Map<String, dynamic> json) =>
      ApiBaseResponse(statusCode: json["statusCode"], message: json["message"]);
}
