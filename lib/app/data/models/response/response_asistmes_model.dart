class ResponseAsistMes {
    bool error;
    int status;
    List<List<AsistMesBody>> asistMesBody;

    ResponseAsistMes({
        required this.error,
        required this.status,
        required this.asistMesBody,
    });

    factory ResponseAsistMes.fromJson(Map<String, dynamic> json) => ResponseAsistMes(
        error: json["error"],
        status: json["status"],
        asistMesBody: List<List<AsistMesBody>>.from(json["body"].map((x) => List<AsistMesBody>.from(x.map((x) => AsistMesBody.fromJson(x))))),
    );
}

class AsistMesBody {
    int idUsuarios;
    int? idDirec;
    String? direccion;
    DateTime? fecha;
    String? da;
    String? hora;
    int? idTMarcacion;
    int idValidacion;
    String descripcion;
    int? cantidad;

    AsistMesBody({
        required this.idUsuarios,
        this.idDirec,
        this.direccion,
        this.fecha,
        this.da,
        this.hora,
        this.idTMarcacion,
        required this.idValidacion,
        required this.descripcion,
        this.cantidad,
    });

    factory AsistMesBody.fromJson(Map<String, dynamic> json) => AsistMesBody(
        idUsuarios: json["IdUsuarios"],
        idDirec: json["IdDirec"],
        direccion: json["Direccion"],
        fecha: json["Fecha"] == null ? null : DateTime.parse(json["Fecha"]),
        da: json["Día"],
        hora: json["Hora"],
        idTMarcacion: json["idTMarcacion"],
        idValidacion: json["idValidacion"],
        descripcion: json["descripcion"],
        cantidad: json["Cantidad"],
    );
}