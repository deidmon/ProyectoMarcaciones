class RequestAsistMesModel {
    int idUsuario;

    RequestAsistMesModel({
        required this.idUsuario,
    });
    Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
    };
}