class RequestAsistdiaModel {
    int idUsuarios;

    RequestAsistdiaModel({
        required this.idUsuarios,
    });
    Map<String, dynamic> toJson() => {
        "IdUsuarios": idUsuarios,
    };
}

