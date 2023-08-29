class ResponseRegistryModel {
  String message;

  ResponseRegistryModel({
    required this.message,
  });

  factory ResponseRegistryModel.fromJson(Map<String, dynamic> json) =>
      ResponseRegistryModel(
        message: json["message"],
      );
}
