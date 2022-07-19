// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      name: json['name'] as String,
      s: (json['s'] as num?)?.toDouble() ?? 1,
      m: (json['m'] as num?)?.toDouble() ?? 1,
    )
      ..finalGrade = (json['finalGrade'] as num).toDouble()
      ..gradeLists = (json['gradeLists'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => Grade.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList()
      ..gradeListNames = (json['gradeListNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList();

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'name': instance.name,
      'finalGrade': instance.finalGrade,
      's': instance.s,
      'm': instance.m,
      'gradeLists': instance.gradeLists,
      'gradeListNames': instance.gradeListNames,
    };
