/* class ResponseAuthModel {
  String message;
  User? user;

  ResponseAuthModel({
    required this.message,
    this.user,
  });

  factory ResponseAuthModel.fromJson(Map<String, dynamic> json) {
    final message = json["message"];
    final userJson = json["user"];

    if (userJson != null) {
      return ResponseAuthModel(
        message: message,
        user: User.fromJson(userJson),
      );
    } else {
      return ResponseAuthModel(
        message: message,
      );
    }
  }
  // se agrego para el localsecurestorage
  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user,
      };
}

class User {
  int id;
  String username;
  String password;

  User({
    required this.id,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
      );

  // se agrego para el localsecurestorage
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
      };
}
 */

class ResponseAuthModel {
  bool error;
  int status;
  String body;

  ResponseAuthModel({
    required this.error,
    required this.status,
    required this.body,
  });

  factory ResponseAuthModel.fromJson(Map<String, dynamic> json) =>
      ResponseAuthModel(
        error: json["error"],
        status: json["status"],
        body: json["body"],
      );

  //local storage
  Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "body": body,
      };
}
