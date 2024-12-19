// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      login: json['login'] as String,
      password: json['password'] as String,
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middle_name'] as String?,
      photo: json['photo'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumEnumMap, json['gender']),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      cv: json['cv'] as String?,
      description: json['description'] as String?,
      workType: $enumDecodeNullable(_$WorkTypeEnumEnumMap, json['work_type']),
      minSalary: (json['min_salary'] as num?)?.toInt(),
      maxSalary: (json['max_salary'] as num?)?.toInt(),
      businessTripReadiness: $enumDecodeNullable(
          _$BusinessTripReadinessEnumEnumMap, json['business_trip_readiness']),
      workHours: (json['work_hours'] as num?)?.toInt(),
      relocation:
          $enumDecodeNullable(_$RelocationEnumEnumMap, json['relocation']),
      employment:
          $enumDecodeNullable(_$EmploymentEnumEnumMap, json['employment']),
      schedule: $enumDecodeNullable(_$ScheduleEnumEnumMap, json['schedule']),
      hhResumeId: json['hh_resume_id'] as String?,
      educationLevel: $enumDecodeNullable(
          _$EducationLevelEnumEnumMap, json['education_level']),
      citizenship:
          $enumDecodeNullable(_$CitizenshipEnumEnumMap, json['citizenship']),
      professionalRole: json['professional_role'] == null
          ? null
          : ProfessionalRole.fromJson(
              json['professional_role'] as Map<String, dynamic>),
      innerEmail: json['inner_email'] as String?,
      innerEmailPassword: json['inner_email_password'] as String?,
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      achievements: (json['achievements'] as List<dynamic>?)
              ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      workExperiences: (json['work_experiences'] as List<dynamic>?)
              ?.map((e) => WorkExperience.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      educations: (json['educations'] as List<dynamic>?)
              ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      statuses: (json['status'] as List<dynamic>?)
              ?.map((e) => Status.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'password': instance.password,
      'birth_date': instance.birthDate?.toIso8601String(),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middle_name': instance.middleName,
      'photo': instance.photo,
      'gender': _$GenderEnumEnumMap[instance.gender],
      'phone': instance.phone,
      'email': instance.email,
      'city': instance.city?.toJson(),
      'country': instance.country?.toJson(),
      'cv': instance.cv,
      'description': instance.description,
      'work_type': _$WorkTypeEnumEnumMap[instance.workType],
      'min_salary': instance.minSalary,
      'max_salary': instance.maxSalary,
      'business_trip_readiness':
          _$BusinessTripReadinessEnumEnumMap[instance.businessTripReadiness],
      'work_hours': instance.workHours,
      'relocation': _$RelocationEnumEnumMap[instance.relocation],
      'employment': _$EmploymentEnumEnumMap[instance.employment],
      'schedule': _$ScheduleEnumEnumMap[instance.schedule],
      'hh_resume_id': instance.hhResumeId,
      'education_level': _$EducationLevelEnumEnumMap[instance.educationLevel],
      'citizenship': _$CitizenshipEnumEnumMap[instance.citizenship],
      'professional_role': instance.professionalRole?.toJson(),
      'inner_email': instance.innerEmail,
      'inner_email_password': instance.innerEmailPassword,
      'projects': instance.projects?.map((e) => e.toJson()).toList(),
      'achievements': instance.achievements?.map((e) => e.toJson()).toList(),
      'work_experiences':
          instance.workExperiences?.map((e) => e.toJson()).toList(),
      'educations': instance.educations?.map((e) => e.toJson()).toList(),
      'skills': instance.skills?.map((e) => e.toJson()).toList(),
      'languages': instance.languages?.map((e) => e.toJson()).toList(),
      'status': instance.statuses?.map((e) => e.toJson()).toList(),
    };

const _$GenderEnumEnumMap = {
  GenderEnum.male: 'male',
  GenderEnum.female: 'female',
};

const _$WorkTypeEnumEnumMap = {
  WorkTypeEnum.office: 'office',
  WorkTypeEnum.remote: 'remote',
  WorkTypeEnum.hybrid: 'hybrid',
  WorkTypeEnum.field_work: 'field_work',
};

const _$BusinessTripReadinessEnumEnumMap = {
  BusinessTripReadinessEnum.ready: 'ready',
  BusinessTripReadinessEnum.sometimes: 'sometimes',
  BusinessTripReadinessEnum.never: 'never',
};

const _$RelocationEnumEnumMap = {
  RelocationEnum.no_relocation: 'no_relocation',
  RelocationEnum.relocation_possible: 'relocation_possible',
  RelocationEnum.relocation_desirable: 'relocation_desirable',
};

const _$EmploymentEnumEnumMap = {
  EmploymentEnum.full: 'full',
  EmploymentEnum.part: 'part',
  EmploymentEnum.project: 'project',
  EmploymentEnum.volunteer: 'volunteer',
  EmploymentEnum.probation: 'probation',
};

const _$ScheduleEnumEnumMap = {
  ScheduleEnum.fullDay: 'fullDay',
  ScheduleEnum.shift: 'shift',
  ScheduleEnum.flexible: 'flexible',
  ScheduleEnum.remote: 'remote',
  ScheduleEnum.flyInFlyOut: 'flyInFlyOut',
};

const _$EducationLevelEnumEnumMap = {
  EducationLevelEnum.secondary: 'secondary',
  EducationLevelEnum.special_secondary: 'special_secondary',
  EducationLevelEnum.unfinished_higher: 'unfinished_higher',
  EducationLevelEnum.higher: 'higher',
  EducationLevelEnum.bachelor: 'bachelor',
  EducationLevelEnum.master: 'master',
  EducationLevelEnum.candidate: 'candidate',
  EducationLevelEnum.doctor: 'doctor',
};

const _$CitizenshipEnumEnumMap = {
  CitizenshipEnum.rf: 'rf',
  CitizenshipEnum.another: 'another',
};
