// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vacancy _$VacancyFromJson(Map<String, dynamic> json) => Vacancy(
      id: (json['id'] as num?)?.toInt(),
      job: json['job'] as String?,
      description: json['description'] as String?,
      minSalary: (json['min_salary'] as num?)?.toInt(),
      maxSalary: (json['max_salary'] as num?)?.toInt(),
      address: json['address'] as String?,
      link: json['link'] as String?,
      applyLink: json['apply_link'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      employer: json['employer'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      workType: $enumDecodeNullable(_$WorkTypeEnumEnumMap, json['work_type']),
      businessTripReadiness: $enumDecodeNullable(
          _$BusinessTripReadinessEnumEnumMap, json['business_trip_readiness']),
      workHours: (json['work_hours'] as num?)?.toInt(),
      relocation:
          $enumDecodeNullable(_$RelocationEnumEnumMap, json['relocation']),
      employment:
          $enumDecodeNullable(_$EmploymentEnumEnumMap, json['employment']),
      schedule: $enumDecodeNullable(_$ScheduleEnumEnumMap, json['schedule']),
      hasTest: json['has_test'] as bool?,
      requirement: json['requirement'] as String?,
      responsibility: json['responsibility'] as String?,
      area: json['area'] as String?,
      source: json['source'] as String?,
      idVacancyFromSource: json['id_vacancy_from_source'] as String?,
      status: (json['status'] as List<dynamic>?)
          ?.map((e) => Status.fromJson(e as Map<String, dynamic>))
          .toList(),
      professionalRole: json['professional_role'] == null
          ? null
          : ProfessionalRole.fromJson(
              json['professional_role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VacancyToJson(Vacancy instance) => <String, dynamic>{
      'id': instance.id,
      'job': instance.job,
      'description': instance.description,
      'min_salary': instance.minSalary,
      'max_salary': instance.maxSalary,
      'address': instance.address,
      'link': instance.link,
      'apply_link': instance.applyLink,
      'phone': instance.phone,
      'email': instance.email,
      'employer': instance.employer,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'work_type': _$WorkTypeEnumEnumMap[instance.workType],
      'business_trip_readiness':
          _$BusinessTripReadinessEnumEnumMap[instance.businessTripReadiness],
      'work_hours': instance.workHours,
      'relocation': _$RelocationEnumEnumMap[instance.relocation],
      'employment': _$EmploymentEnumEnumMap[instance.employment],
      'schedule': _$ScheduleEnumEnumMap[instance.schedule],
      'has_test': instance.hasTest,
      'requirement': instance.requirement,
      'responsibility': instance.responsibility,
      'area': instance.area,
      'source': instance.source,
      'id_vacancy_from_source': instance.idVacancyFromSource,
      'status': instance.status?.map((e) => e.toJson()).toList(),
      'professional_role': instance.professionalRole?.toJson(),
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
