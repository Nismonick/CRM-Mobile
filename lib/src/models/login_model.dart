// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    bool ok;
    Usuario usuario;
    String msg;

    Login({
        this.ok,
        this.usuario,
        this.msg,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "msg": msg,
    };
}

class Usuario {
    String id;
    String username;
    String token;
    String rol;

    Usuario({
        this.id,
        this.username,
        this.token,
        this.rol,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        username: json["username"],
        token: json["token"],
        rol: json["rol"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "token": token,
        "rol": rol,
    };
}
