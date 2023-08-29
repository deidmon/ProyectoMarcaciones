class RequestRegistryModel {
  int userId;

  RequestRegistryModel({
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
      };
}
