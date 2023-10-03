class ResponseInformationModel {
  bool error;
  int status;
  List<Body> body;

  ResponseInformationModel({
    required this.error,
    required this.status,
    required this.body,
  });

  factory ResponseInformationModel.fromJson(Map<String, dynamic> json) =>
      ResponseInformationModel(
        error: json["error"],
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );
}

class Body {
  int idUsuarios;
  String nombres;
  String apellidos;
  int activo;
  String usuario;
  int idRol;
  int idDirec;
  String direccionPrimaria;
  int idDirecSecu;
  String direccionSecundaria;

  Body({
    required this.idUsuarios,
    required this.nombres,
    required this.apellidos,
    required this.activo,
    required this.usuario,
    required this.idRol,
    required this.idDirec,
    required this.direccionPrimaria,
    required this.idDirecSecu,
    required this.direccionSecundaria,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        idUsuarios: json["IdUsuarios"],
        nombres: json["Nombres"],
        apellidos: json["Apellidos"],
        activo: json["Activo"],
        usuario: json["Usuario"],
        idRol: json["IdRol"],
        idDirec: json["IdDirec"],
        direccionPrimaria: json["DireccionPrimaria"],
        idDirecSecu: json["IdDirecSecu"],
        direccionSecundaria: json["DireccionSecundaria"],
      );
}
