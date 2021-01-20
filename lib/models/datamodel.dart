// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
    DataModel({
        this.subtitle,
        this.title,
        this.body,
    });

    final String subtitle;
    final String title;
    final String body;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        subtitle: json["subtitle"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "subtitle": subtitle,
        "title": title,
        "body": body,
    };
}
