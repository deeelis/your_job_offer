// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_vacancies_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVacanciesDto _$ListVacanciesDtoFromJson(Map<String, dynamic> json) =>
    ListVacanciesDto(
      vacancies: (json['vacancies'] as List<dynamic>?)
              ?.map((e) => Vacancy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ListVacanciesDtoToJson(ListVacanciesDto instance) =>
    <String, dynamic>{
      'vacancies': instance.vacancies.map((e) => e.toJson()).toList(),
    };
