// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vacancy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVacancyDto _$UserVacancyDtoFromJson(Map<String, dynamic> json) =>
    UserVacancyDto(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      vacancy: Vacancy.fromJson(json['vacancy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserVacancyDtoToJson(UserVacancyDto instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'vacancy': instance.vacancy.toJson(),
    };
