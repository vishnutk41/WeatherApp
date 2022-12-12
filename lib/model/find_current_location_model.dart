// To parse this JSON data, do
//
//     final findPlaceNameModel = findPlaceNameModelFromJson(jsonString);


import 'dart:convert';

FindPlaceNameModel findPlaceNameModelFromJson(String str) => FindPlaceNameModel.fromJson(json.decode(str));

String findPlaceNameModelToJson(FindPlaceNameModel data) => json.encode(data.toJson());

class FindPlaceNameModel {
    FindPlaceNameModel({
        required this.ip,
        required this.city,
        required this.region,
        required this.country,
        required this.loc,
        required this.org,
        required this.postal,
        required this.timezone,
        required this.readme,
    });

    String ip;
    String city;
    String region;
    String country;
    String loc;
    String org;
    String postal;
    String timezone;
    String readme;

    factory FindPlaceNameModel.fromJson(Map<String, dynamic> json) => FindPlaceNameModel(
        ip: json["ip"],
        city: json["city"],
        region: json["region"],
        country: json["country"],
        loc: json["loc"],
        org: json["org"],
        postal: json["postal"],
        timezone: json["timezone"],
        readme: json["readme"],
    );

    Map<String, dynamic> toJson() => {
        "ip": ip,
        "city": city,
        "region": region,
        "country": country,
        "loc": loc,
        "org": org,
        "postal": postal,
        "timezone": timezone,
        "readme": readme,
    };
}
