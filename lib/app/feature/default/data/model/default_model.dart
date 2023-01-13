import 'dart:convert';

import '../../domain/entity/user_entity.dart';

class DefaultModel extends DefaultEntity {
  DefaultModel({
    required super.name,
  });

  static DefaultModel init() {
    return DefaultModel(
      name: 'Test',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory DefaultModel.fromMap(Map<String, dynamic> map) {
    return DefaultModel(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DefaultModel.fromJson(String source) => DefaultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
