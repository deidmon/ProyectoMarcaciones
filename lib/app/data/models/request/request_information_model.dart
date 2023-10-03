class RequestInformationModel {
  String username;
  String password;

  RequestInformationModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "Usuario": username,
        "Contraseña": password,
      };
}
