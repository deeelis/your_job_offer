import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/vacancy.dart';


part 'list_vacancies_dto.g.dart';
@JsonSerializable(explicitToJson: true)
class ListVacanciesDto {
  @JsonKey(defaultValue: [])
  final List<Vacancy> vacancies;

  ListVacanciesDto({required this.vacancies});

  factory ListVacanciesDto.fromJson(Map<String, dynamic> json) =>
      _$ListVacanciesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ListVacanciesDtoToJson(this);


}
