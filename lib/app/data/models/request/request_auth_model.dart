class RequestAuthModel {
  RequestAuthModel({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  Map<String, dynamic> toJson() => {
        'usuario': username,
        'contraseña': password,
      };
}
