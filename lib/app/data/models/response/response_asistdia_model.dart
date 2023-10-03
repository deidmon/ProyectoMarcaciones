class ResponseAsistDia {
    bool error;
    int status;
    List<AsistDiaBody> asistDiaBody;

    ResponseAsistDia({
        required this.error,
        required this.status,
        required this.asistDiaBody,
    });

    factory ResponseAsistDia.fromJson(Map<String, dynamic> json) => ResponseAsistDia(
        error: json["error"],
        status: json["status"],
        asistDiaBody: List<AsistDiaBody>.from(json["body"].map((x) => AsistDiaBody.fromJson(x))),
    );
}

class AsistDiaBody {
    int idTMarcacion;
    String hora;
    String tipoMarcacion;
    int idValidacion;
    String tipoValidacion;

    AsistDiaBody({
        required this.idTMarcacion,
        required this.hora,
        required this.tipoMarcacion,
        required this.idValidacion,
        required this.tipoValidacion,
    });

    factory AsistDiaBody.fromJson(Map<String, dynamic> json) => AsistDiaBody(
        idTMarcacion: json["idTMarcacion"],
        hora: json["Hora"],
        tipoMarcacion: json["Tipo marcación"],
        idValidacion: json["idValidacion"],
        tipoValidacion: json["Tipo Validación"],
    );
}