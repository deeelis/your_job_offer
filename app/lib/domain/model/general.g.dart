// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      area_id: (json['area_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'area_id': instance.area_id,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      area_id: (json['area_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'area_id': instance.area_id,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      level: $enumDecodeNullable(_$LanguageLevelEnumEnumMap, json['level']),
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': _$LanguageLevelEnumEnumMap[instance.level],
    };

const _$LanguageLevelEnumEnumMap = {
  LanguageLevelEnum.a1: 'a1',
  LanguageLevelEnum.a2: 'a2',
  LanguageLevelEnum.b1: 'b1',
  LanguageLevelEnum.b2: 'b2',
  LanguageLevelEnum.c1: 'c1',
  LanguageLevelEnum.c2: 'c2',
  LanguageLevelEnum.l1: 'l1',
};

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'link': instance.link,
    };

Achievement _$AchievementFromJson(Map<String, dynamic> json) => Achievement(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$AchievementToJson(Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'link': instance.link,
    };

WorkExperience _$WorkExperienceFromJson(Map<String, dynamic> json) =>
    WorkExperience(
      id: (json['id'] as num?)?.toInt(),
      job: json['job'] as String?,
      workPlace: json['work_place'] as String?,
      description: json['description'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      finishDate: json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String),
    );

Map<String, dynamic> _$WorkExperienceToJson(WorkExperience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job': instance.job,
      'work_place': instance.workPlace,
      'description': instance.description,
      'start_date': instance.startDate?.toIso8601String(),
      'finish_date': instance.finishDate?.toIso8601String(),
    };

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      id: (json['id'] as num?)?.toInt(),
      institution: json['institution'] as String?,
      major: json['major'] as String?,
      degree: json['degree'] as String?,
      description: json['description'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      finishDate: json['finish_date'] == null
          ? null
          : DateTime.parse(json['finish_date'] as String),
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'id': instance.id,
      'institution': instance.institution,
      'major': instance.major,
      'degree': instance.degree,
      'description': instance.description,
      'start_date': instance.startDate?.toIso8601String(),
      'finish_date': instance.finishDate?.toIso8601String(),
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      id: (json['id'] as num?)?.toInt(),
      vacancy: json['vacancy'] == null
          ? null
          : Vacancy.fromJson(json['vacancy'] as Map<String, dynamic>),
      deadline: json['deadline'] as String?,
      date: json['date'] as String?,
      message: json['message'] as String?,
      status: $enumDecodeNullable(_$StageEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'id': instance.id,
      'vacancy': instance.vacancy?.toJson(),
      'deadline': instance.deadline,
      'date': instance.date,
      'message': instance.message,
      'status': _$StageEnumEnumMap[instance.status],
    };

const _$StageEnumEnumMap = {
  StageEnum.consideration: 'consideration',
  StageEnum.reject: 'reject',
  StageEnum.invite: 'invite',
  StageEnum.testing: 'testing',
  StageEnum.interview: 'interview',
};

ProfessionalRole _$ProfessionalRoleFromJson(Map<String, dynamic> json) =>
    ProfessionalRole(
      id: (json['id'] as num?)?.toInt(),
      role: (json['role_id'] as num?)?.toInt(),
    )..name = json['name'] as String?;

Map<String, dynamic> _$ProfessionalRoleToJson(ProfessionalRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role_id': instance.role,
      'name': instance.name,
    };
