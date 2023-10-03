class ResponseValidacionModel {
    bool error;
    int status;
    List<Body> body;

    ResponseValidacionModel({
        required this.error,
        required this.status,
        required this.body,
    });

    factory ResponseValidacionModel.fromJson(Map<String, dynamic> json) => ResponseValidacionModel(
        error: json["error"],
        status: json["status"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
    );
}

class Body {
    int idValidacion;
    String descripcion;

    Body({
        required this.idValidacion,
        required this.descripcion,
    });

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        idValidacion: json["idValidacion"],
        descripcion: json["descripcion"],
    );
}
