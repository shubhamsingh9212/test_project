import 'dart:convert';

import 'package:get/get.dart';

DummyResponse dummyResponseFromJson(String str) =>
    DummyResponse.fromJson(json.decode(str));

String dummyResponseToJson(DummyResponse data) => json.encode(data.toJson());

class DummyResponse {
  String? title;
  String? name;
  String? slug;
  String? description;
  DummyResponseSchema? schema;
  DummyResponse({
    this.title,
    this.name,
    this.slug,
    this.description,
    this.schema,
  });

  factory DummyResponse.fromJson(Map json) => DummyResponse(
        title: json["title"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        schema: json["schema"] == null
            ? null
            : DummyResponseSchema.fromJson(json["schema"]),
      );

  Map toJson() => {
        "title": title,
        "name": name,
        "slug": slug,
        "description": description,
        "schema": schema?.toJson(),
      };
}

class DummyResponseSchema {
  List? fields;

  DummyResponseSchema({
    this.fields,
  });

  factory DummyResponseSchema.fromJson(Map json) => DummyResponseSchema(
        fields: json["fields"] == null
            ? []
            : List.from(json["fields"]!.map((x) => PurpleField.fromJson(x))),
      );

  Map toJson() => {
        "fields":
            fields == null ? [] : List.from(fields!.map((x) => x.toJson())),
      };
}

class PurpleField {
  String? type;

  int? version;

  PurpleSchema? schema;

  PurpleField({
    this.type,
    this.version,
    this.schema,
  });

  factory PurpleField.fromJson(Map json) => PurpleField(
        type: json["type"],
        version: json["version"],
        schema: json["schema"] == null
            ? null
            : PurpleSchema.fromJson(json["schema"]),
      );

  Map toJson() => {
        "type": type,
        "version": version,
        "schema": schema?.toJson(),
      };
}

class PurpleSchema {
  String? name;
  String? label;
  dynamic hidden;
  bool? readonly;
  List? options;
  RxString? selectedIndex = "0".obs;
  List? fields;

  PurpleSchema({
    this.name,
    this.label,
    this.hidden,
    this.readonly,
    this.options,
    this.fields,
    this.selectedIndex,
  });

  factory PurpleSchema.fromJson(Map json) => PurpleSchema(
        name: json["name"],
        label: json["label"],
        hidden: json["hidden"],
        readonly: json["readonly"],
        selectedIndex: "0".obs,
        options: json["options"] == null
            ? []
            : List.from(json["options"]!.map((x) => Option.fromJson(x))),
        fields: json["fields"] == null
            ? []
            : List.from(json["fields"]!.map((x) => FluffyField.fromJson(x))),
      );

  Map toJson() => {
        "name": name,
        "label": label,
        "hidden": hidden,
        "readonly": readonly,
        "selectedIndex": selectedIndex,
        "options":
            options == null ? [] : List.from(options!.map((x) => x.toJson())),
        "fields":
            fields == null ? [] : List.from(fields!.map((x) => x.toJson())),
      };
}

class FluffyField {
  String? type;

  int? version;

  FluffySchema? schema;

  FluffyField({
    this.type,
    this.version,
    this.schema,
  });

  factory FluffyField.fromJson(Map json) => FluffyField(
        type: json["type"],
        version: json["version"],
        schema: json["schema"] == null
            ? null
            : FluffySchema.fromJson(json["schema"]),
      );

  Map toJson() => {
        "type": type,
        "version": version,
        "schema": schema?.toJson(),
      };
}

class FluffySchema {
  String? name;

  String? label;

  bool? hidden;

  bool? readonly;

  List? options;

  FluffySchema({
    this.name,
    this.label,
    this.hidden,
    this.readonly,
    this.options,
  });

  factory FluffySchema.fromJson(Map<String, dynamic> json) => FluffySchema(
        name: json["name"],
        label: json["label"],
        hidden: json["hidden"],
        readonly: json["readonly"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "hidden": hidden,
        "readonly": readonly,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  String? key;

  String? value;

  Option({
    this.key,
    this.value,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
