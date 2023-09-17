// To parse this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'dart:convert';

SearchResult searchResultFromJson(String str) =>
    SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  bool? status;
  String? message;
  dynamic error;
  List<Result>? result;

  SearchResult({
    this.status,
    this.message,
    this.error,
    this.result,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        status: json["status"],
        message: json["message"],
        error: json["error"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "error": error,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  String? title;
  String? description;
  String? imageUrl;

  Result({
    this.title,
    this.description,
    this.imageUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        description: json["description"],
        imageUrl: json["image-url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image-url": imageUrl,
      };
}
