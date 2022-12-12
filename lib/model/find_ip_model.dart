// To parse this JSON data, do
//
//     final findCurrentIpModel = findCurrentIpModelFromJson(jsonString);


import 'dart:convert';

FindCurrentIpModel findCurrentIpModelFromJson(String str) => FindCurrentIpModel.fromJson(json.decode(str));

String findCurrentIpModelToJson(FindCurrentIpModel data) => json.encode(data.toJson());

class FindCurrentIpModel {
    FindCurrentIpModel({
        required this.ip,
    });

    String ip;

    factory FindCurrentIpModel.fromJson(Map<String, dynamic> json) => FindCurrentIpModel(
        ip: json["ip"],
    );

    Map<String, dynamic> toJson() => {
        "ip": ip,
    };
}
